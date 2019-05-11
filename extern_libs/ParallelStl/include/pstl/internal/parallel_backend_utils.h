// -*- C++ -*-
//===-- parallel_backend_utils.h ------------------------------------------===//
//
// Copyright (C) 2017-2019 Intel Corporation
//
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
// This file incorporates work covered by the following copyright and permission
// notice:
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
//
//===----------------------------------------------------------------------===//

#ifndef __PSTL_parallel_backend_utils_H
#define __PSTL_parallel_backend_utils_H

#include <iterator>
#include <utility>
#include <cassert>
#include "utils.h"

namespace __pstl
{
namespace par_backend
{

//! Destroy sequence [xs,xe)
struct serial_destroy
{
    template <typename _RandomAccessIterator>
    void
    operator()(_RandomAccessIterator __zs, _RandomAccessIterator __ze)
    {
        typedef typename std::iterator_traits<_RandomAccessIterator>::value_type _ValueType;
        while (__zs != __ze)
        {
            --__ze;
            (*__ze).~_ValueType();
        }
    }
};

//! Merge sequences [__xs,__xe) and [__ys,__ye) to output sequence [__zs,(__xe-__xs)+(__ye-__ys)), using std::move
struct serial_move_merge
{
    const std::size_t _M_nmerge;

    explicit serial_move_merge(std::size_t __nmerge) : _M_nmerge(__nmerge) {}
    template <class _RandomAccessIterator1, class _RandomAccessIterator2, class _RandomAccessIterator3, class _Compare,
              class _MoveValueX, class _MoveValueY, class _MoveSequenceX, class _MoveSequenceY>
    void
    operator()(_RandomAccessIterator1 __xs, _RandomAccessIterator1 __xe, _RandomAccessIterator2 __ys,
               _RandomAccessIterator2 __ye, _RandomAccessIterator3 __zs, _Compare __comp, _MoveValueX __move_value_x,
               _MoveValueY __move_value_y, _MoveSequenceX __move_sequence_x, _MoveSequenceY __move_sequence_y)
    {
        constexpr bool same_move_val = std::is_same<_MoveValueX, _MoveValueY>::value;
        constexpr bool same_move_seq = std::is_same<_MoveSequenceX, _MoveSequenceY>::value;

        auto __n = _M_nmerge;
        assert(__n > 0);

        auto __nx = __xe - __xs;
        //auto __ny = __ye - __ys;
        _RandomAccessIterator3 __zs_beg = __zs;

        if (__xs != __xe)
        {
            if (__ys != __ye)
            {
                for (;;)
                {
                    if (__comp(*__ys, *__xs))
                    {
                        const auto i = __zs - __zs_beg;
                        if (i < __nx)
                            __move_value_x(__ys, __zs);
                        else
                            __move_value_y(__ys, __zs);
                        ++__zs, --__n;
                        if (++__ys == __ye)
                        {
                            break;
                        }
                        else if (__n == 0)
                        {
                            const auto i = __zs - __zs_beg;
                            if (same_move_seq || i < __nx)
                                __zs = __move_sequence_x(__ys, __ye, __zs);
                            else
                                __zs = __move_sequence_y(__ys, __ye, __zs);
                            break;
                        }
                    }
                    else
                    {
                        const auto i = __zs - __zs_beg;
                        if (same_move_val || i < __nx)
                            __move_value_x(__xs, __zs);
                        else
                            __move_value_y(__xs, __zs);
                        ++__zs, --__n;
                        if (++__xs == __xe)
                        {
                            const auto i = __zs - __zs_beg;
                            if (same_move_seq || i < __nx)
                                __move_sequence_x(__ys, __ye, __zs);
                            else
                                __move_sequence_y(__ys, __ye, __zs);
                            return;
                        }
                        else if (__n == 0)
                        {
                            const auto i = __zs - __zs_beg;
                            if (same_move_seq || i < __nx)
                            {
                                __zs = __move_sequence_x(__xs, __xe, __zs);
                                __move_sequence_x(__ys, __ye, __zs);
                            }
                            else
                            {
                                __zs = __move_sequence_y(__xs, __xe, __zs);
                                __move_sequence_y(__ys, __ye, __zs);
                            }
                            return;
                        }
                    }
                }
            }
            __ys = __xs;
            __ye = __xe;
        }
        const auto i = __zs - __zs_beg;
        if (same_move_seq || i < __nx)
            __move_sequence_x(__ys, __ye, __zs);
        else
            __move_sequence_y(__ys, __ye, __zs);
    }
};

template <typename _RandomAccessIterator1, typename _OutputIterator>
void
init_buf(_RandomAccessIterator1 __xs, _RandomAccessIterator1 __xe, _OutputIterator __zs, bool __bMove)
{
    const _OutputIterator __ze = __zs + (__xe - __xs);
    typedef typename std::iterator_traits<_OutputIterator>::value_type _ValueType;
    if (__bMove)
    {
        // Initialize the temporary buffer and move keys to it.
        for (; __zs != __ze; ++__xs, ++__zs)
            new (&*__zs) _ValueType(std::move(*__xs));
    }
    else
    {
        // Initialize the temporary buffer
        for (; __zs != __ze; ++__zs)
            new (&*__zs) _ValueType;
    }
}

template <typename _Buf>
class stack
{
    typedef typename std::iterator_traits<decltype(std::declval<_Buf>().get())>::value_type _ValueType;
    typedef typename std::iterator_traits<_ValueType*>::difference_type _DifferenceType;

    _Buf _M_buf;
    _ValueType* _M_ptr;
    _DifferenceType _M_maxsize;

    stack(const stack&) = delete;
    void
    operator=(const stack&) = delete;

  public:
    template <typename _ExecutionPolicy>
    stack(_ExecutionPolicy&& __exec, _DifferenceType __max_size)
        : _M_buf(std::forward<_ExecutionPolicy>(__exec), __max_size), _M_maxsize(__max_size)
    {
        _M_ptr = _M_buf.get();
    }

    ~stack()
    {
        assert(size() <= _M_maxsize);
        while (!empty())
            pop();
    }

    const _Buf&
    buffer() const
    {
        return _M_buf;
    }
    size_t
    size() const
    {
        assert(_M_ptr - _M_buf.get() <= _M_maxsize);
        assert(_M_ptr - _M_buf.get() >= 0);
        return _M_ptr - _M_buf.get();
    }
    bool
    empty() const
    {
        assert(_M_ptr >= _M_buf.get());
        return _M_ptr == _M_buf.get();
    }
    void
    push(const _ValueType& __v)
    {
        assert(size() < _M_maxsize);
        new (_M_ptr) _ValueType(__v);
        ++_M_ptr;
    }
    const _ValueType&
    top() const
    {
        return *(_M_ptr - 1);
    }
    void
    pop()
    {
        assert(_M_ptr > _M_buf.get());
        --_M_ptr;
        (*_M_ptr).~_ValueType();
    }
};

} // namespace par_backend
} // namespace __pstl

#endif /* __PSTL_parallel_backend_utils_H */
