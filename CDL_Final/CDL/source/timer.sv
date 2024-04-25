// $Id: $
// File name:   timer.sv
// Created:     4/10/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: Timing Controller Design

module timer
(   
    input logic clk, n_rst, d_edge, rcving,
    output logic shift_enable, byte_received
);
    logic nxt_shift_enable;
    logic [3:0] count, nxt_count;

    always_ff @( posedge clk, negedge n_rst ) begin
        if(!n_rst) begin
            count <= 4'd5;
            shift_enable <= 1'b0;
        end
        else begin
            count <= nxt_count;
            shift_enable <= nxt_shift_enable;
        end
    end

    always_comb begin
        nxt_count = count;
        if(d_edge) begin
            nxt_count = 4'd5;
        end
        else if(rcving) begin
            if(count == 4'd8)begin
                nxt_count = 4'd1;
            end
            else begin
                nxt_count = count + 4'd1;
            end
        end
    end

    always_comb begin
        nxt_shift_enable = 1'b0;
        if(d_edge) begin
            nxt_shift_enable = 1'b0;
        end
        else if(nxt_count == 4'd8) begin
            nxt_shift_enable = 1'b1;
        end
        else begin
            nxt_shift_enable = 1'b0;
        end
    end
    
    flex_counter #( .NUM_CNT_BITS(4)) bit_counter (.clk(clk), .n_rst(n_rst), .clear(byte_received), .count_enable(shift_enable), .rollover_val(4'd8), 
                                .rollover_flag(byte_received), .count_out());

endmodule