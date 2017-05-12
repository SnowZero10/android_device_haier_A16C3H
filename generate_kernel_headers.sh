#!/bin/bash
# script for generating kernel headers without compiling the kernel itself

#codeaurora
mkdir -p $OUT/obj/KERNEL_OBJ
cd $ANDROID_BUILD_TOP/kernel
make headers_install O=$OUT/obj/KERNEL_OBJ ARCH=arm CROSS_COMPILE=arm-eabi-
cd $ANDROID_BUILD_TOP
