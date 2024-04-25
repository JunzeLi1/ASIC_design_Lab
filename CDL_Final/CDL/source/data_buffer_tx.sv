// $Id: $
// File name:   data_buffer.sv
// Created:     4/9/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module data_buffer_tx (
    input logic store_tx_data, clear, get_tx_packet_data, clk, n_rst,
    input logic [31:0] tx_data,
    input logic [1:0] hsize,
    output logic [7:0] tx_packet_data, 
    output logic [5:0] buffer_occupancy
);
       
    logic [6:0] write_ptr1;
    logic [5:0] read_ptr;
    logic [5:0] write_addr;
    logic empty;
    logic full;
    logic [6:0] next_write_ptr1;
    logic [5:0] next_read_ptr;
    logic [7:0] mem [63];
    logic [31:0] data_in;
    logic [7:0] data_out;
    logic [7:0] next_tx_packet_data;
    logic [5:0] next_buffer_occupancy;
    logic [5:0] buffer_occupancy1;
    // logic [7:0] prev_data_in;
    // logic [7:0] next_data_out;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            read_ptr <= 0;
            //write_ptr1 <= 7'b0;
            write_ptr1[0] <= 0;
            write_ptr1[1] <= 0;
            write_ptr1[2] <= 0;
            write_ptr1[3] <= 0;
            write_ptr1[4] <= 0;
            write_ptr1[5] <= 0;
            write_ptr1[6] <= 0;
            // data_in <= 0;    
            // next_data_out <= 0;
            tx_packet_data <= 0;
            buffer_occupancy1 <= 0;
        end
        else begin
            read_ptr <= next_read_ptr;
            write_ptr1 <= next_write_ptr1;
            // data_in <= prev_data_in;
            // next_data_out <= data_out;
            tx_packet_data <= next_tx_packet_data;
            buffer_occupancy1 <= next_buffer_occupancy;
        end      
    end

    always_ff @(posedge clk, negedge n_rst) begin : write_data
        if(!n_rst) begin
            integer j;
            data_out <= 0;
            for (j = 0; j <= 63; j = j + 1) begin
                mem[j] <= 0;
            end
        end
        else if(clear) begin
            integer i;
            for (i = 0; i <= 63; i = i + 1) begin
                mem[i] <= 0;
            end
        end
        else begin
            case (hsize)
                3'd1: begin
                    mem[write_addr] <= data_in[7:0];
                end
                3'd2: begin
                    mem[write_addr] <= data_in[7:0];
                    mem[write_addr + 1] <= data_in[15:8];
                end
                3'd3: begin
                    mem[write_addr] <= data_in[7:0];
                    mem[write_addr + 1] <= data_in[15:8];
                    mem[write_addr + 2] <= data_in[23:16];
                    mem[write_addr + 3] <= data_in[31:24];
                end
                default: begin
                    mem[write_addr] <= 8'b0;
                end
                
            endcase
            data_out <= mem[read_ptr];
        end
    end

    always_comb begin : data_in_data_out_handle
        // prev_data_in = data_in;
        data_in = 0;
        next_tx_packet_data = tx_packet_data;
        //if(store_tx_data == 1 && store_rx_packet_data == 0) begin
        if(store_tx_data == 1) begin
            data_in = tx_data;
        end
        if(get_tx_packet_data == 1) begin
            next_tx_packet_data = data_out;
        end
    end

    always_comb begin : write_ptr1_handle
        integer i;
        next_write_ptr1 = write_ptr1;
        if(clear) begin
            next_write_ptr1 = 0;
        end
        else begin
            if(store_tx_data) begin
                if(!full) begin
                    case(hsize) 
                        3'b1: begin
                            next_write_ptr1 = write_ptr1 + 6'b1;
                        end
                        3'd2: begin
                            next_write_ptr1 = write_ptr1 + 6'd2;
                        end
                        3'd3: begin
                            next_write_ptr1 = write_ptr1 + 6'd4;
                        end
                        default: begin
                            next_write_ptr1 = write_ptr1;
                        end
                    endcase
                end
            end
        end
    end 

    always_comb begin : read_ptr_handle
        next_read_ptr = read_ptr;
        if(clear) begin
            next_read_ptr = 0;
        end
        else begin
            if(get_tx_packet_data) begin
                if(!full && !empty) begin
                    next_read_ptr = read_ptr + 1;
                end
            end
        end
    end

    always_comb begin : full_empty_handle
        if(write_ptr1 == 0) begin
            empty = 1;
        end
        else begin
            empty = 0;
        end
        if(read_ptr == 63) begin
            full = 1;
        end
        else begin
            full = 0;
        end
    end

    assign write_addr = write_ptr1[5:0];
    assign next_buffer_occupancy = write_ptr1[5:0] - read_ptr;
    logic [5:0] shift_reg[62:0];

    always_ff @(posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            integer i;
            for (i = 0; i < 64; i = i + 1) begin
                shift_reg[i] <= 6'b0;
            end
        end
        else begin
            integer j;
            shift_reg[0] <= buffer_occupancy1;
            for (j = 1; j < 63; j = j + 1) begin
                shift_reg[j] <= shift_reg[j - 1];
            end
        end
    end

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            buffer_occupancy <= '0;
        end
        else begin
            buffer_occupancy <= shift_reg[62];
        end
        
    end
 
endmodule