// $Id: $
// File name:   usb_tx.sv
// Created:     4/9/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module usb_tx (
    input logic [5:0] buffer_occupancy, 
    input logic clk, n_rst,
    input logic [7:0] tx_packet_data, 
    input logic [2:0] tx_packet, 
    output logic tx_transfer_active, tx_error, dplus_out, dminus_out, get_tx_packet_data
);

    logic enable_timer;
    logic byte_complete;
    logic [1:0] send_data;
    logic enable_pts;
    logic send_EOP;
    logic clk12;
    logic [7:0] data;
    logic serial_out;
    logic enable_timer_bits8; //new defined
    logic bits8; // new defined 
    logic enable_timer_bits54;
    logic bits54;
    logic enable_timer_bits52;
    logic bits51;
    logic enable_timer_bits51;

    controller_tx CONTROLLER(.tx_packet(tx_packet),
                            .byte_complete(byte_complete), 
                            .clk(clk), 
                            .n_rst(n_rst),
                            .enable_timer(enable_timer),
                            .send_EOP(send_EOP),
                            .enable_pts(enable_pts),
                            .tx_transfer_active(tx_transfer_active), 
                            .tx_error(tx_error), 
                            .get_tx_packet_data(get_tx_packet_data),
                            .send_data(send_data),
                            .bits8(bits8),
                            .enable_timer_bits8(enable_timer_bits8),
                            .bits54(bits54),
                            .enable_timer_bits54(enable_timer_bits54),
                            .bits51(bits51),
                            .enable_timer_bits51(enable_timer_bits51),
                            .enable_timer_bits52(enable_timer_bits52),
                            .buffer_occupancy(buffer_occupancy));
    
    timer_tx TIMER(.clk(clk),
                    .n_rst(n_rst),
                    .enable_timer(enable_timer),
                    .byte_complete(byte_complete),
                    .clk12(clk12));

    timer2_tx TIMER2(.clk(clk),
                    .n_rst(n_rst),
                    .enable_timer_bits8(enable_timer_bits8),
                    .bits8(bits8));
    
    timer3_tx TIMER3(.clk(clk),
                    .n_rst(n_rst),
                    .enable_timer_bits54(enable_timer_bits54),
                    .enable_timer_bits52(enable_timer_bits52),
                    .bits54(bits54));

    timer4_tx TIMER4(.clk(clk),
                    .n_rst(n_rst),
                    .enable_timer_bits51(enable_timer_bits51),
                    .bits51(bits51));
    
    shift_register_tx SHIFT_REG(.clk(clk), .n_rst(n_rst),
                            .clk12(clk12), 
                            .enable_pts(enable_pts),
                            .send_data(send_data),
                            .tx_packet(tx_packet),
                            .tx_packet_data(tx_packet_data),
                            .serial_out(serial_out));

    encoder ENCODER_TX(.clk(clk), .n_rst(n_rst),
                        .serial_out(serial_out), 
                        .send_EOP(send_EOP),
                        .D_plus(dplus_out),
                        .D_minus(dminus_out),
                        .clk12(clk12),
                        .enable_pts(enable_pts));

endmodule
