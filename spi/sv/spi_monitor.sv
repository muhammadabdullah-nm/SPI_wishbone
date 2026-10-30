class spi_monitor extends uvm_monitor;

    virtual spi_if vif;
    `uvm_component_utils(spi_monitor)
    spi_packet pkt;

    uvm_analysis_port #(spi_packet) spi_out;

     //constructor for class
    function new(string name = "spi_monitor", uvm_component parent);
        super.new(name, parent);
        spi_out = new("spi_out", this);
    endfunction

     //run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info(get_type_name(), "You are in Monitor", UVM_LOW)
        // @(posedge vif.sck_o);
        forever begin
            //repeat(8) begin
                pkt.sck_o=vif.sck_o;
                @(posedge vif.sck_o);
                    pkt.miso_i=vif.miso_i;
                @(negedge vif.sck_o);
                    pkt.mosi_o=vif.mosi_o;
                repeat(8) begin
                    @(posedge vif.sck_o);
                    pkt.data_to_out = {vif.mosi_o, pkt.data_to_out[7:1] };
                end
                spi_out.write(pkt);
            `uvm_info(get_type_name(), $sformatf("Packet Collected :\n%s", pkt.sprint()), UVM_LOW)
            //end
        end
    endtask 

    function void build_phase(uvm_phase phase);
        pkt = spi_packet::type_id::create("pkt", this);
    endfunction

    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Running Simulation ... Monitor", UVM_HIGH)
    endfunction

    function void connect_phase(uvm_phase phase);
        if (!spi_vif_config::get(this,"","vif", vif))
            `uvm_error("NOVIF","vif not set")
    endfunction
endclass