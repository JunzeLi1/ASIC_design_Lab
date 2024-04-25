// $Id: $
// File name:   timer_tx.sv
// Created:     4/10/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module timer_tx (
    input logic enable_timer, clk, n_rst,
    output logic byte_complete, clk12
);
    logic [3:0] count_out1;
    logic [3:0] count_out2;

    flex_counter CNT1(.clk(clk), .n_rst(n_rst), .clear(!enable_timer),
                    .count_enable(enable_timer), .rollover_val(4'b1000), 
                    .count_out(count_out1), .rollover_flag(clk12));
    flex_counter CNT2(.clk(clk), .n_rst(n_rst), .clear(!enable_timer),
                    .count_enable(clk12), .rollover_val(4'b1000), 
                    .count_out(count_out2), .rollover_flag(byte_complete));
    
    
endmodule