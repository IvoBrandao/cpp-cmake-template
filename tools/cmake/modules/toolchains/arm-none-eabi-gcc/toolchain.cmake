
if (NOT DEFINED ARM_NONE_EABI_GCC_TOOLCHAIN_PATH)
    message(FATAL_ERROR "ARM_NONE_EABI_GCC_TOOLCHAIN_PATH is not defined")
endif()

if (NOT DEFINED ${ARM_ARCH_CPU})
    message(FATAL_ERROR "ARM_ARCH_CPU not defined")
endif()

if (NOT DEFINED ${ARM_ARCH_ARM_MODE})
    message(FATAL_ERROR "ARM_ARCH_ARM_MODE not defined")
endif()

if (NOT DEFINED ${ARM_ARCH_FLOAT_ABI})
    message(FATAL_ERROR "ARM_ARCH_FLOAT_ABI not defined")
endif()

if (NOT DEFINED ${ARM_ARCH_FPU})
    message(FATAL_ERROR "ARM_ARCH_FPU not defined")
endif()

if (NOT DEFINED ${ARM_LINKER_SCRIPT})
    message(FATAL_ERROR "ARM_LINKER_SCRIPT not defined")
endif()

if (NOT DEFINED ${ARM_LINKER_SCRIPT})
    message(FATAL_ERROR "ARM_LINKER_SCRIPT not defined")
endif()

# The CMAKE_SYSTEM_NAME is the CMake-identifier of the target platform to build for.
SET( CMAKE_SYSTEM_NAME Generic )

# The CMAKE_SYSTEM_PROCESSOR is the CMake-identifier of the target architecture to build for.
SET( CMAKE_SYSTEM_PROCESSOR ${ARM_ARCH_CPU} )

# The CMAKE_<LANG>_COMPILER variables may be set to full paths, or to names
# of compilers to search for in standard locations. For toolchains that do 
# not support linking binaries without custom flags or scripts one may set 
# the CMAKE_TRY_COMPILE_TARGET_TYPE variable to STATIC_LIBRARY to tell CMake 
# not to try to link executables during its checks.
SET( CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY )

# The CMAKE_SYSROOT is optional, and may be specified if a sysroot is available.
# SET( CMAKE_SYSROOT )
SET( CMAKE_CROSSCOMPILING "TRUE")


INCLUDE(CMakeForceCompiler)

# specify the cross compiler
#CMAKE_FORCE_C_COMPILER("GNU" "${COMPILER_ABI}gcc")
#CMAKE_FORCE_CXX_COMPILER("GNU" "${COMPILER_ABI}g++")

SET (CMAKE_C_COMPILER_WORKS 1)
SET (CMAKE_CXX_COMPILER_WORKS 1)

SET( CMAKE_C_COMPILER   "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}gcc"       CACHE FILEPATH "" FORCE )
SET( CMAKE_CXX_COMPILER "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}g++"       CACHE FILEPATH "" FORCE )
SET( CMAKE_LINKER       "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}ld"        CACHE FILEPATH "" FORCE )
SET( CMAKE_AR           "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}ar"        CACHE FILEPATH "" FORCE )
SET( CMAKE_OBJCOPY      "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}objcopy"   CACHE FILEPATH "" FORCE )
SET( CMAKE_NM           "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}nm"        CACHE FILEPATH "" FORCE )
SET( CMAKE_OBJDUMP      "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}objdump"   CACHE FILEPATH "" FORCE )
SET( CMAKE_RANLIB       "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}ranlib"    CACHE FILEPATH "" FORCE )
SET( CMAKE_READELF      "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}readelf"   CACHE FILEPATH "" FORCE )
SET( CMAKE_ADDR2LINE    "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}addr2line" CACHE FILEPATH "" FORCE )
SET( CMAKE_STRIP        "${ARM_NONE_EABI_GCC_TOOLCHAIN_PATH}${ARM_COMPILER_ABI}strip"     CACHE FILEPATH "" FORCE )
SET( CMAKE_MAKE_PROGRAM "Unix Makefiles"                    CACHE FILEPATH "" FORCE )

# shearch for programs in the build host directories
SET( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )

# for libraries and headers in the target directories
SET( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
SET( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
SET( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )

if ( ARM_ARCH_ARM_MODE STREQUAL "thumb" )
    SET( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mthumb-interwork -mthumb" )
    SET( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mthumb-interwork -mthumb" )
endif()

SET(COMMOM_FLAGS "-mcpu=${ARM_ARCH_CPU} -mfpu=${ARM_ARCH_FPU} -mfloat-abi=${ARM_ARCH_FLOAT_ABI}")

# Sets assembler flags
SET( CMAKE_ASM_FLAGS "${COMMOM_FLAGS} -g3  -x assembler-with-cpp " CACHE STRING "" FORCE )
# Set C compiler Flags
SET( CMAKE_C_FLAGS "${COMMOM_FLAGS} -std=gnu11 -ffunction-sections -fdata-sections -Wall -fstack-usage" )
# Sets CPP compiler flags
SET( CMAKE_CXX_FLAGS "${COMMOM_FLAGS} -std=gnu++14 -g3 -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-threadsafe-statics -fno-use-cxa-atexit -Wall -fstack-usage" )
# Sets Linker flags 
SET( CMAKE_EXE_LINKER_FLAGS "${COMMOM_FLAGS} -Wl,--gc-sections -static -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group --specs=nosys.specs")

SET( CMAKE_CXX_FLAGS_DEBUG "-g")
SET( CMAKE_CXX_FLAGS_MINSIZEREL "Os -DNDEBUG")
SET( CMAKE_CXX_FLAGS_RELEASE "O3 -DNDEBUG")
SET( CMAKE_CXX_FLAGS_RELWITHDEBINFO "O2 -g -DNDEBUG")


# set extra linker flags
SET( CMAKE_LINKER_FLAGS "${CMAKE_LINKER_FLAGS} -flto " )
# Set the linker file location
SET( CMAKE_LINKER_FLAGS 
"${CMAKE_LINKER_FLAGS} -T ${CMAKE_PROJECT_ROOT}/source/hal/arm_cm7_gcc/scr/lscript.ld -Wl,-Map=${CMAKE_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}/${CMAKE_PROJECT_NAME}.map")



# cache the flags for use
SET( CMAKE_C_FLAGS              "${CMAKE_C_FLAGS}"   CACHE STRING "CFLAGS" )
SET( CMAKE_CXX_FLAGS            "${CMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
SET( CMAKE_ASM_FLAGS            "${CMAKE_ASM_FLAGS}" CACHE STRING "ASMFLAGS" )
SET( CMAKE_EXE_LINKER_FLAGS     "${CMAKE_EXE_LINKER_FLAGS}" CACHE STRING "LINKERFLAGS" )
SET( CMAKE_STATIC_LINKER_FLAGS  "")
SET( CMAKE_SHARED_LINKER_FLAGS  "")


SET( CMAKE_EXPORT_COMPILE_COMMANDS             ON)
SET( CMAKE_C_USE_RESPONSE_FILE_FOR_INCLUDES    ON)
SET( CMAKE_C_USE_RESPONSE_FILE_FOR_LIBRARIES   ON)
SET( CMAKE_C_USE_RESPONSE_FILE_FOR_OBJECTS     ON)
SET( CMAKE_CXX_USE_RESPONSE_FILE_FOR_INCLUDES  ON)
SET( CMAKE_CXX_USE_RESPONSE_FILE_FOR_LIBRARIES ON)
SET( CMAKE_CXX_USE_RESPONSE_FILE_FOR_OBJECTS   ON)
SET( CMAKE_NINJA_FORCE_RESPONSE_FILE           ON)