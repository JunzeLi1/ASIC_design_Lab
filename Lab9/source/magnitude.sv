// $Id: $
// File name:   magnitude.sv
// Created:     2/26/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module magnitude(
    input logic [16:0] in,
    output logic [15:0] out
);
    // assign out = in[15:0];
    always_comb begin
        if(in[16] == 1) begin
            out = (~in[15:0]) + 16'd1;
        end
        else begin
             out = in[15:0];
        end
    end
    
endmodule