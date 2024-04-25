// $Id: $
// File name:   tb_data_buffer.sv
// Created:     4/9/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
`timescale 1ns / 10ps
module tb_data_buffer_tx();
    
    // timing
    localparam CLK_PERIOD = 10;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
    logic tb_get_rx_data;
    logic tb_store_tx_data;
    logic tb_clear;
    logic tb_get_tx_packet_data;
    logic tb_store_rx_packet_data;
    logic tb_flush;
    logic tb_clk;
    logic tb_n_rst;
    logic [31:0] tb_tx_data;
    logic [31:0] tb_rx_packet_data;
    logic [7:0] tb_rx_data;
    logic [7:0] tb_tx_packet_data;
    logic [6:0] tb_buffer_occupancy;
    logic [2:0] tb_hsize;

    //check output signal
    logic [7:0] expected_tb_rx_data;
    logic [7:0] expected_tb_tx_packet_data;
    logic [6:0] expected_tb_buffer_occupancy;
    
        
    typedef struct{
        logic [31:0] data [5:0];
        logic [31:0] result [5:0];
    } testvector;

    //local signal
    logic tb_mismatch;
    logic tb_check;
    string tb_test_case;
    testvector tb_test_vector[];
    integer tb_test_case_num;
    logic [31:0] tb_test_data;
    logic [31:0] tb_test_data1;

    //define local constant
    localparam PACKET_SIZE = 32;


    // Clock gen block
    always begin
        // Start with clock low to avoid false rising edge events at t=0
        tb_clk = 1'b0;
        // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
        #(CLK_PERIOD/2.0);
        tb_clk = 1'b1;
        // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
        #(CLK_PERIOD/2.0);
      end
     
    // DUT port map
    data_buffer_tx DUT(.get_rx_data(tb_get_rx_data), 
                    .store_tx_data(tb_store_tx_data), 
                    .clear(tb_clear), 
                    .get_tx_packet_data(tb_get_tx_packet_data), 
                    .store_rx_packet_data(tb_store_rx_packet_data), 
                    .flush(tb_flush), 
                    .clk(tb_clk), 
                    .n_rst(tb_n_rst),
                    .tx_data(tb_tx_data), 
                    .rx_packet_data(tb_rx_packet_data),
                    .buffer_occupancy(tb_buffer_occupancy),
                    .rx_data(tb_rx_data), 
                    .tx_packet_data(tb_tx_packet_data),
                    .hsize(tb_hsize));
    
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
        begin
            @(posedge tb_clk);

            tb_tx_data = data;
            tb_store_tx_data = 1'b1;
            tb_hsize = 2;

            @(posedge tb_clk);
            tb_store_tx_data = 1'b0;
            tb_hsize = 0;

            #(CLK_PERIOD * 8);
            @(posedge tb_clk);
            tb_get_tx_packet_data = 1'b1;
            @(posedge tb_clk);
            tb_get_tx_packet_data = 1'b0;
            @(posedge tb_clk);
        end
    endtask

    task send_multiple_tx_packet;
        input [PACKET_SIZE - 1 : 0] data1;
        input [PACKET_SIZE - 1 : 0] data2;
        begin
            @(posedge tb_clk);

            tb_tx_data = data1;
            tb_store_tx_data = 1'b1;
            tb_hsize = 3'd2;

            @(posedge tb_clk);
            tb_store_tx_data = 1'b0;
            tb_hsize = 3'd0;
            if(data1 == tb_tx_data) begin
                $info("Correct 'tx data' output %s during %s test case", "Send multiple tx1 stage", tb_test_case);
            end
            else begin
                $error("InCorrect 'tx data' output %s during %s test case", "Send multiple tx1 stage", tb_test_case);
            end

            #(CLK_PERIOD * 8);
            //second data push
            @(posedge tb_clk);

            tb_tx_data = data2;
            tb_store_tx_data = 1'b1;
            tb_hsize = 3'd2;

            if(data2 == tb_tx_data) begin
                $info("Correct 'tx data' output %s during %s test case", "Send multiple tx2 stage", tb_test_case);
            end
            else begin
                $error("InCorrect 'tx data' output %s during %s test case", "Send multiple tx2 stage", tb_test_case);
            end
            @(posedge tb_clk);
            tb_store_tx_data = 1'b0;
            tb_hsize = 3'd0;

            #(CLK_PERIOD * 8);

            @(posedge tb_clk);
            tb_get_tx_packet_data = 1'b1;
            @(posedge tb_clk);
            if(data1 == tb_tx_packet_data) begin
                $info("Correct 'tx packet data' output %s during %s test case", "Send multiple tx1 stage", tb_test_case);
            end
            else begin
                $error("InCorrect 'tx packet data' output %s during %s test case", "Send multiple tx1 stage", tb_test_case);
            end
            tb_get_tx_packet_data = 1'b0;
            @(posedge tb_clk);
            #(CLK_PERIOD * 8);
            //second data get
            tb_get_tx_packet_data = 1'b1;
            @(posedge tb_clk);
            @(posedge tb_clk);
            if(data2 == tb_tx_packet_data) begin
                $info("Correct 'tx packet data' output %s during %s test case", "Send multiple tx2 stage", tb_test_case);
            end
            else begin
                $error("InCorrect 'tx packet data' output %s during %s test case", "Send multiple tx2 stage", tb_test_case);
            end
            tb_get_tx_packet_data = 1'b0;
            @(posedge tb_clk);
        end

    endtask

    task send_rx_packet;
        input [PACKET_SIZE - 1 : 0] data;
        begin
            @(posedge tb_clk);

            tb_rx_packet_data = data;
            tb_store_rx_packet_data = 1'b1;
            tb_hsize = 2;

            @(posedge tb_clk);
            tb_store_rx_packet_data = 1'b0;
            tb_hsize = 0;

            #(CLK_PERIOD * 8);
            @(posedge tb_clk);
            tb_get_rx_data = 1'b1;
            @(posedge tb_clk);
            tb_get_rx_data = 1'b0;
            @(posedge tb_clk);
        end
    endtask
    
    task send_all;
        input testvector tv;
        integer s;
        begin
            reset_dut();
            for (s = 0; s < 3; s++) begin
                tb_test_case_num += 1;
                expected_tb_rx_data = tv.result[s];
                expected_tb_buffer_occupancy = 0;
                expected_tb_tx_packet_data = 0;
                send_rx_packet(tv.data[s]);
                check_outputs("send rx data");
            end
            for (s = 3; s < 5; s++) begin
                tb_test_case_num += 1;
                expected_tb_tx_packet_data = tv.result[s];
                expected_tb_rx_data = tv.result[2];
                expected_tb_buffer_occupancy = 0;
                send_tx_packet(tv.data[s]);
                check_outputs("send tx data");
            end
            for (s = 5; s < 6; s++) begin
                tb_test_case_num += 1;
                expected_tb_rx_data = tv.result[s];
                expected_tb_tx_packet_data = tv.result[4];
                expected_tb_buffer_occupancy = 0;
                send_rx_packet(tv.data[s]);
                check_outputs("send rx data");
            end
        end
    endtask //automatic

    task check_outputs;
        input string check_tag;
        begin
            tb_mismatch = 1'b0;
            tb_check    = 1'b1;
            if(expected_tb_buffer_occupancy == tb_buffer_occupancy) begin
                $info("Correct 'buffer occupancy' output %s during %s test case", check_tag, tb_test_case);
            end
            else begin
                tb_mismatch = 1'b1;
                $error("Incorrect 'buffer occupancy' output %s during %s test case", check_tag, tb_test_case);
            end

            if(expected_tb_rx_data == tb_rx_data) begin
                $info("Correct 'rx data' output %s during %s test case", check_tag, tb_test_case);
            end
            else begin
                tb_mismatch = 1'b1;
                $error("Incorrect 'rx data' output %s during %s test case", check_tag, tb_test_case);
            end

            if(expected_tb_tx_packet_data == tb_tx_packet_data) begin
                $info("Correct 'tx packet data' output %s during %s test case", check_tag, tb_test_case);
            end
            else begin
                tb_mismatch = 1'b1;
                $error("Incorrect 'tx packet data' output %s during %s test case", check_tag, tb_test_case);
            end
        end
    endtask

    initial begin
        tb_test_vector = new[2];
        //case 0
        tb_test_vector[0].data = {{8'b10110101, 8'b11110000, 16'b0}, {8'b11111111, 8'b11110000, 16'b0}, {8'b00000001, 8'b11110000, 16'b0}, {8'b00000101, 24'b0}, {8'b00011001, 8'b11110000, 16'b0}, {8'b10010001, 24'b0}};
        tb_test_vector[0].result = {{8'b10110101, 24'b0}, {8'b11111111, 24'b0}, {8'b00000001, 24'b0}, {8'b00000101, 24'b0}, {8'b00011001, 24'b0}, {8'b10010001, 24'b0}};

        //case 1
        tb_test_vector[1].data = {{8'b10110101, 24'b0}, {8'b11111111, 24'b0}, {8'b00000001, 24'b0}, {8'b00000101, 24'b0}, {8'b00011001, 24'b0}, {8'b10010001, 24'b0}};
        tb_test_vector[1].result = {{8'b10110101, 24'b0}, {8'b11111111, 24'b0}, {8'b00000001, 24'b0}, {8'b00000101, 24'b0}, {8'b00011001, 24'b0}, {8'b10010001, 24'b0}};
    end

    initial begin
        tb_test_case_num = 0;
        tb_get_rx_data = 0;
        tb_clear = 0;
        tb_rx_packet_data = 0;
        tb_store_rx_packet_data = 0;
        tb_flush = 0;
        tb_test_data = 0;
        tb_n_rst = 1;
        tb_tx_data = 0;
        tb_get_tx_packet_data = 0;
        expected_tb_rx_data = 0;
        expected_tb_buffer_occupancy = 0;
        expected_tb_tx_packet_data = 0;
        tb_store_tx_data = 0;
        tb_mismatch        = 1'b0;
        tb_check = 1'b0;
        tb_hsize = 0;
        

        // #(1ns);

        // case 1
        tb_test_case = "send multiple data";
        tb_test_case_num = tb_test_case_num + 1;
        tb_test_data = {16'b0, 8'b10110101, 8'b11110000};
        tb_test_data1 = {16'b0, 8'b11111111, 8'b11110000};
        reset_dut();
        send_multiple_tx_packet(tb_test_data, tb_test_data1);

        // check_outputs("Send 1 packet tx data");
        // send_all(tb_test_vector[0]);

        tb_clear = 1'b1;
        #(CLK_PERIOD);
        $stop;

    end


endmodule