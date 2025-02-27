#!/bin/sh -e

rm -rf ./build

mkdir -p build
cd build

cmake -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=../toolchain/cc65-toolchain.cmake ..
make
xxd -p os.bin > os.hex