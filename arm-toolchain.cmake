set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# ARM GCC compiler location
set(ARM_TOOLCHAIN_PATH "C:/ARM_Toolchain/arm-eabi/bin")

# Ninja location
set(NINJA_PATH "C:/ARM_Toolchain/bin/ninja.exe")

set(CMAKE_MAKE_PROGRAM "${NINJA_PATH}" CACHE FILEPATH "Ninja executable" FORCE)

set(CMAKE_C_COMPILER "${ARM_TOOLCHAIN_PATH}/arm-none-eabi-gcc.exe")
set(CMAKE_CXX_COMPILER "${ARM_TOOLCHAIN_PATH}/arm-none-eabi-g++.exe")
set(CMAKE_ASM_COMPILER "${ARM_TOOLCHAIN_PATH}/arm-none-eabi-gcc.exe")

set(CMAKE_OBJCOPY "${ARM_TOOLCHAIN_PATH}/arm-none-eabi-objcopy.exe" CACHE FILEPATH "Objcopy executable")
set(CMAKE_SIZE "${ARM_TOOLCHAIN_PATH}/arm-none-eabi-size.exe" CACHE FILEPATH "Size executable")

# Prevent CMake trying to compile and link a Windows executable
# while checking the bare-metal ARM compiler.
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)