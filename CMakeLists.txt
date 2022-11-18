
SET(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/bin" CACHE INTERNAL "Prefix added to install directories" FORCE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/tools/cmake/modules")

cmake_minimum_required(VERSION 3.20)
project(ExampleProject)

set(CMAKE_CXX_STANDARD 14)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif ()

include(GNUInstallDirs)
include(platform)

# set the output to the same directory
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


add_subdirectory(libs)
add_subdirectory(tests)
add_subdirectory(external/googletest)



add_executable(ExampleApp src/main.cpp)
target_include_directories(ExampleApp 
    PUBLIC     
    ${CMAKE_CURRENT_LIST_DIR}/include
    )
target_link_libraries(ExampleApp  submodule)

