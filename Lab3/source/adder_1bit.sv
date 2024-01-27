// $Id: $
// File name:   adder_1bit.sv
// Created:     1/18/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
// Description: .
module adder_1bit(
    input logic a, b, carry_in,
    output logic sum, carry_out
);
    always @ (*) begin
        assert((a == 1'b1) || (a == 1'b0))
        else $error ("Input 'a' of component is not a digtal logic value");

        assert((b == 1'b1) || (b == 1'b0))
        else $error ("Input 'b' of component is not a digtal logic value");

        assert((carry_in == 1'b1) || (carry_in == 1'b0))
        else $error ("Input 'carry_in' of component is not a digtal logic value");

        
    end
    assign sum = carry_in ^ (a ^ b);
    assign carry_out = ((~carry_in) & b & a) | (carry_in & (b | a));


endmodule