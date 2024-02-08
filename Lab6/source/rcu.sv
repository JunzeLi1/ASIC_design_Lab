// $Id: $
// File name:   rcu.sv
// Created:     2/7/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module rcu(
    input logic clk, n_rst, 
                new_packet_detected, packet_done, 
                framing_error,
    output logic sbc_clear, sbc_enable, load_buffer, enable_timer
);

endmodule