// $Id: $
// File name:   rx_data_buffer.sv
// Created:     4/14/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: Data Buffer for USB RX

module rx_data_buffer
(
    input logic clk, n_rst, byte_received, data_en, buff_clear,
    input logic [7:0] data,
    output logic buff_full,
    output logic [31:0] rcv_data
);
    logic [2:0] count, nxt_count;
    logic [31:0] nxt_rcv_data;


    always_ff @( posedge clk, negedge n_rst ) begin : Synchronizer
        if(n_rst == 1'b0) begin
            rcv_data <= 32'b0;
            count <= 3'b0;
        end
        else begin
            rcv_data <= nxt_rcv_data;
            count <= nxt_count;
        end
    end

    // RCV Data Logic
    always_comb begin
        nxt_rcv_data = rcv_data;
        if(byte_received && data_en) begin
            nxt_rcv_data = {data, rcv_data[31:8]};
        end
        else if(buff_clear) begin
            nxt_rcv_data = 32'b0;
        end
    end

    // Buff Full logic
    always_comb begin
        buff_full = 1'b0;
        if(count == 3'd4) begin
            buff_full = 1'b1;
        end
    end

    // Counter logic
    always_comb begin
        nxt_count = count;
        if(byte_received && data_en) begin
            nxt_count = count + 1;
        end
        else if(count == 3'd4) begin
            nxt_count = 2'b0;
        end
    end

endmodule;