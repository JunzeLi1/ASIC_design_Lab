// $Id: $
// File name:   adder_1bit.sv
// Created:     1/18/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
// Description: .
module adder_1bit(
    input wire a, b, carry_in,
    output reg sum, carry_out
);
    always @ (*) begin
        sum = carry_in ^ (a ^ b);
        carry_out = ((~carry_in) & b & a) | (carry_in & (b | a));
    end


endmodule