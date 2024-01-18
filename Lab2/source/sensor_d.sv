// $Id: $
// File name:   sensor_d.sv
// Created:     1/17/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
// Description: 
// 
module sensor_d(
    input wire [3:0] sensors,
    output wire error
);

    assign error = sensors[0] | (sensors[1] & (sensors[2] | sensors[3])); 

endmodule