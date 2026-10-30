class spi_sequencer extends uvm_sequencer #(spi_packet);
    `uvm_component_utils(spi_sequencer)

    //constructor for class
    function new(string name = "spi_sequencer", uvm_component parent);
        super.new(name, parent);
        `uvm_info(get_type_name(), "You are in Sequence", UVM_LOW)
    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Running Simulation ... Sequence", UVM_HIGH)
    endfunction

endclass