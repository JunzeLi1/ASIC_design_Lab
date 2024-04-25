// $Id: $
// File name:   sync_low.sv
// Created:     1/24/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic Low Synchronizer

module sync_low
(
    input logic clk, n_rst, async_in,
    output logic sync_out
);
    logic temp;
    always_ff @( posedge clk, negedge n_rst ) begin : Synchronizer
        if(n_rst == 1'b0) begin
            sync_out <= 1'b0;
            temp <= 1'b0;
        end
        else begin
            temp <= async_in;
            sync_out <= temp;
        end
    end

endmodule;