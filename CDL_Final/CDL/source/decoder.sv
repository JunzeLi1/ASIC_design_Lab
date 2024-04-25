// $Id: $
// File name:   decoder.sv
// Created:     4/10/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: dp_sync decoder

module decoder
(
    input logic clk, n_rst, dp_sync, eop, shift_enable,
    output logic d_orig
);

    logic temp_mid, temp_end, next_temp_end;
    assign d_orig = !(temp_mid ^ temp_end);

    always_ff @( posedge clk, negedge n_rst ) begin : Synchronizer
        if(n_rst == 1'b0) begin
            temp_mid <= 1'b1;
            temp_end <= 1'b1;
        end
        else begin
            temp_mid <= dp_sync;
            temp_end <= next_temp_end;
        end
    end

    always_comb begin
        if(shift_enable) begin
            if(eop) begin
                next_temp_end = 1'b1;
            end
            else begin
                next_temp_end = temp_mid;
            end
        end
        else begin
            next_temp_end = temp_end;
        end
    end

endmodule;