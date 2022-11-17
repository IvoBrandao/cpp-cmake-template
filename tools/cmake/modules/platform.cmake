if (NOT DEFINED TARGET_ARCHITECTURE)
    message(STATUS "TARGET_ARCHITECTURE not defined, defaulting to ${TARGET_ARCHITECTURE}")
else ()
    include(${CMAKE_MODULE_PATH}/platforms/${TARGET_ARCHITECTURE}/architecture.cmake)
endif ()

if (NOT DEFINED TARGET_PLATFORM)
    message(STATUS "TARGET_PLATFORM not defined, defaulting to ${TARGET_PLATFORM}")
else ()
    #include(${CMAKE_MODULE_PATH}/platforms/${TARGET_PLATFORM}/platform.cmake)
endif ()

if (NOT DEFINED TARGET_TOOLCHAIN)
    message(STATUS "TOOLCHAIN not defined, defaulting to ${TOOLCHAIN}")
else()

include(${CMAKE_MODULE_PATH}/toolchains/${TARGET_TOOLCHAIN}/toolchain.cmake)

endif ()

