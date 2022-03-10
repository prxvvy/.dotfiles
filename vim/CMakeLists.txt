cmake_minimum_required(VERSION 3.21)
project(cvim-installer C)

set(CMAKE_C_STANDARD 23)

file(GLOB SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)

add_compile_options(-g -Wall -lm -ldl -fPIC -rdynamic)

add_executable(cvim-installer ${SRC_FILES})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)
