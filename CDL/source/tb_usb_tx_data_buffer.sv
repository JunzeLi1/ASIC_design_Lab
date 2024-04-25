// $Id: $
// File name:   tb_usb_tx_data_buffer.sv
// Created:     4/19/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
`timescale 1ns / 10ps
module tb_usb_tx_data_buffer();
    // timing
    localparam CLK_PERIOD = 10;

    //*****************************************************************************
    // Declare TB Signals (Bus Model Controls)
    //*****************************************************************************
    logic [31:0] tb_tx_data;
    logic [31:0] tb_rx_packet_data;
    logic tb_get_rx_data;
    logic tb_store_tx_data;
    logic tb_clear;
    logic tb_store_rx_packet_data;
    logic tb_flush;
    logic [2:0] tb_tx_packet;
    logic [1:0] tb_hsize;
    logic [5:0] tb_buffer_occupancy;
    logic [5:0] tb_buffer_occupancy_rx;
    logic tb_tx_transfer_active;
    logic tb_tx_error;
    logic tb_dplus_out;
    logic tb_dminus_out;
    logic [31:0] tb_rx_data;
    logic tb_clk;
    logic tb_n_rst;

    //check output signal
    logic expected_tb_D_Plus;
    logic expected_tb_D_Minus;
    logic expected_tb_tx_transfer_active;
    logic expected_tb_tx_error;
    logic [31:0] expected_output = 32'b01010100001010101010000001100011;
    logic expected_output_d_plus;

    //local signal
    logic tb_mismatch;
    logic tb_check;
    string tb_test_case;
    integer tb_test_case_num;
    logic [31:0] tb_test_data;
    logic [2:0] tb_test_packet;

    //define local constant
    localparam PACKET_SIZE = 32;
    
    //clock generation block
    always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end

    usb_tx_data_buffer DUT(.tx_data(tb_tx_data), 
                            .rx_packet_data(tb_rx_packet_data),
                            .get_rx_data(tb_get_rx_data),
                            .store_tx_data(tb_store_tx_data),
                            .clear(tb_clear),
                            .clk(tb_clk), 
                            .n_rst(tb_n_rst), 
                            .store_rx_packet_data(tb_store_rx_packet_data), 
                            .flush(tb_flush),
                            .tx_packet(tb_tx_packet), 
                            .hsize(tb_hsize),
                            .buffer_occupancy(tb_buffer_occupancy),
                            .buffer_occupancy_rx(tb_buffer_occupancy_rx),
                            .tx_transfer_active(tb_tx_transfer_active),
                            .tx_error(tb_tx_error),
                            .dplus_out(tb_dplus_out),
                            .dminus_out(tb_dminus_out),
                            .rx_data(tb_rx_data) 
    );

    task reset_dut;
        begin
            // Activate the design's reset (does not need to be synchronize with clock)
            tb_n_rst = 1'b0;
            
            // Wait for a couple clock cycles
            @(posedge tb_clk);
            @(posedge tb_clk);
            
            // Release the reset
            @(posedge tb_clk);
            tb_n_rst = 1;
            
            // Wait for a while before activating the design
            @(posedge tb_clk);
            @(posedge tb_clk);

            end
    endtask

    task send_tx_packet;
        input [PACKET_SIZE - 1 : 0] data;
        input [2:0] TXpacket;
        begin
            @(posedge tb_clk);
            tb_hsize = 2'd2;
            @(posedge tb_clk);
            tb_tx_data = data;
            tb_store_tx_data = 1'b1;
            tb_hsize = 2'd2;
            tb_tx_packet = TXpacket;

            @(posedge tb_clk);
            tb_store_tx_data = 1'b0;
            tb_hsize = 0;
            

            @(posedge tb_clk);
            #(CLK_PERIOD * 600);
            tb_store_tx_data = 1'b0;
            tb_hsize = 0;
            tb_tx_packet = '0;

            #(CLK_PERIOD * 8);
            @(posedge tb_clk);
        end
    endtask

    task send_rx_packet;
        input [PACKET_SIZE - 1 : 0] data;
        begin
            @(posedge tb_clk);

            tb_rx_packet_data = data;
            tb_store_rx_packet_data = 1'b1;

            tb_hsize = 2'd1;

            @(posedge tb_clk);
            tb_store_rx_packet_data = 1'b0;

            #(CLK_PERIOD * 8);
            @(posedge tb_clk);
            tb_get_rx_data = 1'b1;
            @(posedge tb_clk);
            tb_get_rx_data = 1'b0;
            @(posedge tb_clk);
        end
    endtask

    task send_expected_output;
        input [PACKET_SIZE - 1 : 0] data;
        integer i;
        begin
            @(posedge tb_clk);
            #(CLK_PERIOD * 10);
            for (i = 0; i < 64; i = i + 1) begin
                expected_output_d_plus = data[i];
                #(CLK_PERIOD * 8);
            end
        end
    endtask

    initial begin
        tb_test_case_num = 0;
        tb_n_rst = 1;
        tb_tx_data = '0;
        tb_rx_packet_data = '0;
        tb_get_rx_data = '0;
        tb_store_tx_data = '0;
        tb_clear = '0;
        tb_store_rx_packet_data = '0;
        tb_flush = '0;
        tb_tx_packet = '0;
        tb_hsize = '0;
        tb_test_data = '0;
        expected_output_d_plus = 0;

        #(1ns);

        tb_test_case = "send multiple data";
        tb_test_case_num = tb_test_case_num + 1;
        tb_test_data = {16'b0, 8'b10110101, 8'b11110000};
        tb_test_packet = 3'b001;
        // expected_tb_D_Plus = 
        reset_dut();
        // send_rx_packet(tb_test_data);
        send_tx_packet(tb_test_data, tb_test_packet);
        $stop;


        
    end




endmodule