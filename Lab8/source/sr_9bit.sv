// $Id: $
// File name:   sr_9bit.sv
// Created:     2/7/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module sr_9bit(
    input logic clk, n_rst, shift_strobe, serial_in,
    output logic [7:0] packet_data,
    output logic stop_bit
);

    flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0)) 
        stp(.clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({stop_bit, packet_data}));

endmodule