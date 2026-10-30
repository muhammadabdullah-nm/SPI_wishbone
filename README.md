# SPI_wishbone

A Verilog implementation of a **Serial Peripheral Interface (SPI)** controller with a **Wishbone bus** interface. A host (CPU or testbench) configures and drives SPI transfers through Wishbone register reads and writes, and the core handles serialization, clock generation, and chip-select control.

## Features

- Wishbone-compatible slave interface for register access
- SPI master (and slave, if applicable) operation
- Configurable SPI clock divider (clock generator)
- Support for SPI modes 0–3 (CPOL / CPHA)
- Configurable data width and MSB/LSB-first shifting
- Self-checking testbench for simulation

> Edit this list to match what your design actually supports.

## Block Diagram

```
          Wishbone Bus                        SPI Bus
   +------------------------+        +------------------------+
   |  Host / CPU / TB       |        |  SPI Slave Device      |
   +-----------+------------+        +-----------+------------+
               |                                 ^
               v                                 |
   +-----------+---------------------------------+------------+
   |  Wishbone Interface  ->  Control/Status Regs             |
   |                          Clock Generator                 |
   |                          Shift Register / FSM            |
   |                    SCLK | MOSI | MISO | SS_N            |
   +----------------------------------------------------------+
```

## Repository Structure

```
SPI_wishbone/
├── rtl/          # Verilog design sources
├── tb/           # Testbenches
├── sim/          # Simulation scripts / waveforms
└── README.md
```

> Adjust folder and file names to match the repo.

## Interface Signals

### Wishbone (slave side)

| Signal    | Dir | Description                  |
|-----------|-----|------------------------------|
| `wb_clk_i`| in  | System clock                 |
| `wb_rst_i`| in  | Synchronous reset            |
| `wb_adr_i`| in  | Register address             |
| `wb_dat_i`| in  | Write data                   |
| `wb_dat_o`| out | Read data                    |
| `wb_we_i` | in  | Write enable                 |
| `wb_sel_i`| in  | Byte select                  |
| `wb_stb_i`| in  | Strobe                       |
| `wb_cyc_i`| in  | Bus cycle valid              |
| `wb_ack_o`| out | Transfer acknowledge         |
| `wb_int_o`| out | Interrupt (transfer done)    |

### SPI

| Signal   | Dir | Description          |
|----------|-----|----------------------|
| `sclk`   | out | SPI clock            |
| `mosi`   | out | Master out, slave in |
| `miso`   | in  | Master in, slave out |
| `ss_n`   | out | Slave select (active low) |

## Register Map

| Offset | Name    | Description                                  |
|--------|---------|----------------------------------------------|
| 0x00   | `DATA`  | TX/RX data register                          |
| 0x04   | `CTRL`  | Enable, CPOL, CPHA, start, interrupt enable  |
| 0x08   | `DIV`   | SPI clock divider                            |
| 0x0C   | `SS`    | Slave select control                         |
| 0x10   | `STATUS`| Busy / transfer-done flags                   |

> Replace with your real register map.

## SPI Modes

| Mode | CPOL | CPHA | Description                                   |
|------|------|------|-----------------------------------------------|
| 0    | 0    | 0    | Clock idle low, sample on rising edge         |
| 1    | 0    | 1    | Clock idle low, sample on falling edge        |
| 2    | 1    | 0    | Clock idle high, sample on falling edge       |
| 3    | 1    | 1    | Clock idle high, sample on rising edge        |

## Getting Started

### Prerequisites

One of the following simulators:

- [Icarus Verilog](https://steveicarus.github.io/iverilog/) + GTKWave
- ModelSim / QuestaSim
- Xilinx Vivado Simulator

### Run the Simulation (Icarus Verilog)

```bash
git clone https://github.com/muhammadabdullah-nm/SPI_wishbone.git
cd SPI_wishbone

iverilog -o spi_sim rtl/*.v tb/*.v
vvp spi_sim
gtkwave dump.vcd
```

> Update file paths and the testbench name to match your repo.

## Usage Example

1. Write the clock divider to `DIV`.
2. Configure `CTRL` (mode, enable).
3. Assert slave select via `SS`.
4. Write the byte to transmit into `DATA` and set the start bit.
5. Wait for the interrupt or poll `STATUS`.
6. Read the received byte from `DATA`.

## Verification

The testbench exercises:

- Wishbone register read/write
- All four SPI modes
- Different clock divider values
- Back-to-back transfers
- Loopback (MOSI → MISO) data check

## Future Work

- FIFO buffers for TX/RX
- Multi-slave support
- FPGA implementation and timing reports

## License

Add a license (e.g. MIT) and update this section.

## Author

**Muhammad Abdullah** — [GitHub](https://github.com/muhammadabdullah-nm)
