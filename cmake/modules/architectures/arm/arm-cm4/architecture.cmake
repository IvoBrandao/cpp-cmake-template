set(PROJECT_TOOLCHAIN_PATH arm-none-eabi-gcc CACHE PATH "Path to arm-none-eabi-gcc toolchain")
set(PROJECT_ARCH_CPU "armv7e-m" CACHE STRING "ARM architecture CPU")
set(PROJECT_ARCH_PROJECT_MODE "thumb" CACHE STRING "ARM architecture ARM mode")
set(PROJECT_ARCH_FPU "fpv4-sp-d16" CACHE STRING "ARM architecture FPU")
set(PROJECT_ARCH_FLOAT_ABI "hard" CACHE STRING "ARM architecture float ABI")
set(PROJECT_COMPILER_ABI "arm-none-eabi-" CACHE STRING "ARM compiler ABI")
set(PROJECT_LINKER_SCRIPT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/memory-layout.ld CACHE STRING "ARM linker script path")


message(STATUS "PROJECT_TOOLCHAIN_PATH: ${PROJECT_TOOLCHAIN_PATH}")
message(STATUS "PROJECT_ARCH_CPU: ${PROJECT_ARCH_CPU}")
message(STATUS "PROJECT_ARCH_PROJECT_MODE: ${PROJECT_ARCH_PROJECT_MODE}")
message(STATUS "PROJECT_ARCH_FPU: ${PROJECT_ARCH_FPU}")
message(STATUS "PROJECT_ARCH_FLOAT_ABI: ${PROJECT_ARCH_FLOAT_ABI}")
message(STATUS "PROJECT_COMPILER_ABI: ${PROJECT_COMPILER_ABI}")
message(STATUS "PROJECT_LINKER_SCRIPT_PATH: ${PROJECT_LINKER_SCRIPT_PATH}")