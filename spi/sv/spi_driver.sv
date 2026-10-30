class spi_driver extends uvm_driver #(spi_packet);

    virtual spi_if vif;
    `uvm_component_utils(spi_driver)

    uvm_analysis_port #(spi_packet) drv_to_scb;

    //constructor for class
    function new(string name = "spi_driver", uvm_component parent);
        super.new(name, parent);
        `uvm_info(get_type_name(), "You are in Driver", UVM_LOW)
        drv_to_scb = new("drv_to_scb", this);
    endfunction

     //run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            seq_item_port.get_next_item(req);
            // @(negedge vif.sck_o);
            send_to_dut(req);
            seq_item_port.item_done();
            // drv_to_scb.write(req);
        end
    endtask 

    task send_to_dut(spi_packet packet);
        `uvm_info(get_type_name(), $sformatf("Packet is \n%s", packet.sprint()), UVM_LOW)
        // vif.mosi_o<=req.mosi_o;
        vif.miso_i<=req.miso_i;
        // vif.sck_o<=req.sck_o;
    endtask

    function void connect_phase(uvm_phase phase);
        if (!spi_vif_config::get(this,"","vif", vif))
            `uvm_error("NOVIF","vif not set")
    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Running Simulation ... Driver", UVM_HIGH)
    endfunction

endclass