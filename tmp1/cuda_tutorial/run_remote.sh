#!/bin/bash
set -x

export PROJECT_ROOT="/home/a/W/Cuda/cuda_clion_tutorial"
export PROJECT_NAME="MyCudaTutorial"
export PROJECT_BUILDDIR="cbuild"
export PROJECT_PATH=${PROJECT_ROOT}/${PROJECT_BUILDDIR}
export PROJECT_BUILDPATH=${PROJECT_ROOT}/${PROJECT_BUILDDIR}/${PROJECT_NAME}

export DISPLAY=L0:0.0

cd ${PROJECT_PATH}


chmod 755 ${PROJECT_NAME}
#${PROJECT_BUILDPATH}

sleep 1

./${PROJECT_NAME}

nvprof - ./${PROJECT_NAME}
nvvp ./${PROJECT_NAME}

sleep 10