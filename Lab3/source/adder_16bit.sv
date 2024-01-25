// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files
// Edited : Manas Tanneeru (10/27/2023)

module adder_16bit
(
	input logic [15:0] a,
	input logic [15:0] b,
	input logic carry_in,
	output logic [15:0] sum,
	output logic overflow
);
    genvar i;
	generate
		for(i = 0; i <= 15; i = i + 1) begin
				always @(*) begin
					assert((a[i] == 1'b1) || (a[i] == 1'b0))
					else $error ("Input 'a' of component is not a digtal logic value");

					assert((b[i] == 1'b1) || (b[i] == 1'b0))
					else $error ("Input 'b' of component is not a digtal logic value");
				end
		end
	endgenerate

	always@(carry_in) begin
		assert((carry_in == 1'b1) || (carry_in == 1'b0))
            else $error ("Input 'carry_in' of component is not a digtal logic value");
    end



	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
	adder_nbit #(.BIT_WIDTH(16)) ADD8 (.a(a[15:0]), .b(b[15:0]), .carry_in(carry_in), .sum(sum[15:0]), .overflow(overflow));

endmodule
