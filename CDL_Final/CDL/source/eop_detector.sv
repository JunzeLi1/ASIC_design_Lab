// $Id: $
// File name:   eop_detector.sv
// Created:     4/10/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: End of Packet Detector

module eop_detector
(
    input logic clk, n_rst, dp_sync, dm_sync,
    output logic eop
);
    assign eop = (!dm_sync && !dp_sync);

    

endmodule;