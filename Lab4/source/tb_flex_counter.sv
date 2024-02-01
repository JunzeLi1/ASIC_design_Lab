// $Id: $
// File name:   tb_flex_counter.sv
// Created:     1/31/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  localparam  NUM_CNT_BITS = 4;
  localparam  CLK_PERIOD    = 2.5;

  
  localparam  INACTIVE_VALUE     = 1'b0;
  localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [NUM_CNT_BITS-1 : 0] tb_rollover_val;
  reg [NUM_CNT_BITS-1 : 0] tb_count_out;
  reg tb_rollover_flag;

  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;

  logic [3:0] temp_count;
  integer i;
  
  // Task for standard DUT reset procedure
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

  // Task to cleanly and consistently check DUT output values
  task check_output;
    input logic [NUM_CNT_BITS-1 : 0] expected_value1;
    input logic  expected_value2;
    input string check_tag;
  begin
    if(expected_value1 == tb_count_out) begin // Check passed
      $info("Correct flexible counter output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect flexible counter output %s during %s test case", check_tag, tb_test_case);
    end

    if(expected_value2 == tb_rollover_flag) begin // Check passed
      $info("Correct rollover flag output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect rollover flag output %s during %s test case", check_tag, tb_test_case);
    end
  end
  endtask

  // Task to cleanly and consistently check for correct values during MetaStability Test Cases
  task normal_clear;
    begin
        tb_clear = 1'b1;
        // Maintain the clear for more than one cycle
        @(posedge tb_clk);
        @(posedge tb_clk);

        // Wait until safely away from rising edge of the clock before releasing
        @(negedge tb_clk);
        tb_clear = 1'b0;

        // Leave out of clear for a couple cycles before allowing other stimulus
        // Wait for negative clock edges, 
        // since inputs to DUT should normally be applied away from rising clock edges
        @(negedge tb_clk);
        @(negedge tb_clk);
    end
endtask

  // Clock generation block
  always
  begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
  
  // DUT Port map
  flex_counter DUT(.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), .rollover_val(tb_rollover_val),.count_out(tb_count_out), .rollover_flag(tb_rollover_flag));
  
  // Test bench main process
  initial
    begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1; 
    tb_clear = INACTIVE_VALUE;             // Initialize to be inactive
    tb_count_enable = INACTIVE_VALUE;
    tb_rollover_val = 4'b0000;
    tb_test_num = 0;               // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);
    
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    check_output( RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,
                  "after reset applied");
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output( RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE, 
                  "after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output( RESET_OUTPUT_VALUE, RESET_OUTPUT_VALUE,
                  "after reset was released");

    // ************************************************************************
    // Test Case 2: Rollover for a rollover that is not a power of two
    // ************************************************************************    
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "rollover value not a power of two";
    tb_rollover_val = 4'b1111;
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    reset_dut();

    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0011;

    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    // Check results
    check_output( 4'b0011, 1'b1, 
                  "after processing delay");
    
    // ************************************************************************    
    // Test Case 3: Continuous counting
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuous counting'";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    tb_rollover_val = 4'b1111;
    reset_dut();
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0000;

    @(posedge tb_clk);
    // @(CLK_PERIOD * 4);
    check_output( 4'b0000, 1'b0, 
                  "after processing delay");
    
    // ************************************************************************    
    // Test Case 4: Discontinuous counting
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous counting'";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    tb_rollover_val = 4'b1111;
    reset_dut();
    @(negedge tb_clk); 
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0100;

    // @(CLK_PERIOD * 3);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    tb_count_enable = 1'b0;
    // @(CLK_PERIOD * 3);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    // Move away from risign edge and allow for propagation delays before checking
    check_output( 4'b0011, 1'b0, 
                  "after processing delay");
    
    // STUDENT: Add your additional test cases here
    // ************************************************************************    
    // Test Case 5: Clearing while counting to check clear vs. count enable priority
    // ************************************************************************
    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clearing while counting to check clear vs. count enable priority";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    tb_rollover_val = 4'b1111;
    reset_dut();
    @(negedge tb_clk); 
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0100;

    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    normal_clear();
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    // Move away from risign edge and allow for propagation delays before checking
    check_output( 4'b0100, 1'b1, 
                  "after processing delay");

    @(negedge tb_clk); 
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clearing at first place";
    tb_clear = INACTIVE_VALUE;
    tb_count_enable = INACTIVE_VALUE;
    tb_rollover_val = 4'b1111;
    reset_dut();
    @(negedge tb_clk); 
    tb_clear = 1'b1;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4'b0100;

    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);

    check_output( 4'b0000, 1'b0, 
                  "after processing delay");

    // Last test case
    $stop;
  end
endmodule
