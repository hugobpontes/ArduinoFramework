#!/bin/bash

BuildFolder="./build"
BuildConfig=""
SourceFolder="."
ExecName=""
ToolchainFile="./cmake/toolchain_files/arduino_toolchain.cmake"

echo "Building Firmware"
cmake  cmake -B${BuildFolder}  -S${SourceFolder} -DCMAKE_BUILD_TYPE=${BuildConfig} -DCMAKE_TOOLCHAIN_FILE=./cmake/toolchain_files/arduino_toolchain.cmake
cmake --build ${BuildFolder} 