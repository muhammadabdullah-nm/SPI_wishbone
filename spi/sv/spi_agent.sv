class spi_agent extends uvm_agent;

    `uvm_component_utils_begin(spi_agent)
      `uvm_field_enum (uvm_active_passive_enum, is_active, UVM_ALL_ON)
    `uvm_component_utils_end

    // `uvm_component_utils(spi_agent)

      //constructor for class
    function new(string name = "spi_agent", uvm_component parent);
        super.new(name, parent);
        `uvm_info(get_type_name(), "You are in Agent", UVM_LOW)
    endfunction
    //end of constructor

    spi_monitor monitor;
    spi_driver driver;
    spi_sequencer sequencer;

    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(is_active) begin
            driver = spi_driver::type_id::create("driver",this);
            sequencer = spi_sequencer::type_id::create("sequencer",this);
        end
        monitor = spi_monitor::type_id::create("monitor",this);
    endfunction 

    //connect phase
    function void connect_phase(uvm_phase phase);
         if(is_active)
            driver.seq_item_port.connect(sequencer.seq_item_export);
    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Running Simulation ... Agent", UVM_HIGH)
    endfunction

endclass