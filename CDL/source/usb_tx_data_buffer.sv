// $Id: $
// File name:   usb_tx_data_buffer.sv
// Created:     4/19/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module usb_tx_data_buffer(
    input logic [31:0] tx_data, rx_packet_data,
    input logic get_rx_data, store_tx_data, clear, clk, n_rst, store_rx_packet_data, flush, 
    input logic [2:0] tx_packet,
    input logic [1:0] hsize,
    output logic [5:0] buffer_occupancy, buffer_occupancy_rx, 
    output logic tx_transfer_active, tx_error, dplus_out, dminus_out,
    output logic [31:0] rx_data
);

    logic [7:0] tx_packet_data;
    logic get_tx_packet_data;

    data_buffer_tx DATA_BUFFER(.store_tx_data(store_tx_data), 
                            .clear(clear), 
                            .get_tx_packet_data(get_tx_packet_data), 
                            .clk(clk), 
                            .n_rst(n_rst),
                            .tx_data(tx_data),
                            .hsize(hsize),
                            .tx_packet_data(tx_packet_data),
                            .buffer_occupancy(buffer_occupancy));

    data_buffer_rx DATA_BUFFER1(.get_rx_data(get_rx_data), 
                                .store_rx_packet_data(store_rx_packet_data), 
                                .flush(flush), 
                                .clk(clk), 
                                .n_rst(n_rst),
                                .rx_packet_data(rx_packet_data),
                                .rx_data(rx_data),
                                .buffer_occupancy_rx(buffer_occupancy_rx));

    usb_tx USB(.clk(clk), 
                .n_rst(n_rst),
                .buffer_occupancy(buffer_occupancy),
                .tx_packet_data(tx_packet_data),
                .tx_packet(tx_packet),
                .tx_transfer_active(tx_transfer_active),
                .tx_error(tx_error),
                .dplus_out(dplus_out),
                .dminus_out(dminus_out),
                .get_tx_packet_data(get_tx_packet_data));


endmodule