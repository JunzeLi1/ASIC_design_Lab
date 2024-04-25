// $Id: $
// File name:   edge_detector.sv
// Created:     4/10/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: End of Packet Detector

module edge_detector
(
    input logic clk, n_rst, dp_sync,
    output logic d_edge
);
    logic dp_temp;
    assign d_edge = (!dp_sync & dp_temp);

    always_ff @( posedge clk, negedge n_rst ) begin : Synchronizer
        if(n_rst == 1'b0) begin
            dp_temp <= 1'b1;
        end
        else begin
            dp_temp <= dp_sync;
        end
    end

endmodule;