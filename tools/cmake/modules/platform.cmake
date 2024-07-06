if (NOT DEFINED TARGET_ARCHITECTURE)
    message(STATUS "TARGET_ARCHITECTURE not defined, defaulting to ${TARGET_ARCHITECTURE}")
else ()

    if (NOT DEFINED TARGET_ARCHITECTURE_TYPE)
        message(STATUS "TARGET_ARCHITECTURE_TYPE not defined, defaulting to ${TARGET_PLATFORM}")
    else ()
        message(STATUS "TARGET_ARCHITECTURE_TYPE: ${TARGET_ARCHITECTURE_TYPE}")
        include(${CMAKE_MODULE_PATH}/architectures/${TARGET_ARCHITECTURE_TYPE}/${TARGET_ARCHITECTURE}/architecture.cmake)
    
    endif ()

endif ()

if (NOT DEFINED TARGET_PLATFORM)
    message(STATUS "TARGET_PLATFORM not defined, defaulting to ${TARGET_PLATFORM}")
else ()

    if (NOT EXISTS ${CMAKE_MODULE_PATH}/platforms/${TARGET_PLATFORM})
        message(STATUS "Platform folder does not exist: ${TARGET_PLATFORM}")
    else ()
        message(STATUS "Including platform file for ${TARGET_PLATFORM}")
        include(${CMAKE_MODULE_PATH}/platforms/${TARGET_PLATFORM}/platform.cmake)
    endif ()
endif ()

if (NOT DEFINED TARGET_TOOLCHAIN)
    message(STATUS "TOOLCHAIN not defined, defaulting to ${TOOLCHAIN}")
else()
    message(STATUS "TARGET_TOOLCHAIN: ${TARGET_TOOLCHAIN}")
    include(${CMAKE_MODULE_PATH}/toolchains/${TARGET_TOOLCHAIN}/toolchain.cmake)
endif ()
