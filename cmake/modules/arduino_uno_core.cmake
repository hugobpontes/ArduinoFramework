message(STATUS "Adding arduino uno core")

#add library defined by this file 
add_library(ArduinoUnoCore STATIC)

include(search_tools)

# file glob is a bad way to find src files since every time a new file is added
# or removed, it isnt updated. Since this is collecting sources from a fixed 
# arduino core, this is tollerable. 

#setup paths
set (arduino_cores_path ArduinoCore-avr/cores)
set (arduino_cores_arduino_path ArduinoCore-avr/cores/arduino)
set (arduino_drivers_path ArduinoCore-avr/drivers)
set (arduino_bootloaders_path ArduinoCore-avr/bootloaders)
set (arduino_extras_path ArduinoCore-avr/extras)
set (arduino_firmwares_path ArduinoCore-avr/firmwares)
set (arduino_libraries_path ArduinoCore-avr/libraries)
set (arduino_variants_path ArduinoCore-avr/variants/standard)
#variants other than standard are not used with arduino uno

#get source file names
find_c_cxx_files(arduino_core_arduino_src ${arduino_cores_arduino_path})
find_c_cxx_files(arduino_drivers_src ${arduino_drivers_path})
find_c_cxx_files(arduino_extras_src ${arduino_extras_path})
find_c_cxx_files(arduino_firmwares_src ${arduino_firmwares_path})
find_c_cxx_files(arduino_libraries_src ${arduino_libraries_path})
find_c_cxx_files(arduino_variants_src ${arduino_variants_path})

set (arduino_srcs  
  ${arduino_core_arduino_src} 
  ${arduino_libraries_src} 
  ${arduino_extras_src} 
  ${arduino_drivers_src} 
  ${arduino_variants_src}
  ${arduino_firmwares_src}
)

#add source and inc directories to library
target_sources(ArduinoUnoCore PRIVATE  ${arduino_srcs})

#directories under variants cannot be added recursively or all directories
#containing a different pins_arduino.h would be added
target_include_directories(ArduinoUnoCore PUBLIC ${arduino_variants_path})
find_and_add_dirs(ArduinoUnoCore ${arduino_cores_path})
find_and_add_dirs(ArduinoUnoCore ${arduino_libraries_path})
find_and_add_dirs(ArduinoUnoCore ${arduino_extras_path})
find_and_add_dirs(ArduinoUnoCore ${arduino_bootloaders_path})
find_and_add_dirs(ArduinoUnoCore ${arduino_drivers_path})
find_and_add_dirs(ArduinoUnoCore ${arduino_firmwares_path})

#it is very likely that some of these directories and files in them are optional, but since I'm not having any
#issues with the generation speed, I havent wasted timed checking what needs to be added or not.
#some dirs may not even contain source files. remove unnecessry dirs and files
#if looking for faster generation

