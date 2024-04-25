// $Id: $
// File name:   shift_register.sv
// Created:     4/10/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: shift register

module shift_register
(   
    input logic clk, n_rst, d_orig, shift_enable,
    output logic [7:0] data
);

    flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) sr0 ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_enable),
                                                    .serial_in(d_orig), .parallel_out(data));




endmodule