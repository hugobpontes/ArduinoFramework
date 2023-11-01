#!/bin/bash

BuildFolder="./build"
SourceFolder="."
ExecName="ArduinoUno"
ToolchainFile="./cmake/toolchain_files/arduino_uno_toolchain.cmake"

echo "Building Firmware"
cmake  cmake -B${BuildFolder}  -S${SourceFolder} -DCMAKE_TOOLCHAIN_FILE=${ToolchainFile}
cmake --build ${BuildFolder} 
avr-objcopy -O ihex -j .text -j .data build/${ExecName}.elf build/${ExecName}.hex -v
