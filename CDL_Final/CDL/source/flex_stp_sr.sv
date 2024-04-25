// $Id: $
// File name:   flex_stp_sr
// Created:     1/31/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: flex serial to parallel shift register
module flex_stp_sr
#(
    parameter NUM_BITS = 8,
    parameter SHIFT_MSB = 1
)
(
    input logic clk, n_rst, shift_enable, serial_in,
    output logic [NUM_BITS-1:0] parallel_out
);
    logic [NUM_BITS - 1:0] nxt_parallel_out;

    always_ff @( posedge clk, negedge n_rst ) begin
        if(n_rst == 0) begin
            parallel_out <= '1;
        end
        else begin
            parallel_out <= nxt_parallel_out;
        end
    end

    always_comb begin 
        if(shift_enable) begin
            if(SHIFT_MSB) begin
                nxt_parallel_out = {parallel_out[NUM_BITS - 2:0], serial_in};
            end
            else begin
                nxt_parallel_out = {serial_in, parallel_out[NUM_BITS - 1:1]};
            end
        end
        else begin
            nxt_parallel_out = parallel_out;
        end
    end
endmodule