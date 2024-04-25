// $Id: $
// File name:   usb_receiver.sv
// Created:     4/10/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: USB receiver top level

module usb_receiver(
    input logic clk, n_rst, dp_i, dm_i, 
    input logic [5:0] buffer_occupancy,
    output logic w_enable, rcving, r_error, flush, data_ready,
    output logic [2:0] pid,
    output logic [31:0] rcv_data
);
    logic dp_sync, dm_sync, eop, d_orig, d_edge, shift_enable, byte_received, buff_full, data_en;
    logic [7:0] data;

    sync_high high_synchonizer ( .clk(clk), .n_rst(n_rst), .async_in(dp_i), .sync_out(dp_sync) );

    sync_low low_synchonizer ( .clk(clk), .n_rst(n_rst), .async_in(dm_i), .sync_out(dm_sync) );

    eop_detector eop_detc ( .clk(clk), .n_rst(n_rst), .dp_sync(dp_sync), .dm_sync(dm_sync), .eop(eop) );

    edge_detector edge_detc ( .clk(clk), .n_rst(n_rst), .dp_sync(dp_sync), .d_edge(d_edge) );

    decoder decode ( .clk(clk), .n_rst(n_rst), .dp_sync(dp_sync), .eop(eop), .shift_enable(shift_enable), .d_orig(d_orig) );

    timer time_block ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .rcving(rcving), .shift_enable(shift_enable), .byte_received(byte_received) );

    shift_register shift_reg ( .clk(clk), .n_rst(n_rst), .d_orig(d_orig), .shift_enable(shift_enable), .data(data) );

    rcu controller ( .clk(clk), .n_rst(n_rst), .d_edge(d_edge), .eop(eop), .shift_enable(shift_enable), .byte_received(byte_received), .buff_full(buff_full), .data(data), .data_ready(data_ready),
                     .buffer_occupancy(buffer_occupancy), .rcving(rcving), .w_enable(w_enable), .buff_clear(buff_clear), .r_error(r_error), .flush(flush), .data_en(data_en), .pid(pid) );

    rx_data_buffer data_buffer ( .clk(clk), .n_rst(n_rst), .byte_received(byte_received), .data_en(data_en), .buff_clear(buff_clear), .data(data), .buff_full(buff_full), .rcv_data(rcv_data) );


endmodule