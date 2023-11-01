
cmake_minimum_required(VERSION 3.21)

project(
  ArduinoProject
  VERSION 1.0
  LANGUAGES CXX C)

#set path to where arduino modules can be found  
set (CMAKE_MODULE_PATH cmake/modules)

#check dependencies
find_program(AVRDUDE avrdude)

if(NOT AVRDUDE)
    message(FATAL_ERROR "avrdude not found. Please install it to continue.")
endif()

find_program(AVR_GCC avr-gcc)

if(NOT AVR_GCC)
    message(FATAL_ERROR "avr-gcc not found. Please install it to continue.")
endif()

if (NOT (EXISTS /usr/lib/avr/include))
    # This is a bad temporary method, that I'll try to fix it in the future
    # but I could not find avr-libc any other way"
    message(FATAL_ERROR "avr-libc not found. Please install it to continue.")
endif()

#include arduino uno core library 
include(arduino_uno_core)

add_executable(Arduino.elf)

target_sources(Arduino.elf PRIVATE
    src/main.cpp)
target_link_libraries(Arduino.elf PRIVATE
    ArduinoCore
)

#requires gcc-avr and avrdude and avr-libc
