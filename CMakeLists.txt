
cmake_minimum_required(VERSION 3.21)

project(
  ArduinoProject
  VERSION 1.0
  LANGUAGES CXX C)

set (CMAKE_MODULE_PATH cmake/modules)

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


#find_package(CppUTest REQUIRED)

add_executable(Arduino.elf)

include(arduino_core)

target_sources(Arduino.elf PRIVATE
    src/main.cpp)
target_link_libraries(Arduino.elf PRIVATE
    ArduinoCore
)




#target_link_libraries(ArduinoProject PRIVATE
#    CppUTest
#    CppUTestExt)

#require gcc-avr and avrdude and avr-libc
