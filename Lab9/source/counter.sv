// $Id: $
// File name:   counter.sv
// Created:     2/26/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry

module counter (
    input logic clk, n_rst, cnt_up, clear, 
    output logic one_k_samples
);
    
    logic [9:0] temp_count_out;
    flex_counter #(.NUM_CNT_BITS(10)) COUNTER(.clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(cnt_up),
            .rollover_val(10'd1000), .count_out(temp_count_out), .rollover_flag(one_k_samples));
endmodule
