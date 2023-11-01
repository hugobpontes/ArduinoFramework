message(STATUS "Adding arduino core")

include(search_tools)

# file glob is a bad way to find src files since every time a new file is added
# or removed, it isnt updated. Since this is collecting sources from a fixed 
# arduino core, this is tollerable. 

#setup paths
set (arduino_cores_arduino_path ArduinoCore-avr/cores/arduino)
set (arduino_drivers_path ArduinoCore-avr/drivers)
set (arduino_bootloaders_path ArduinoCore-avr/bootloaders)
set (arduino_extras_path ArduinoCore-avr/extras)
set (arduino_firmwares_path ArduinoCore-avr/firmwares)
set (arduino_libraries_path ArduinoCore-avr/libraries)
set (arduino_variants_path ArduinoCore-avr/variants/standard)

#get source file names
find_c_cxx_files(arduino_core_arduino_src ${arduino_cores_arduino_path})
find_c_cxx_files(arduino_drivers_src ${arduino_drivers_path})
find_c_cxx_files(arduino_extras_src ${arduino_extras_path})
find_c_cxx_files(arduino_firmwares_src ${arduino_firmwares_path})
find_c_cxx_files(arduino_libraries_src ${arduino_libraries_path})
find_c_cxx_files(arduino_variants_src ${arduino_variants_path})

set (arduino_srcs  ${arduino_core_arduino_src} ${arduino_libraries_src} ${arduino_extras_src} ${arduino_drivers_src} ${arduino_variants_src})

add_library(ArduinoCore STATIC)
target_sources(ArduinoCore PRIVATE  ${arduino_srcs})

target_include_directories(ArduinoCore PUBLIC ${arduino_variants_path})

file(GLOB_RECURSE arduino_cores_inc LIST_DIRECTORIES true "${CMAKE_SOURCE_DIR}/ArduinoCore-avr/cores/*")
foreach(item ${arduino_cores_inc})
	if(IS_DIRECTORY ${item})
		target_include_directories(ArduinoCore PUBLIC ${item})
	endif()
endforeach()

#file(GLOB_RECURSE arduino_firmwares_inc LIST_DIRECTORIES true "${CMAKE_SOURCE_DIR}/ArduinoCore-avr/firmwares/*")
#foreach(item ${arduino_firmwares_inc})
#	if(IS_DIRECTORY ${item})
#		target_include_directories(ArduinoCore PUBLIC ${item})
#	endif()
#endforeach()

file(GLOB_RECURSE arduino_libraries_inc LIST_DIRECTORIES true "${CMAKE_SOURCE_DIR}/ArduinoCore-avr/libraries/*")
foreach(item ${arduino_libraries_inc})
	if(IS_DIRECTORY ${item})
		target_include_directories(ArduinoCore PUBLIC ${item})
	endif()
endforeach()

file(GLOB_RECURSE arduino_extras_inc LIST_DIRECTORIES true "${CMAKE_SOURCE_DIR}/ArduinoCore-avr/extras/*")
foreach(item ${arduino_extras_inc})
	if(IS_DIRECTORY ${item})
		target_include_directories(ArduinoCore PUBLIC ${item})
	endif()
endforeach()

file(GLOB_RECURSE arduino_bootloaders_inc LIST_DIRECTORIES true "${CMAKE_SOURCE_DIR}/ArduinoCore-avr/bootloaders/*")
foreach(item ${arduino_bootloaders_inc})
	if(IS_DIRECTORY ${item})
		target_include_directories(ArduinoCore PUBLIC ${item})
	endif()
endforeach()

file(GLOB_RECURSE arduino_drivers_inc LIST_DIRECTORIES true "${CMAKE_SOURCE_DIR}/ArduinoCore-avr/drivers/*")
foreach(item ${arduino_drivers_inc})
	if(IS_DIRECTORY ${item})
		target_include_directories(ArduinoCore PUBLIC ${item})
	endif()
endforeach()