
cmake_minimum_required(VERSION 3.21)

project(
  ArduinoProject
  VERSION 1.0
  LANGUAGES CXX C)

set (CMAKE_MODULE_PATH cmake/modules)



message(CMAKE_C_FLAGS = ${CMAKE_C_FLAGS})

#find_package(CppUTest REQUIRED)

add_executable(ArduinoBin)

include(arduino_core)

target_sources(ArduinoBin PRIVATE
    src/main.cpp)
target_link_libraries(ArduinoBin PRIVATE
    ArduinoCore
)




#target_link_libraries(ArduinoProject PRIVATE
#    CppUTest
#    CppUTestExt)

#require gcc-avr and avrdude and avr-libc
