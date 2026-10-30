module top;
    // import the UVM library
    // include the UVM macros
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import spi_pkg::*;
    `include "spi_tb.sv"
    `include "spi_test_lib.sv"
    // import the YAPP package
    int ok;

    logic clock;
    bit rst_i, cyc_i, stb_i, we_i, ack_o, inta_o;
    bit [1:0] adr_i;
    bit [7:0] dat_i, data_o;

      spi_if in0();

  // initial begin
  //   // in0.in_suspend <= 1'b0;
  //   @(negedge clock)
  //   @(negedge clock)
  // end

        
    simple_spi dut(
    // 8bit WISHBONE bus slave interface
    .clk_i(clock),         // clock
    .rst_i(rst_i),         // reset (synchronous active high)
    .cyc_i(cyc_i),         // cycle
    .stb_i(stb_i),         // strobe
    .adr_i(adr_i),         // address
    .we_i(we_i),          // write enable
    .dat_i(dat_i),         // data input
    .dat_o(data_o),         // data output
    .ack_o(ack_o),         // normal bus termination
    .inta_o(inta_o),        // interrupt output

    // SPI port
    .sck_o(in0.sck_o),         // serial clock output
    .ss_o(ss_o),      // slave select (active low)
    .mosi_o(in0.mosi_o),        // MasterOut SlaveIN
    .miso_i(in0.miso_i)         // MasterIn SlaveOut
    );


    // generate 5 random packets and use the print method
    // to display the results
    initial begin
        uvm_config_db#(virtual spi_if)::set(null, "*env*","vif",in0);
        // spi_vif_config::set(null, "","vif",in0);
        run_test();  
    end

  initial begin
    //reset <= 1'b0;
    clock <= 1'b1;
    // #15 reset <= 1'b1;
    // #51 reset = 1'b0;
  end

  //Generate Clock
  always
    #5 clock = ~clock;
    // experiment with the copy, clone and compare UVM method
endmodule : top
