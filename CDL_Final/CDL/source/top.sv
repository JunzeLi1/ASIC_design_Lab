// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/12/2024
// Author:      Kai Ze Ee
// Lab Section: 337-16
// Version:     1.0  Initial Design Entry

module top
(
	input logic clk, 
    input logic n_rst,

    //slave side input
    input logic hsel, hwrite, 
    input logic [1:0] hsize, htrans,
    input logic [3:0] haddr, 
    input logic [31:0] hwdata,

    //rx serial input
    input logic dplus_i, dminus_i,

    //slave side output
    output logic [31:0] hrdata,
    output logic hresp, d_mode,

    //tx output
    output logic dplus_o, dminus_o
);


//rx -> ahb
logic [2:0] rx_packet;
logic rx_data_ready, rx_transfer_active, rx_error;

//rx -> data buffer
logic store_rx_packet, flush_rx2ahb;
logic [31:0] rx_packet_data; //double check size with hunter

//tx -> ahb
logic tx_error, tx_transfer_active;

//tx -> data_buffer
logic get_tx_packet_data;

//ahb -> tx
logic [2:0] tx_packet;

//ahb -> data buff
logic get_rx_data, store_tx_data;
logic [31:0] tx_data;
logic clear_ahb2buffer;

//data buff -> ahb
logic [31:0] rx_data;

//data buff -> tx
logic [7:0] tx_packet_data;

//data buff -> all
logic [5:0] buffer_occupancy_rx;
logic [5:0] buffer_occupancy_tx;
logic [1:0] hsize_out;

ahb_lite_slave BUS( 
                .clk(clk), 
                .n_rst(n_rst), 
                //slave side signals
                .hsel(hsel), 
                .haddr(haddr), 
                .hsize(hsize), 
                .htrans(htrans), 
                .hwrite(hwrite), 
                .hwdata(hwdata), 
                .hrdata(hrdata), 
                .hresp(hresp),

                //RX signals
                .rx_packet(rx_packet),
                .rx_data_ready(rx_data_ready),
                .rx_transfer_active(rx_transfer_active),
                .rx_error(rx_error),
                
                //TX signals
                .tx_packet(tx_packet),
                .tx_transfer_active(tx_transfer_active),
                .tx_error(tx_error),

                //Data Buffer
                .buffer_occupancy(buffer_occupancy_tx),
                .rx_data(rx_data),
                .get_rx_data(get_rx_data),
                .store_tx_data(store_tx_data),
                .tx_data(tx_data),
                .clear(clear_ahb2buffer),
                .hsize_out(hsize_out)
                );

usb_receiver RX(    
                .clk(clk), 
                .n_rst(n_rst), 

                //inputs
                .dp_i(dplus_i), 
                .dm_i(dminus_i),

                //
                .buffer_occupancy(buffer_occupancy_rx),
                
                //to slave
                .pid(rx_packet),
                .data_ready(rx_data_ready),
                .rcving(rx_transfer_active),
                .r_error(rx_error),                  

                //to Buffer
                .flush(flush_rx2ahb),
                .w_enable(store_rx_packet),
                .rcv_data(rx_packet_data)
                );

usb_tx TX(  
            .clk(clk), 
            .n_rst(n_rst),

            //external out
            .dplus_out(dplus_o),
            .dminus_out(dminus_o),

            //to ahb
            .tx_transfer_active(tx_transfer_active),
            .tx_error(tx_error),

            //from ahb
            .tx_packet(tx_packet),

            //to data buffer
            .tx_packet_data(tx_packet_data),
            .get_tx_packet_data(get_tx_packet_data),
            .buffer_occupancy(buffer_occupancy_tx)
        );

data_buffer_tx TXDBUFF(       
                    .clk(clk), 
                    .n_rst(n_rst),

                    //ahb
                    .store_tx_data(store_tx_data), 
                    .clear(clear_ahb2buffer), 

                    //tx
                    .get_tx_packet_data(get_tx_packet_data), 
                    .tx_packet_data(tx_packet_data),
                    .tx_data(tx_data),

                    .hsize(hsize_out),
                    .buffer_occupancy(buffer_occupancy_tx)
                    );

data_buffer_rx RXDBUFF(       
                    .clk(clk), 
                    .n_rst(n_rst),

                    //ahb
                    .rx_data(rx_data),
                    .get_rx_data(get_rx_data), 

                    //rx
                    .store_rx_packet_data(store_rx_packet), 
                    .flush(flush_rx2ahb), 
                    .rx_packet_data(rx_packet_data),

                    .buffer_occupancy_rx(buffer_occupancy_rx)
                    );



endmodule