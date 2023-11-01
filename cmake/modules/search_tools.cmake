macro(find_c_cxx_files output search_folder)
    file(GLOB ${output}
        "${search_folder}/*.h"
        "${search_folder}/*.cpp"
        "${search_folder}/*.hpp"
        "${search_folder}/*.c"
    )
endmacro()

macro(find_and_add_dirs target search_folder)
    file(GLOB_RECURSE found_files LIST_DIRECTORIES true "${search_folder}/*")
    foreach(item ${found_files})
        if(IS_DIRECTORY ${item})
            target_include_directories(${target} PUBLIC ${item})
        endif()
    endforeach()
endmacro()