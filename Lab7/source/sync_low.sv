// $Id: $
// File name:   sync_low.sv
// Created:     1/28/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry

module sync_low (
    input logic clk, n_rst, async_in,
    output logic sync_out
);

    reg dtemp;
    always_ff @ (posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            dtemp <= 1'b0;
            sync_out <= 1'b0;
        end
        else begin
            dtemp <= async_in;
            sync_out <= dtemp;
        end
    end
    
endmodule
