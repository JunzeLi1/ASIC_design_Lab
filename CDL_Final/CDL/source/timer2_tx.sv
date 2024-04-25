// $Id: $
// File name:   timer2_tx.sv
// Created:     4/11/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module timer2_tx (
    input logic enable_timer_bits8, clk, n_rst,
    output logic bits8
);
    logic [3:0] count_out1;

    flex_counter CNT1(.clk(clk), .n_rst(n_rst), .clear(!enable_timer_bits8),
                    .count_enable(enable_timer_bits8), .rollover_val(4'b1001), 
                    .count_out(count_out1), .rollover_flag(bits8));
    
    
endmodule