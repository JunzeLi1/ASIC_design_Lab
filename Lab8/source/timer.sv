// $Id: $
// File name:   timer.sv
// Created:     2/7/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module timer(
    input logic clk, n_rst, enable_timer,
    input logic [3:0] data_size,
    input logic [13:0] bit_period,
    output logic shift_strobe, packet_done
);

    // logic [3:0] temp_count_out1;
    // logic [3:0] temp_count_out2;

    flex_counter #(.NUM_CNT_BITS(14)) TIM1(.clk(clk), .n_rst(n_rst), .count_enable(enable_timer), .clear(!enable_timer),
            .rollover_val(bit_period), .count_out(), .rollover_flag(shift_strobe));
    flex_counter TIM2(.clk(clk), .n_rst(n_rst), .count_enable(shift_strobe), .clear(!enable_timer),
            .rollover_val(data_size+4'd1), .count_out(), .rollover_flag(packet_done));   

endmodule