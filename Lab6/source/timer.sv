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

    logic check_flag1 = 4'b1001;
    logic check_flag2 = 4'b1010;

    logic [3:0] temp_count_out1;
    logic [3:0] temp_count_out2;

    flex_counter timer1(.clk(clk), .n_rst(n_rst), .count_enable(enable_timer),
            .rollover_val(check_flag), .count_out(temp_count_out1), .rollover_flag(shift_strobe));
    flex_counter timer2(.clk(clk), .n_rst(n_rst), .count_enable(shift_strobe),
            .rollover_val(check_flag), .count_out(temp_count_out2), .rollover_flag(packet_done));   

endmodule