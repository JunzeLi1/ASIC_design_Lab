// $Id: $
// File name:   shift_register_tx.sv
// Created:     4/10/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module shift_register_tx (
    input logic enable_pts, clk12, clk, n_rst,
    input logic [1:0] send_data,
    input logic [2:0] tx_packet,
    input logic [7:0] tx_packet_data,
    output logic serial_out
);

    logic [7:0] data;
    logic [3:0] tx_packet_out;

    always_comb begin
        case(tx_packet)
            1: begin
                tx_packet_out = 4'b0011;
            end
            2: begin
                tx_packet_out = 4'b0010;
            end
            3: begin
                tx_packet_out = 4'b1010;
            end
            4: begin
                tx_packet_out = 4'b1110;
            end
            default: tx_packet_out = '0;
        endcase
    end

    always_comb begin
        case (send_data)
            1: begin
                data = {8'b10000000}; //
            end
            2: begin
                data = {4'b0, tx_packet_out};//
            end
            3: begin
                data = tx_packet_data;
            end
            default: 
                data = 0;
        endcase       
    end
    flex_pts_sr #(.NUM_BITS(8), .SHIFT_MSB(0))
        SR8(.clk(clk), .n_rst(n_rst), .shift_enable(clk12), 
        .load_enable(enable_pts), .parallel_in(data), .serial_out(serial_out));
    
endmodule