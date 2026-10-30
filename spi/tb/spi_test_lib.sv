class base_test extends uvm_test;

    //add class to macro
    spi_tb tb;
    `uvm_component_utils(base_test)

    //constructor for class
    function new(string name = "base_test", uvm_component parent);
        super.new(name, parent);
    endfunction


    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        uvm_config_wrapper::set(this, "tb.env.agent.sequencer.run_phase", "default_sequence", spi_miso::get_type());
        tb = new("tb", this);
        `uvm_info(get_type_name(), "Build executing", UVM_HIGH)
    endfunction 

    //build phase
    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction 

    //check phase
    function void check_phase(uvm_phase phase);
        check_config_usage();
    endfunction

     //run phase
    task run_phase(uvm_phase phase);
        uvm_objection obj = phase.get_objection();
        // obj.set_drain_time(this, 20ns);
        // obj.set_drain_time(this, 5ns);
    endtask 
endclass

class test2 extends base_test;

    `uvm_component_utils(test2)
    function new(string name = "test2", uvm_component parent);
        super.new(name, parent);
    endfunction
endclass