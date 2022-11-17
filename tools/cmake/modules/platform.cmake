
if (NOT DEFINED HOST_ARCHITECTURE)
    set(HOST_ARCHITECTURE "x86-x64")
    message(STATUS "HOST_ARCHITECTURE not defined, defaulting to ${HOST_ARCHITECTURE}")
endif ()

if (NOT DEFINED HOST_PLATFORM)
    set(HOST_PLATFORM "linux")
    message(STATUS "HOST_PLATFORM not defined, defaulting to ${HOST_PLATFORM}")
endif ()

if (NOT DEFINED TARGET_ARCHITECTURE)
    set(TARGET_ARCHITECTURE "x86-x64")
    message(STATUS "TARGET_ARCHITECTURE not defined, defaulting to ${TARGET_ARCHITECTURE}")
endif ()

if (NOT DEFINED TARGET_PLATFORM)
    set(TARGET_PLATFORM "linux")
    message(STATUS "TARGET_PLATFORM not defined, defaulting to ${TARGET_PLATFORM}")
endif ()

if (NOT DEFINED TARGET_TOOLCHAIN)
    set(TARGET_TOOLCHAIN "x86-x64-gcc")
    message(STATUS "TOOLCHAIN not defined, defaulting to ${TOOLCHAIN}")
endif ()



include(${CMAKE_MODULE_PATH}/platforms/${TARGET_ARCHITECTURE}/architecture.cmake)
include(${CMAKE_MODULE_PATH}/toolchains/${TARGET_TOOLCHAIN}/toolchain.cmake)
