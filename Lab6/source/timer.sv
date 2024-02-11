// $Id: $
// File name:   timer.sv
// Created:     2/7/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module timer(
    input logic clk, n_rst, enable_timer,
    output logic shift_strobe, packet_done
);

    logic [3:0] temp_count_out1;
    logic [3:0] temp_count_out2;

    flex_counter TIM1(.clk(clk), .n_rst(n_rst), .count_enable(enable_timer), .clear(!enable_timer),
            .rollover_val(4'd10), .count_out(temp_count_out1), .rollover_flag(shift_strobe));
    flex_counter TIM2(.clk(clk), .n_rst(n_rst), .count_enable(shift_strobe), .clear(!enable_timer),
            .rollover_val(4'd9), .count_out(temp_count_out2), .rollover_flag(packet_done));   

endmodule