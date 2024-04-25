// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/1/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module flex_pts_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input logic clk, n_rst, shift_enable, load_enable,
    input logic [NUM_BITS-1 : 0] parallel_in,
    output logic serial_out
);

    logic [NUM_BITS-1 : 0] next_parallel;
    logic [NUM_BITS-1 : 0] parallel_out;

    always_ff @ (posedge clk, negedge n_rst) begin
        if(n_rst == 0) begin
            parallel_out <= '1;
        end
        else begin
            parallel_out <= next_parallel;
        end
    end

    always_comb begin
        if(load_enable) begin
            next_parallel = parallel_in;
        end
        else if(shift_enable) begin
            if(SHIFT_MSB) begin
                next_parallel = {parallel_out[NUM_BITS-2 : 0], 1'b1};
            end
            else begin
                next_parallel = {1'b1, parallel_out[NUM_BITS-1 : 1]};
            end       
        end
        else begin
            next_parallel = parallel_out;
        end
    end

    always_comb begin
        if(!SHIFT_MSB) begin
            serial_out = parallel_out[0];
        end
        else begin
            serial_out = parallel_out[NUM_BITS - 1];
        end
    end
endmodule