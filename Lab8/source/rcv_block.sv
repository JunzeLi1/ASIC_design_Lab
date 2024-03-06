// $Id: $
// File name:   rcv_block.sv
// Created:     2/7/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module rcv_block(
    input logic clk, n_rst, serial_in, data_read,
    input logic [3:0] data_size,
    input logic [13:0] bit_period,
    output logic [7:0] rx_data,
    output logic data_ready, overrun_error, framing_error
);

    logic shift_strobe;
    logic new_packet_detected;
    logic packet_done;
    logic enable_timer;
    logic stop_bit;
    logic SBC_enable;
    logic SBC_clear;
    logic [7:0] packet_data;
    logic load_buffer;


    start_bit_det RCV1 (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
                .start_bit_detected(new_packet_detected));
    sr_9bit RCV2 (.clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
                .serial_in(serial_in),.stop_bit(stop_bit), .packet_data(packet_data));
    timer RCV3(.clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
                .data_size(data_size), .bit_period(bit_period), .shift_strobe(shift_strobe), .packet_done(packet_done));
    rcu RCV4 (.clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), 
            .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(SBC_clear),
            .sbc_enable(SBC_enable), .load_buffer(load_buffer), .enable_timer(enable_timer));
    stop_bit_chk RCV5 (.clk(clk), .n_rst(n_rst), .sbc_clear(SBC_clear), .sbc_enable(SBC_enable),
            .stop_bit(stop_bit), .framing_error(framing_error));
    rx_data_buff RCV6 (.clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), .packet_data(packet_data),
                .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error));


endmodule

