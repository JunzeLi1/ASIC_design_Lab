// $Id: $
// File name:   timer3_tx.sv
// Created:     4/13/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module timer3_tx (
    input logic enable_timer_bits54, enable_timer_bits52, clk, n_rst,
    output logic bits54
);
    logic [5:0] tmp_rollover_val;
    logic tmp_count_enable;

    always_comb begin
        if(enable_timer_bits52) begin
            tmp_rollover_val = 6'd52;
        end
        else if(enable_timer_bits54) begin
            tmp_rollover_val = 6'd54;
        end
        else begin
            tmp_rollover_val = '0;
        end    
    end
    
    assign tmp_count_enable = enable_timer_bits54 || enable_timer_bits52;

    logic [5:0] count_out1;
    flex_counter #(.NUM_CNT_BITS(6)) CNT1(.clk(clk), .n_rst(n_rst), .clear(!tmp_count_enable),
                    .count_enable(tmp_count_enable), .rollover_val(tmp_rollover_val), 
                    .count_out(count_out1), .rollover_flag(bits54));
    
    
endmodule