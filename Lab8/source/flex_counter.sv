// $Id: $
// File name:   flex_counter.sv
// Created:     1/30/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry

module flex_counter
#(
    parameter  NUM_CNT_BITS = 4
)
next_count_out
(
    input logic clk, n_rst, clear, count_enable,
    input logic [NUM_CNT_BITS-1 : 0] rollover_val,
    output logic [NUM_CNT_BITS-1 : 0] count_out,
    output logic rollover_flag
);
    logic next_rollover_flag;
    logic [NUM_CNT_BITS-1 : 0] next_count_out;
    
    always_ff @ (posedge clk, negedge n_rst) begin
        if(n_rst == 0) begin
            count_out <= 0;
            rollover_flag <= 0;
        end
        else begin
            count_out <= next_count_out;
            rollover_flag <= next_rollover_flag;
        end
    end

    always_comb begin
        if(clear) begin
            next_count_out = 0;
        end
        else begin
            if(count_enable) begin
                if(count_out == rollover_val) begin
                    next_count_out = 1;
                end
                else begin
                    next_count_out = count_out + 1;
                end
            end
            else begin
                next_count_out = count_out;
            end
        end
    end

    always_comb begin
        if(clear) begin
            next_rollover_flag = 0;
        end
        else begin
            if(rollover_val == next_count_out) begin
                next_rollover_flag = 1;
            end
            else begin
                next_rollover_flag = 0;
            end
        end
    end


endmodule