
cmake_minimum_required(VERSION 3.21)

project(
  ArduinoProject
  VERSION 1.0
  LANGUAGES CXX)

find_package(CppUTest REQUIRED)

add_executable(ArduinoBin)

target_link_libraries(ArduinoProject PRIVATE
    CppUTest
    CppUTestExt)

#require gcc-avr and avrdude
