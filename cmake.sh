#!/bin/sh

PWD=$(pwd)
BUILD_DIR="${PWD}/build"
echo "BUILD_DIR: ${BUILD_DIR}"

cmake \
    -H${PWD} \
    -B${BUILD_DIR} \
    -G"Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=install \

make -C ${BUILD_DIR} -j8

if [ "$?" -ne "0" ]; then
    echo "\n"
    echo "Compile failed."
    exit 1
fi

make -C ${BUILD_DIR} install
    
echo "\n"
echo "Compile succeeded."

