class spi_scoreboard extends uvm_scoreboard;
    `uvm_component_utils(spi_scoreboard)

    `uvm_analysis_imp_decl (_spi)
    uvm_analysis_imp_spi#(spi_packet, spi_scoreboard) spi_in;

    `uvm_analysis_imp_decl (_pkt_from_drv)
    uvm_analysis_imp_pkt_from_drv#(spi_packet, spi_scoreboard) spi_in_drv;

    spi_packet spi_pkt;
    spi_packet spiQ[$];
    spi_packet spiQDrv[$];

    function new(string name ="spi_scoreboard", uvm_component parent);
        super.new(name, parent);
        spi_in = new("spi_in", this);
        spi_in_drv = new("spi_in_drv", this);
    endfunction

    // task run_phase (uvm_phase phase);
    //     forever begin
    //         spi_fifo.get(spi_pkt);
    //         spiQ.push_back(spi_pkt);
    //     // `uvm_info("PKT in scoreboard",$sformatf("Address mismatch YAPP %0d Chan %0d",yp.addr,cp.addr),UVM_LOW)
    //         // `uvm_info(get_type_name(), $sformatf("Packet Collected AT scoreboard :\n%s", spi_pkt.sprint()), UVM_LOW)
    //     end
    // endtask

    function void write_spi (input spi_packet packet);
        spi_packet spkt;
        $cast(spkt, packet.clone());
        spiQ.push_back(spkt);
        `uvm_info(get_type_name(), $sformatf("Packet Collected AT scoreboard :\n%s", spkt.sprint()), UVM_LOW)
    endfunction

    function void write_pkt_from_drv (input spi_packet packet);
        spi_packet spkt;
        $cast(spkt, packet.clone());
        spiQDrv.push_back(spkt);
        `uvm_info(get_type_name(), $sformatf("Packet Collected AT scoreboard from Driver:\n%s", spkt.sprint()), UVM_LOW)
    endfunction

endclass