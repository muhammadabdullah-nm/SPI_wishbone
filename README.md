# SPI_wishbone

A Verilog implementation of a **Serial Peripheral Interface (SPI)** controller with a **Wishbone bus** interface. A host (CPU or testbench) configures and drives SPI transfers through Wishbone register reads and writes, and the core handles serialization, clock generation, and chip-select control.

## Features

- Wishbone-compatible slave interface for register access
- SPI master (and slave, if applicable) operation
- Configurable SPI clock divider (clock generator)
- Support for SPI modes 0–3 (CPOL / CPHA)
- Configurable data width and MSB/LSB-first shifting
- Self-checking testbench for simulation


