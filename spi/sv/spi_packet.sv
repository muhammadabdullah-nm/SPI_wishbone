class spi_packet extends uvm_sequence_item;

  // Define protocol data
  rand bit       miso_i;           //Master in slave out
  bit            sck_o;            //SPI clock
  bit            mosi_o;           //Master out slave in
  bit [7:0]     data_to_out;

  // Enable automation of the packet's fields
  `uvm_object_utils_begin(spi_packet)
      `uvm_field_int (miso_i, UVM_ALL_ON)
      `uvm_field_int (sck_o, UVM_ALL_ON)
      `uvm_field_int (mosi_o, UVM_ALL_ON)
      `uvm_field_int (data_to_out, UVM_ALL_ON)
  `uvm_object_utils_end

  // Define packet constraints
//   constraint c1 { addr!=3; }//address 3 is invalid
//   constraint c2 { parity_type dist {GOOD_PARITY:=5, BAD_PARITY:=1}; }
//   constraint c3 { packet_delay inside {[1:20]}; }
//   constraint c4 { length == payload.size(); }
//   constraint length_c { length inside {[1:63]}; }

  // Add methods for parity calculation and class construction
  function new(string name = "spi_packet");
    super.new(name);
  endfunction

endclass: spi_packet

