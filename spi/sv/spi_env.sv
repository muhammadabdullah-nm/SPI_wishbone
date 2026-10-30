class spi_env extends uvm_env;
    `uvm_component_utils(spi_env)

    // spi_scoreboard scoreboard;

     //constructor for class
    function new(string name = "spi_env", uvm_component parent);
        super.new(name, parent);
        `uvm_info(get_type_name(), "You are in Env", UVM_LOW)
    endfunction

    spi_agent agent;

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = spi_agent::type_id::create("agent", this);
        // scoreboard = spi_scoreboard::type_id::create("scoreboard", this);
    endfunction

    function void connect_phase (uvm_phase phase);
        super.connect_phase(phase);
        `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH)
        // agent.monitor.spi_out.connect(scoreboard.spi_in);
        // agent.driver.drv_to_scb.connect(scoreboard.spi_in_drv);

    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Running Simulation ... Env", UVM_HIGH)
    endfunction

endclass