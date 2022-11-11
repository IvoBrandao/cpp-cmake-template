cmake_minimum_required(VERSION 3.10)
project(ExampleProject)

set(CMAKE_CXX_STANDARD 14)

include(GNUInstallDirs)
# set the output to the same directory
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set (CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set (CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)


include_directories(include)

add_subdirectory(libs)
add_subdirectory(tests)
add_subdirectory(external/googletest)


add_executable(ExampleProject src/main.cpp)

target_link_libraries(ExampleProject  submodule)