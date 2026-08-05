cmake_minimum_required(VERSION 3.22)

project(BluePill_Project C ASM)

add_compile_options(
    -mcpu=cortex-m3
    -mthumb
    -Og
    -g3
    -Wall
    -fdata-sections
    -ffunction-sections
)

add_compile_definitions(STM32F103xB)

add_executable(${PROJECT_NAME})

file(GLOB_RECURSE PROJECT_SOURCES
    "Core/Src/*.c"
)

file(GLOB HAL_SOURCES
    "Drivers/STM32F1xx_HAL_Driver/Src/*.c"
)

list(REMOVE_ITEM HAL_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_msp_template.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_timebase_tim_template.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_timebase_rtc_alarm_template.c"
)

target_sources(${PROJECT_NAME} PRIVATE
    ${PROJECT_SOURCES}
    ${HAL_SOURCES}
    startup_stm32f103c8tx.S
)

target_include_directories(${PROJECT_NAME} PRIVATE
    Core/Inc
    Drivers/STM32F1xx_HAL_Driver/Inc
    Drivers/STM32F1xx_HAL_Driver/Inc/Legacy
    Drivers/CMSIS/Include
    Drivers/CMSIS/Device/ST/STM32F1xx/Include
)

target_link_options(${PROJECT_NAME} PRIVATE
    -mcpu=cortex-m3
    -mthumb
    "-T${CMAKE_CURRENT_SOURCE_DIR}/STM32F103C8TX_FLASH.ld"
    -Wl,-Map=${PROJECT_NAME}.map
    -Wl,--gc-sections
    --specs=nano.specs
)

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O ihex
        $<TARGET_FILE:${PROJECT_NAME}>
        ${PROJECT_NAME}.hex

    COMMAND ${CMAKE_OBJCOPY} -O binary
        $<TARGET_FILE:${PROJECT_NAME}>
        ${PROJECT_NAME}.bin

    COMMAND ${CMAKE_SIZE}
        $<TARGET_FILE:${PROJECT_NAME}>
)