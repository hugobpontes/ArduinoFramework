message(STATUS "Setting up toolchain")

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)

set(CMAKE_C_COMPILER /usr/bin/avr-gcc)
set(CMAKE_CXX_COMPILER /usr/bin/avr-g++)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE NEVER)

#dont try to check if compiler works since we are cross compiling
set(CMAKE_C_COMPILER_WORKS 1) 
set(CMAKE_CXX_COMPILER_WORKS 1)

#optimization (-Os) must be set but other optimizations can be used
set (RecommendedCxxFlags "-g -Os  -Wextra -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -Wno-error=narrowing -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR")
set (RecommendedCFlags "-g -Os  -Wextra -std=c11 -fno-exceptions -ffunction-sections -fdata-sections -Wno-error=narrowing -MMD -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR")
set (MinimumCxxFlags " -Os  -Wextra -std=gnu++11 -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR")
set (MinimumCFlags " -Os  -Wextra -std=c11 -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=10810 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR")

set (CMAKE_CXX_FLAGS ${RecommendedCxxFlags}) 
set (CMAKE_C_FLAGS ${RecommendedCFlags})


