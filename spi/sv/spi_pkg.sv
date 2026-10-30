package spi_pkg;
    import uvm_pkg::*;
    typedef uvm_config_db#(virtual spi_if) spi_vif_config;
    `include "uvm_macros.svh"

    `include "spi_packet.sv"
    `include "spi_monitor.sv"
    `include "spi_sequencer.sv"
    `include "spi_seqs.sv"
    `include "spi_driver.sv"
    `include "spi_agent.sv"
    // `include "spi_scoreboard.sv"
    `include "spi_env.sv"
endpackage