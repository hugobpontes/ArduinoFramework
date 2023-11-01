message(STATUS "Adding arduino core")

# file glob is a bad way to find src files since every time a new file is added
# or removed, it isnt updated. Since this is collecting sources from a fixed 
# arduino core, this is tollerable. 

set (arduino_cores_arduino_path ArduinoCore-avr/cores/arduino)
set (arduino_drivers_path ArduinoCore-avr/drivers)
set (arduino_bootloaders_path ArduinoCore-avr/bootloaders)
set (arduino_extras_path ArduinoCore-avr/extras)
set (arduino_firmwares_path ArduinoCore-avr/firmwares)
set (arduino_libraries_path ArduinoCore-avr/libraries)
set (arduino_variants_path ArduinoCore-avr/variants)


file(GLOB arduino_core_arduino_src
     "${arduino_cores_arduino_path}/*.h"
     "${arduino_cores_arduino_path}/*.cpp"
     "${arduino_cores_arduino_path}/*.hpp"
     "${arduino_cores_arduino_path}/*.c"
)

file(GLOB_RECURSE arduino_drivers_src
     "${arduino_drivers_path}/*.h"
     "${arduino_drivers_path}/*.cpp"
     "${arduino_drivers_path}/*.hpp"
     "${arduino_drivers_path}/*.c"
)

file(GLOB_RECURSE arduino_extras_src
     "${arduino_extras_path}/*.h"
     "${arduino_extras_path}/*.cpp"
     "${arduino_extras_path}/*.hpp"
     "${arduino_extras_path}/*.c"
)

file(GLOB_RECURSE arduino_firmwares_src
     "${arduino_firmwares_path}/*.h"
     "${arduino_firmwares_path}/*.cpp"
     "${arduino_firmwares_path}/*.hpp"
     "${arduino_firmwares_path}/*.c"
)

file(GLOB_RECURSE arduino_libraries_src
     "${arduino_libraries_path}/*.h"
     "${arduino_libraries_path}/*.cpp"
     "${arduino_libraries_path}/*.hpp"
     "${arduino_libraries_path}/*.c"
)

set (arduino_variants_src ${arduino_variants_path}/standard/pins_arduino.h)

set (arduino_srcs  ${arduino_core_arduino_src} ${arduino_variants_src} ${arduino_libraries_src} ${arduino_firmwares_src} ${arduino_extras_src} ${arduino_drivers_src} )

message (arduino_core_arduino_src = ${arduino_core_arduino_src})

add_library(ArduinoCore STATIC)
target_sources(ArduinoCore PRIVATE  ${arduino_srcs})

file(GLOB_RECURSE core_files_and_dirs LIST_DIRECTORIES true "${CMAKE_SOURCE_DIR}/ArduinoCore-avr/*")
foreach(item ${core_files_and_dirs})
	if(IS_DIRECTORY ${item})
		target_include_directories(ArduinoCore PUBLIC ${item})
	endif()
endforeach()
