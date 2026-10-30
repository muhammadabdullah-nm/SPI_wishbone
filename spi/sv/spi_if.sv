interface spi_if ();
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  import spi_pkg::*;

  // Actual Signals
  logic       miso_i;           //Master in slave out
  logic       sck_o;            //SPI clock
  logic       mosi_o;           //Master out slave in

  // task wb_reset();
  //   @(negedge rst_i);
  //   dat_i             <=  'hz;
  //   cyc_i             <= 1'b0;
  //   stb_i             <= 1'b0;
  //   adr_i             <= 2'b0;
  //   we_i              <= 1'b0;
  //   // disable send_to_dut;
  // endtask

  // task serialPeripheralInterruptEnable(input bit [6:0] prevData, input bit sr);
  //     $display("Iam in vif");
  //     if(sr==1) //set the interrupt
  //       dat_i=prevData|(1<<7); //after 7 bit left shift the interrupt can be set
  //                            // with keeping the previous values of register set
  //     else if(sr==0)  //reset the interrupt
  //       dat_i=prevData|(0<<7);
  // endtask


endinterface : spi_if


