// $Id: $
// File name:   adder_nbit.sv
// Created:     1/24/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry

module adder_nbit
#(
    parameter BIT_WIDTH = 4   
)
(
    input logic [(BIT_WIDTH - 1) : 0] a, b,
    input logic carry_in,
    output logic [(BIT_WIDTH - 1) : 0] sum,
    output logic overflow
);

    logic [BIT_WIDTH : 0] carrys;
    genvar i;

    assign carrys[0] = carry_in;
    generate
        for(i = 0; i <= (BIT_WIDTH - 1); i = i + 1) begin
            always @(*) begin
                assert((a[i] == 1'b1) || (a[i] == 1'b0))
                else $error ("Input 'a' of component is not a digtal logic value");

                assert((b[i] == 1'b1) || (b[i] == 1'b0))
                else $error ("Input 'b' of component is not a digtal logic value");
            end
            always@(carry_in) begin
		        assert((carry_in == 1'b1) || (carry_in == 1'b0))
            else $error ("Input 'carry_in' of component is not a digtal logic value");
    end
            adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
        end
    endgenerate

    assign overflow = carrys[BIT_WIDTH];

endmodule
