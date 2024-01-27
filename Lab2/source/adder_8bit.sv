// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files
// Edited : Manas Tanneeru (10/27/2023)

module adder_8bit
(
	input logic [7:0] a,
	input logic [7:0] b,
	input logic carry_in,
	output logic [7:0] sum,
	output logic overflow
);

	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
	adder_nbit #(.BIT_WIDTH(8)) ADD8 (.a(a[7:0]), .b(b[7:0]), .carry_in(carry_in), .sum(sum[7:0]), .overflow(overflow));

endmodule
