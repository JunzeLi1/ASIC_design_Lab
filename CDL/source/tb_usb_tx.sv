// $Id: $
// File name:   tb_usb_tx.sv
// Created:     4/10/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
`timescale 1ns / 10ps
module tb_usb_tx ();
        // timing
    localparam CLK_PERIOD = 10;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
    logic [6:0] tb_buffer_occupancy;
    logic [7:0] tb_tx_packet_data;
    logic [2:0] tb_tx_packet;
    logic tb_tx_transfer_active;
    logic tb_tx_error;
    logic tb_dplus_out;
    logic tb_dminus_out;
    logic tb_get_tx_packet_data;
    logic tb_clk;
    logic tb_n_rst;
    
    //check output signal
    logic [7:0] expected_tb_D_Plus;
    logic [7:0] expected_tb_D_Minus;
    logic expected_tb_tx_transfer_active;
    logic expected_tb_tx_error;
    
        
    typedef struct{
        logic [7:0] data [5:0];
        logic [7:0] result [5:0];
    } testvector;

    //local signal
    logic tb_mismatch;
    logic tb_check;
    string tb_test_case;
    testvector tb_test_vector[];
    integer tb_test_case_num;
    logic [7:0] tb_test_data;
    logic [2:0] tb_test_packet;

    //define local constant
    localparam PACKET_SIZE = 8;


    // Clock gen block
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end
     
    // DUT port map
    usb_tx DUT(.clk(tb_clk), 
                .n_rst(tb_n_rst),
                .buffer_occupancy(tb_buffer_occupancy),
                .tx_packet_data(tb_tx_packet_data),
                .tx_packet(tb_tx_packet),
                .tx_transfer_active(tb_tx_transfer_active),
                .tx_error(tb_tx_error),
                .dplus_out(tb_dplus_out),
                .dminus_out(tb_dminus_out),
                .get_tx_packet_data(tb_get_tx_packet_data));
    
    task reset_dut;
        begin
            // Activate the design's reset (does not need to be synchronize with clock)
            tb_n_rst = 1'b0;
            
            // Wait for a couple clock cycles
            @(posedge tb_clk);
            @(posedge tb_clk);
            
            // Release the reset
            @(negedge tb_clk);
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
            @(negedge tb_clk);

            tb_tx_packet_data = data;
            tb_tx_packet = TXpacket;

            @(negedge tb_clk);
            #(CLK_PERIOD * 100);
            tb_buffer_occupancy = 7'b1;
            #(CLK_PERIOD * 200);
            tb_buffer_occupancy = 7'b0;
            tb_tx_packet_data = data;
            tb_tx_packet = TXpacket;
            #(CLK_PERIOD * 200);
            tb_tx_packet_data = 0;
            tb_tx_packet = 0;
        end
    endtask

    task check_outputs;
        input string check_tag;
        begin
            tb_mismatch = 1'b0;
            tb_check    = 1'b1;
            if(expected_tb_D_Minus == tb_dminus_out) begin
                $info("Correct 'D minus' output %s during %s test case", check_tag, tb_test_case);
            end
            else begin
                tb_mismatch = 1'b1;
                $error("Incorrect 'D minus' output %s during %s test case", check_tag, tb_test_case);
            end

            if(expected_tb_D_Plus == tb_dplus_out) begin
                $info("Correct 'D plus' output %s during %s test case", check_tag, tb_test_case);
            end
            else begin
                tb_mismatch = 1'b1;
                $error("Incorrect 'D plus' output %s during %s test case", check_tag, tb_test_case);
            end

            if(expected_tb_tx_transfer_active == tb_tx_transfer_active) begin
                $info("Correct 'tx transfer_active' output %s during %s test case", check_tag, tb_test_case);
            end
            else begin
                tb_mismatch = 1'b1;
                $error("Incorrect 'tx transfer_active' output %s during %s test case", check_tag, tb_test_case);
            end

            if(expected_tb_tx_error == tb_tx_error) begin
                $info("Correct 'tx error' output %s during %s test case", check_tag, tb_test_case);
            end
            else begin
                tb_mismatch = 1'b1;
                $error("Incorrect 'tx error' output %s during %s test case", check_tag, tb_test_case);
            end
        end
    endtask

    initial begin
        tb_test_vector = new[2];
        //case 0
        tb_test_vector[0].data = {8'b10110101, 8'b11111111, 8'b00000001, 8'b00000101, 8'b00011001, 8'b10010001};
        tb_test_vector[0].result = {8'b10110101, 8'b11111111, 8'b00000001, 8'b00000101, 8'b00011001, 8'b10010001};

        //case 1
        tb_test_vector[1].data = {8'b10110101, 8'b11111111, 8'b00000001, 8'b00000101, 8'b00011001, 8'b10010001};
        tb_test_vector[1].result = {8'b10110101, 8'b11111111, 8'b00000001, 8'b00000101, 8'b00011001, 8'b10010001};
    end

    initial begin
        tb_test_case_num = 0;
        
        tb_test_data = 0;
        tb_test_packet = 0;
        tb_n_rst = 1;
        expected_tb_D_Plus = 0;
        expected_tb_D_Minus = 0;
        expected_tb_tx_transfer_active = 0;
        expected_tb_tx_error = 0;
        tb_tx_packet_data = 0;
        tb_tx_packet = 0;
        tb_buffer_occupancy = 0;
        
        #(1ns);

        // case 1
        tb_test_case = "send multiple data";
        tb_test_case_num = tb_test_case_num + 1;
        tb_test_data = 8'b10110101;
        tb_test_packet = 3'b001;
        reset_dut();
        send_tx_packet(tb_test_data, tb_test_packet);
        
        send_tx_packet(8'b00000000, 3'b010);
        $stop;

    end

endmodule