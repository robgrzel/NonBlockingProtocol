# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/egrzrbr/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/191.6707.69/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/egrzrbr/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/191.6707.69/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug

# Include any dependencies generated for this target.
include src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/depend.make

# Include the progress variables for this target.
include src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/progress.make

# Include the compile flags for this target's objects.
include src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/flags.make

src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.o: src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/flags.make
src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.o: ../src/bin/ompi/examples/mpi_tests.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.o"
	cd /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/src/bin/ompi/examples && /usr/bin/g++-8  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.o -c /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/src/bin/ompi/examples/mpi_tests.cpp

src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.i"
	cd /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/src/bin/ompi/examples && /usr/bin/g++-8 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/src/bin/ompi/examples/mpi_tests.cpp > CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.i

src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.s"
	cd /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/src/bin/ompi/examples && /usr/bin/g++-8 $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/src/bin/ompi/examples/mpi_tests.cpp -o CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.s

# Object files for target OpenMPI_Tests
OpenMPI_Tests_OBJECTS = \
"CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.o"

# External object files for target OpenMPI_Tests
OpenMPI_Tests_EXTERNAL_OBJECTS =

../target/debug/bin/OpenMPI_Tests: src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/mpi_tests.cpp.o
../target/debug/bin/OpenMPI_Tests: src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/build.make
../target/debug/bin/OpenMPI_Tests: src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../../../../target/debug/bin/OpenMPI_Tests"
	cd /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/src/bin/ompi/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OpenMPI_Tests.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/build: ../target/debug/bin/OpenMPI_Tests

.PHONY : src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/build

src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/clean:
	cd /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/src/bin/ompi/examples && $(CMAKE_COMMAND) -P CMakeFiles/OpenMPI_Tests.dir/cmake_clean.cmake
.PHONY : src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/clean

src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/depend:
	cd /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/src/bin/ompi/examples /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/src/bin/ompi/examples /home/egrzrbr/W/W.priv/HPC/NonBlockingProtocol/cmake-build-debug/src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/bin/ompi/examples/CMakeFiles/OpenMPI_Tests.dir/depend

