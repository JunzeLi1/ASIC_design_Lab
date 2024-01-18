// $Id: $
// File name:   sensor_b.sv
// Created:     1/17/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
// Description: .
module sensor_b(
    input wire [3:0] sensors,
    output reg error
);

    always @ (*) begin
        error = sensors[0] | (sensors[1] & (sensors[2] | sensors[3]));
    end

endmodule