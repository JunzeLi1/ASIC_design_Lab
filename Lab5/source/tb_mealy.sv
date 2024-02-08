// $Id: $
// File name:   tb_mealy.sv
// Created:     2/5/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module tb_mealy();
    //local parameter delcaration
    localparam CLK_PERIOD = 2.5;
    localparam PROPAGATION_DELAY = 0.8;
    localparam RESET_OUTPUT_VALUE = 1'b0;
    localparam DETECTED_OUTPUT = 1'b1;
    
    //Test case signals
    integer tb_bit_num;
    integer tb_test_num;
    string tb_test_case;

    //Test signals for test bench
    logic data_to_sent [];
    logic tb_expected_output;

    //DUT connection signals
    logic tb_clk;
    logic tb_n_rst;
    logic tb_i;
    logic tb_o;

    task reset_dut;
        begin
        // Activate the reset
        tb_n_rst = 1'b0;

        // Maintain the reset for more than one cycle
        @(posedge tb_clk);
        @(posedge tb_clk);

        // Wait until safely away from rising edge of the clock before releasing
        @(negedge tb_clk);
        tb_n_rst = 1'b1;

        // Leave out of reset for a couple cycles before allowing other stimulus
        // Wait for negative clock edges, 
        // since inputs to DUT should normally be applied away from rising clock edges
        @(negedge tb_clk);
        @(negedge tb_clk);
    end
    endtask

    task send_bit;
        input logic bit_to_send;
    begin
        @(negedge tb_clk);
        tb_i = bit_to_send;

        #(PROPAGATION_DELAY);
    end
    endtask

    task send_stream;
        input logic bit_stream [];
    begin
        for(tb_bit_num = 0; tb_bit_num < bit_stream.size(); tb_bit_num++) begin
            send_bit(bit_stream[tb_bit_num]);
        end
    end
    endtask

    task check_output;
        input string check_tag;
    begin
        if(tb_expected_output == tb_o) begin
            $info("Correct state output %s during %s test case", check_tag, tb_test_case);
        end
        else begin
            $info("Error state output %s during %s test case", check_tag, tb_test_case);
        end
    end
    endtask

    //clock!!!!!!!!!!
    always begin
        // Start with clock low to avoid false rising edge events at t=0
        tb_clk = 1'b0;
        // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
        #(CLK_PERIOD/2.0);
        tb_clk = 1'b1;
        // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
        #(CLK_PERIOD/2.0);
    end

    //connect
    mealy DUT (.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o));

    initial begin
        tb_bit_num = -1;
        tb_n_rst = 1;
        tb_i = 0;
        tb_o = 0;
        tb_test_case = "Test bench initialization";
        tb_test_num = 0;

        #(0.1)

        // case1 reset dut
        tb_test_case = "reset dut";
        tb_test_num += 1;

        #(0.1)
        tb_i = 1'b1;
        tb_n_rst = 1'b0;
        #(CLK_PERIOD * 0.5);
        tb_expected_output = RESET_OUTPUT_VALUE;
        check_output("After reset applied");

        #(CLK_PERIOD);
        check_output("after clock cycle while in reset");

        @(negedge tb_clk);
        tb_n_rst = 1'b1;
        #(PROPAGATION_DELAY);
        check_output("after reset was released");

        // case 2
        @(negedge tb_clk);
        tb_test_case = "1101 test";
        tb_test_num += 1;
        tb_expected_output = DETECTED_OUTPUT;
        reset_dut();
        data_to_sent = {1,1,0,1};
        send_stream(data_to_sent);
        check_output("After the 1101 is sent");

        // case 3
        @(negedge tb_clk);
        tb_test_case = "1101101 test";
        tb_test_num += 1;
        tb_expected_output = DETECTED_OUTPUT;
        reset_dut();
        data_to_sent = {1,1,0,1,1,0,1};
        send_stream(data_to_sent);
        check_output("After the 1101101 is sent");

        // case 4
        @(negedge tb_clk);
        tb_test_case = "11101 test";
        tb_test_num += 1;
        tb_expected_output = DETECTED_OUTPUT;
        reset_dut();
        data_to_sent = {1,1,1,0,1};
        send_stream(data_to_sent);
        check_output("After the 11101 is sent");

        // case 5
        @(negedge tb_clk);
        tb_test_case = "11001 test";
        tb_test_num += 1;
        tb_expected_output = RESET_OUTPUT_VALUE;
        reset_dut();
        data_to_sent = {1,1,0,0,1};
        send_stream(data_to_sent);
        check_output("After the 11101 is sent");

        // case 6
        @(negedge tb_clk);
        tb_test_case = "11011 test";
        tb_test_num += 1;
        tb_expected_output = RESET_OUTPUT_VALUE;
        reset_dut();
        data_to_sent = {1,1,0,1,1};
        send_stream(data_to_sent);
        check_output("After the 11101 is sent");

        // case 7
        @(negedge tb_clk);
        tb_test_case = "10101101 test";
        tb_test_num += 1;
        tb_expected_output = DETECTED_OUTPUT;
        reset_dut();
        data_to_sent = {1,0,1,0,1,1,0,1};
        send_stream(data_to_sent);
        check_output("After the 10101101 is sent");

        // case 8
        @(negedge tb_clk);
        tb_test_case = "1001 then reset test";
        tb_test_num += 1;
        reset_dut();
        data_to_sent = {1,0,0,1};
        send_stream(data_to_sent);
        tb_n_rst = 1'b0;
        #(CLK_PERIOD * 0.5);
        tb_expected_output = RESET_OUTPUT_VALUE;
        check_output("After reset applied");
        check_output("After the 10101101 is sent");

        // case 9
        @(negedge tb_clk);
        tb_test_case = "1101 then reset test";
        tb_test_num += 1;
        tb_expected_output = DETECTED_OUTPUT;
        reset_dut();
        data_to_sent = {1,1,0,1};
        send_stream(data_to_sent);
        check_output("After the 1101 is sent");
        tb_n_rst = 1'b0;
        #(CLK_PERIOD * 0.5);
        tb_expected_output = RESET_OUTPUT_VALUE;
        check_output("After reset applied");

        // case 7
        @(negedge tb_clk);
        tb_test_case = "1001 test";
        tb_test_num += 1;
        tb_expected_output = RESET_OUTPUT_VALUE;
        reset_dut();
        data_to_sent = {1,0,0,1};
        send_stream(data_to_sent);
        check_output("After the 1001 is sent");

        @(negedge tb_clk);
        tb_test_case = "10101101 test";
        tb_test_num += 1;
        tb_expected_output = DETECTED_OUTPUT;
        reset_dut();
        data_to_sent = {1,0,1,1,0,1};
        send_stream(data_to_sent);
        check_output("After the 1001 is sent");

        @(negedge tb_clk);
        tb_test_case = "10101101 test";
        tb_test_num += 1;
        tb_expected_output = RESET_OUTPUT_VALUE;
        reset_dut();
        data_to_sent = {1,1,0,0,1,0,1,0,0};
        send_stream(data_to_sent);
        check_output("After the last is sent");

        @(negedge tb_clk);
        tb_test_case = "10101101 test";
        tb_test_num += 1;
        tb_expected_output = RESET_OUTPUT_VALUE;
        reset_dut();
        data_to_sent = {0,1,1,0,1,1,0,1,1};
        send_stream(data_to_sent);
        check_output("After the last is sent");

        @(negedge tb_clk);
        tb_test_case = "10101101 test";
        tb_test_num += 1;
        tb_expected_output = RESET_OUTPUT_VALUE;
        reset_dut();
        data_to_sent = {1,1,0,1,1,0,0,1,0};
        send_stream(data_to_sent);
        check_output("After the last is sent");

        @(negedge tb_clk);
        tb_test_case = "last";
        tb_test_num += 1;
        tb_expected_output = RESET_OUTPUT_VALUE;
        reset_dut();
        data_to_sent = {1,1,0,1,1,0,1};
        send_stream(data_to_sent);
        check_output("After the last is sent11000011");

    $stop;

    end
            

            
    
    






endmodule
