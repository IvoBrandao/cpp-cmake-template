cmake_minimum_required(VERSION 3.22)



SET(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/bin" CACHE INTERNAL "Prefix added to install directories" FORCE)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_LIST_DIR}/cmake/modules")


project(ExampleProject C CXX ASM)


set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 14)

if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif ()

include(GNUInstallDirs)
include(platform)


SET(CMAKE_INSTALL_LIBDIR "lib")

# set the output to the same directory
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY  "${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}")
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY  "${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}")
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY  "${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)


add_subdirectory(libs)
#add_subdirectory(tests)
#add_subdirectory(external/googletest)



add_executable(ExampleApp
    ${CMAKE_SOURCE_DIR}/src/main.c
    ${CMAKE_SOURCE_DIR}/src/syscalls.c
    ${CMAKE_SOURCE_DIR}/src/sysmem.c
    ${CMAKE_SOURCE_DIR}/src/boot.s
    )

target_include_directories(ExampleApp 
    PUBLIC     
    ${CMAKE_CURRENT_LIST_DIR}/include
    )
#target_link_libraries(ExampleApp  submodule)

set_target_properties(ExampleApp PROPERTIES LINKER_LANGUAGE CXX)