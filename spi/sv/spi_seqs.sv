class spi_base_seq extends uvm_sequence #(spi_packet);
  
  // Required macro for sequences automation
  `uvm_object_utils(spi_base_seq)

  // Constructor
  function new(string name="spi_base_seq");
    super.new(name);
  endfunction

  task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "raise objection", UVM_MEDIUM)
    end
  endtask : pre_body

  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "drop objection", UVM_MEDIUM)
    end
  endtask : post_body

endclass : spi_base_seq

//------------------------------------------------------------------------------
//
// SEQUENCE: yapp_5_packets
//
//  Configuration setting for this sequence
//    - update <path> to be hierarchial path to sequencer 
//
//  uvm_config_wrapper::set(this, "<path>.run_phase",
//                                 "default_sequence",
//                                 yapp_5_packets::get_type());
//
//------------------------------------------------------------------------------
class spi_1_seq extends spi_base_seq;
  `uvm_object_utils(spi_1_seq)
//constructor
  function new (string name="spi_1_seq");
    super.new(name);
  endfunction

  // Sequence body definition
  virtual task body();
    `uvm_info(get_type_name(), "Executing spi_1_seq sequence", UVM_LOW)
      `uvm_do(req)
  endtask

endclass

class spi_miso extends spi_base_seq;
  `uvm_object_utils(spi_miso)
//constructor
  function new (string name="spi_miso");
    super.new(name);
  endfunction

  // Sequence body definition
  virtual task body();
    `uvm_info(get_type_name(), "Executing spi_miso sequence", UVM_LOW)
      `uvm_do(req);
      `uvm_do(req);
      `uvm_do(req);
      `uvm_do(req);
      `uvm_do(req);
      `uvm_do(req);
      `uvm_do(req);
      `uvm_do(req);
  endtask

endclass




// class yapp_012_seq extends spi_base_seq;
//   `uvm_object_utils(yapp_012_seq)
// //constructor
//   function new (string name="yapp_012_seq");
//     super.new(name);
//   endfunction

//   // Sequence body definition
//   virtual task body();
//     `uvm_info(get_type_name(), "Executing yapp_012_seq sequence", UVM_LOW)
//       `uvm_do_with(req, {req.addr==0;})
//       `uvm_do_with(req, {req.addr==1;})
//        `uvm_create(req)
//     	req.randomize();
//       	req.addr=2;
//     	req.set_parity();
//     	`uvm_send(req); 
//   endtask

// endclass


// class yapp_111_seq extends spi_base_seq;
//   `uvm_object_utils(yapp_111_seq)
//   spi_1_seq yapp1;
// //constructor
//   function new (string name="yapp_111_seq");
//     super.new(name);
//     // yapp1=spi_1_seq::type_id::create("yapp1");
//   endfunction


//   // Sequence body definition
//   virtual task body();
//     `uvm_info(get_type_name(), "Executing yapp_111_seq sequence", UVM_LOW)
//     `uvm_do(yapp1)
//     `uvm_do(yapp1)
//     `uvm_do(yapp1)
//   endtask

// endclass


// class yapp_repeat_addr_seq extends spi_base_seq;
//   `uvm_object_utils(yapp_repeat_addr_seq)

// //constructor
//   function new (string name="yapp_repeat_addr_seq");
//     super.new(name);
//   endfunction

// // Sequence body definition
//   rand bit [1:0] seqadd;
//   constraint c1 { seqadd <= 2'b10; }
//   // Sequence body definition
//   virtual task body();
//     `uvm_info(get_type_name(), "Executing yapp_repeat_addr_seq sequence", UVM_LOW)

//     `uvm_do_with(req, {req.addr==seqadd;})
//     `uvm_do_with(req, {req.addr==seqadd;})
    
//   endtask

// endclass


// class yapp_incr_payload_seq extends spi_base_seq;
//   `uvm_object_utils(yapp_incr_payload_seq)

// //constructor
//   function new (string name="yapp_incr_payload_seq");
//     super.new(name);
//   endfunction

//     int i;
// // Sequence body definition
//   rand bit [1:0] seqadd;
//   constraint c1 { seqadd <= 2'b10; }
//   // Sequence body definition
//   virtual task body();
//     `uvm_info(get_type_name(), "Executing yapp_incr_payload_seq sequence", UVM_LOW)
//     `uvm_create(req)
//     assert (req.randomize());
//     for(i=0; i<req.length; i++)
//     begin
//       req.payload[i]=i;
//     end
//     req.set_parity();
//     `uvm_send(req); 

    
//   endtask

// endclass


// class yapp_5_packets extends spi_base_seq;
  
//   // Required macro for sequences automation
//   `uvm_object_utils(yapp_5_packets)

//   // Constructor
//   function new(string name="yapp_5_packets");
//     super.new(name);
//   endfunction

//   // Sequence body definition
//   virtual task body();
//     `uvm_info(get_type_name(), "Executing yapp_5_packets sequence", UVM_LOW)
//      repeat(6)
//       `uvm_do(req)
//   endtask
  
// endclass
// class yapp_exhaustive_seq extends spi_base_seq;
//     // Required macro for sequences automation
//   `uvm_object_utils(yapp_exhaustive_seq)

//   // Constructor
//   function new(string name="yapp_exhaustive_seq");
//     super.new(name);
//   endfunction

//   spi_1_seq yapp1_seq;
//   yapp_012_seq yapp012_seq;
//   yapp_111_seq yapp111_seq;
//   yapp_repeat_addr_seq yapp_addr_seq;
//   yapp_incr_payload_seq yapp_incr_seq;

//   // Sequence body definition
//   virtual task body();
//     `uvm_info(get_type_name(), "Executing yapp_exhaustive_seq sequence", UVM_LOW)
     
//       `uvm_do(yapp1_seq)
//       `uvm_do(yapp012_seq)
//       `uvm_do(yapp111_seq)
//       `uvm_do(yapp_addr_seq)
//       `uvm_do(yapp_incr_seq)
//   endtask


// endclass
