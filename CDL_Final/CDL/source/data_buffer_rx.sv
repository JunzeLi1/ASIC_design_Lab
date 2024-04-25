// $Id: $
// File name:   data_buffer_rx.sv
// Created:     4/22/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module data_buffer_rx (
    input logic get_rx_data, store_rx_packet_data, flush, clk, n_rst,
    input logic [31:0] rx_packet_data,
    output logic [31:0] rx_data,
    output logic [5:0] buffer_occupancy_rx
);
    
    logic [6:0] write_ptr;
    logic [5:0] read_ptr;
    logic [5:0] write_addr;
    logic empty;
    logic full;
    logic [6:0] next_write_ptr;
    logic [5:0] next_read_ptr;
    logic [31:0] mem [63];
    logic [31:0] data_in;
    logic [31:0] data_out;
    logic [31:0] next_rx_data;
    logic [5:0] next_buffer_occupancy_rx;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            read_ptr <= 0;
            write_ptr <= 0;
            rx_data <= 0;  
            buffer_occupancy_rx <= 0;
        end
        else begin
            read_ptr <= next_read_ptr;
            write_ptr <= next_write_ptr;
            rx_data <= next_rx_data;
            buffer_occupancy_rx <= next_buffer_occupancy_rx;
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
        else if(flush) begin
            integer i;
            for (i = 0; i <= 63; i = i + 1) begin
                mem[i] <= 0;
            end
        end
        else begin
            mem[write_addr] <= data_in;
            data_out <= mem[read_ptr];
        end
    end

    always_comb begin : data_in_data_out_handle
        // prev_data_in = data_in;
        data_in = 0;
        next_rx_data = rx_packet_data;
        //if(store_tx_data == 1 && store_rx_packet_data == 0) begin
        if(store_rx_packet_data == 1) begin
            data_in = rx_packet_data;
        end
        if(get_rx_data) begin
            next_rx_data = data_out;
        end
    end

    always_comb begin : write_ptr_handle
        integer i;
        next_write_ptr = write_ptr;
        if(flush) begin
            next_write_ptr = 0;
        end
        else begin
            if(store_rx_packet_data) begin
                if(!full) begin
                    next_write_ptr = write_ptr + 1;
                end
            end
        end
    end 

    always_comb begin : read_ptr_handle
        next_read_ptr = read_ptr;
        if(flush) begin
            next_read_ptr = 0;
        end
        else begin
            if(get_rx_data) begin
                if(!full && !empty) begin
                    next_read_ptr = read_ptr + 1;
                end
            end
        end
    end

    always_comb begin : full_empty_handle
        if(write_ptr == 0) begin
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

    assign write_addr = write_ptr[5:0];
    assign next_buffer_occupancy_rx = write_ptr[5:0] - read_ptr;
 
endmodule