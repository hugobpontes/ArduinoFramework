macro(find_c_cxx_files output search_folder)
    file(GLOB ${output}
        "${search_folder}/*.h"
        "${search_folder}/*.cpp"
        "${search_folder}/*.hpp"
        "${search_folder}/*.c"
    )
endmacro()