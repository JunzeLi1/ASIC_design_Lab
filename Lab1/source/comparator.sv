// System Verilog for ECE337 Lab 1
// The Following code is used to compare 2 16-bit quantites, a and b. The code 
// determines whether or not:
// a is greater than b, gt = 1, lt = 0, eq = 0
// a is less than b, gt = 0, lt = 1, eq = 0
// a is equal to b, gt = 0, lt = 0, eq = 1

// Use a tab size of 2 spaces for best viewing results


module comparator
(
	input logic [15:0] a,
	input logic [15:0] b,
	output logic gt,
	output logic lt,
	output logic eq
);

	always_comb begin: COMPARATOR
                gt = 0;
                lt = 0;
                eq = 0;

		if (a > b) begin
		        gt = 1'b1;
                end else if (a < b) begin
                        lt = 1'b1;
                end else begin
                        eq = 1'b1;
                    end
               end
endmodule;
