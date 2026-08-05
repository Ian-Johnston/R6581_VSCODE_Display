# ADVANTEST R6581T TFT Display Upgrade (VS Code)

This repository contains the **Visual Studio Code** version of my **Advantest R6581T TFT Display Upgrade** firmware.

The project replaces the original LCD display with a modern high-resolution TFT display driven by an **STM32F103C8T6 (Blue Pill)** and an **LT7680 TFT controller**.

This repository was migrated from the original **Visual Studio 2022 / VisualGDB** project to a standard **Visual Studio Code + CMake + GNU Arm Embedded Toolchain** development environment.

## Features

- Full HP 3457A display decoding
- High-resolution TFT graphics
- Original display faithfully reproduced
- Fast screen updates
- Modular embedded C source
- STM32 HAL-based firmware

## Development Environment

- Visual Studio Code
- CMake
- Ninja
- GNU Arm Embedded Toolchain
- Cortex-Debug extension
- STM32CubeCLT
- ST-LINK GDB Server
- STM32Cube HAL

## Hardware

- STM32F103C8T6 Blue Pill
- LT7680 TFT controller
- TFT LCD
- Custom interface PCB

## Project Structure

The project is split into a number of modules, including:

- Main application
- LT7680 TFT controller driver
- TFT graphics library
- GPIO
- SPI
- DMA
- Timer / Display decoder
- STM32 HAL support

---

Ian Johnston