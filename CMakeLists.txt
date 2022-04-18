# Ubuntu 16.04 use cmake 3.5.1
# MacOS 11.2.3 use cmake 3.20.1
cmake_minimum_required(VERSION 3.5.0)
project(wavfile)

set(CMAKE_CXX_STANDARD 14)
message("Build type: ${CMAKE_BUILD_TYPE}")
message("CMake version: ${CMAKE_VERSION}")

#    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
#        if (CMAKE_VERSION VERSION_GREATER "3.13.0")
#            add_compile_options(-fno-omit-frame-pointer)
#            add_compile_options(-fsanitize=address)
#            add_link_options(-fsanitize=address)
#            #add_compile_options(-fsanitize=thread)
#            #add_link_options(-fsanitize=thread)
#        endif()
#    endif ()

find_program(CCACHE_FOUND ccache)
if (CCACHE_FOUND)
    message("CCache found")
    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
    add_definitions(-DCMAKE_CXX_COMPILER_LAUNCHER=ccache)
else()
    message("CCache not found")
endif (CCACHE_FOUND)

add_definitions(-D__STDC_CONSTANT_MACROS)
add_definitions(-D__STDC_LIMIT_MACROS)

add_subdirectory(src)

