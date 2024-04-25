// $Id: $
// File name:   timer4_tx.sv
// Created:     4/21/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module timer4_tx (
    input logic enable_timer_bits51, clk, n_rst,
    output logic bits51
);
    logic [5:0] count_out1;

    flex_counter #(.NUM_CNT_BITS(6)) CNT1(.clk(clk), .n_rst(n_rst), .clear(!enable_timer_bits51),
                    .count_enable(enable_timer_bits51), .rollover_val(6'd51), 
                    .count_out(count_out1), .rollover_flag(bits51));
    
    
endmodule