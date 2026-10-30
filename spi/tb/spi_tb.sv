class spi_tb extends uvm_env;

    //add class to macro
    `uvm_component_utils(spi_tb)

    spi_env env;
    // spi_scoreboard scoreboard;

    //constructor for class
    function new(string name = "spi_tb", uvm_component parent);
        super.new(name, parent);
    endfunction

    //build phase
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = spi_env::type_id::create("env", this);
        // scoreboard = spi_scoreboard::type_id::create("scoreboard", this);
        `uvm_info("ENV", "Build executing", UVM_HIGH)
    endfunction 


    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Running Simulation ... tb", UVM_HIGH)
    endfunction
endclass