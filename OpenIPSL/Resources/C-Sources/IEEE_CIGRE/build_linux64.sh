#!/bin/sh
# Builds, tests and installs the IEEE/CIGRE model libraries of OpenIPSL for linux64 with gcc.
# Result: ../../Library/linux64/libSCRX9.so and libGFM_GFL_IBR.so
#
# Usage: sh build_linux64.sh [build folder]        (default build folder: /tmp/cigre_build_linux64)
# Shipped binaries were built on Ubuntu 26.04.1 LTS under WSL2 (gcc 15.2.0, glibc 2.43, CMake 4.2.3);
# from Windows: wsl.exe -d Ubuntu-26.04 -- sh /mnt/<drive>/<path>/build_linux64.sh
# Needs: gcc, cmake (sudo apt-get install -y build-essential cmake).
#
# Copyright (c) 2016-2026 Luigi Vanfretti, ALSETLab (formerly SmarTS Lab) and contributors.
# BSD 3-Clause License, see the LICENSE file of OpenIPSL.
set -eu
SOURCE_DIR=$(cd "$(dirname "$0")" && pwd)
BUILD_DIR=${1:-/tmp/cigre_build_linux64}

cmake -S "$SOURCE_DIR" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release
cmake --build "$BUILD_DIR"
ctest --test-dir "$BUILD_DIR" --output-on-failure
cmake --install "$BUILD_DIR"
