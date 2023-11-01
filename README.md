# Arduino Uno Cmake Build
IDE-Free small demo of using CMake to build and upload .hex files for an arduino uno from scratch. Features the arduino avr core as a submodule. 

## Requirements
For this to work, you need to have installed on your system: (This is checked by CMake)
 - avrdude
 - avr-libc
 - avr-gcc
## Contents
- **blink example**: standard blink example that can be uploaded to the board with.
- **arduino uno core module** CMake module that defines a static library with the arduino uno core with which projects can link wihth.
- **arduino uno toolchain file** CMake toolchain file that defines the cross-compilation environment for arduino uno
- **search tools** CMake module that provides macros to find C and C++ source files and directories inside a specified directory.

## Using
- To use this, create you source and header files and organize them as you normally would, then link/add them to the ArduinoUno.elf executable in the top-level CMake file, without breaking the link with the arduino uno core static library.
- Use the provided **build** and **upload** shells scripts to 1) build an ArduinoUno.elf of your program and copy it to an .hex format 2) Same as 1) but also upload it to the board. You may need to alter the upload shell script to specify the serial port through which you want to access your arduino uno.
## Future Work
-Currently only arduino uno is supported, but that is because I only did this for educational purposes and have no need to support more platforms. Other arduino boards could easily be supported with a bit of time investment and other boards could also be supported eventually.
-Create a unit test build configuration based on **cpputest** or equivalent where a host executable in generated. In build configuration some elements would be replaced by test doubles so that elements under test could be tested in isolation, and this source management would be made by CMake. This build + run tests process would also be managed with appropriate shell scripts.
