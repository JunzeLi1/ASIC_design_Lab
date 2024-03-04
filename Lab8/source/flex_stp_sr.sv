// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/1/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module flex_stp_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input logic clk, n_rst, shift_enable, serial_in,
    output logic [NUM_BITS-1 : 0] parallel_out
);

    logic [NUM_BITS-1 : 0] next_parallel;

    always_ff @ (posedge clk, negedge n_rst) begin
        if(n_rst == 0) begin
            parallel_out <= '1;
        end
        else begin
            parallel_out <= next_parallel;
        end
    end

    always_comb begin
        next_parallel = parallel_out;
        if(shift_enable) begin
            if(SHIFT_MSB) begin
                next_parallel = {parallel_out[NUM_BITS-2 : 0], serial_in};
            end
            else begin
                next_parallel = {serial_in, parallel_out[NUM_BITS-1 : 1]};
            end       
        end
    end

endmodule
