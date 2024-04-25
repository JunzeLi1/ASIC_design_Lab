// $Id: $
// File name:   tb_top.sv
// Created:     10/1/2018
// Author:      Tim Pritchett
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: Starter bus model based test bench for the AHB-Lite-slave module

/**
To Do: Complete the task for clearning the signals, then setup the testcases
**/

`timescale 1ns / 10ps

module tb_top();

// Timing related constants
localparam CLK_PERIOD = 10;
localparam BUS_DELAY  = 800ps; // Based on FF propagation delay

// Sizing related constants
localparam DATA_WIDTH      = 4; //this is in bytes
localparam ADDR_WIDTH      = 4;
localparam DATA_WIDTH_BITS = DATA_WIDTH * 8;
localparam DATA_MAX_BIT    = DATA_WIDTH_BITS - 1;
localparam ADDR_MAX_BIT    = ADDR_WIDTH - 1;

// Define our address mapping scheme via constants
localparam ADDR_DATA_BUFFER = 4'd0;
localparam ADDR_STATUS      = 4'd4;
// localparam ADDR_STATUS      = 4'd5;
localparam ADDR_ERROR       = 4'd6;
localparam ADDR_BUFFER_OCC  = 4'd8;
localparam ADDR_TX_CONTROL  = 4'd12;
localparam ADDR_FLUSH_CONTROL  = 4'd13;

//add signals here later

// AHB-Lite-Slave reset value constants
// Student TODO: Update these based on the reset values for your config registers


//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
// Testing setup signals
logic                      tb_enqueue_transaction;
logic                      tb_transaction_write;
logic                      tb_transaction_fake;
logic [ADDR_MAX_BIT:0]     tb_transaction_addr;
logic [DATA_MAX_BIT:0]     tb_transaction_data;
logic                      tb_transaction_error;
logic [2:0]                tb_transaction_size;
// Testing control signal(s)
logic    tb_enable_transactions;
integer  tb_current_transaction_num;
logic    tb_current_transaction_error;
logic    tb_model_reset;
string   tb_test_case;
integer  tb_test_case_num;
logic [DATA_MAX_BIT:0] tb_test_data;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// AHB-Lite-Slave side signals
//*****************************************************************************
logic                  tb_hsel;
logic [1:0]            tb_htrans;
logic [ADDR_MAX_BIT:0] tb_haddr;
logic [1:0]            tb_hsize;
logic                  tb_hwrite;
logic [DATA_MAX_BIT:0] tb_hwdata;
logic [DATA_MAX_BIT:0] tb_hrdata;
logic                  tb_hresp;

//*****************************************************************************
// RX in
//*****************************************************************************
logic       tb_dplus_i;
logic       tb_dminus_i;

logic [7:0] tb_test_byte;

//*****************************************************************************
// TX out
//*****************************************************************************
logic       tb_dplus_o;
logic       tb_dminus_o;

logic       tb_tx_packet;
//*****************************************************************************
// Expected Signals
//*****************************************************************************
//outs from top
logic       tb_expected_dplus_o;
logic       tb_expected_dminus_o;

logic       tb_expected_hrdata;

//*****************************************************************************
// Clock Generation Block
//*****************************************************************************
// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

//*****************************************************************************
// Bus Model Instance
//*****************************************************************************
ahb_lite_bus #(.DATA_WIDTH(4), .ADDR_WIDTH(4)) BFM (.clk(tb_clk),
                  // Testing setup signals
                  .enqueue_transaction(tb_enqueue_transaction),
                  .transaction_write(tb_transaction_write),
                  .transaction_fake(tb_transaction_fake),
                  .transaction_addr(tb_transaction_addr),
                  .transaction_data(tb_transaction_data),
                  .transaction_error(tb_transaction_error),
                  .transaction_size(tb_transaction_size),
                  // Testing controls
                  .model_reset(tb_model_reset),
                  .enable_transactions(tb_enable_transactions),
                  .current_transaction_num(tb_current_transaction_num),
                  .current_transaction_error(tb_current_transaction_error),
                  // AHB-Lite-Slave Side
                  .hsel(tb_hsel),
                  .htrans(tb_htrans),
                  .haddr(tb_haddr),
                  .hsize(tb_hsize),
                  .hwrite(tb_hwrite),
                  .hwdata(tb_hwdata),
                  .hrdata(tb_hrdata),
                  .hresp(tb_hresp)
                  );

//*****************************************************************************
// DUT Instance
//*****************************************************************************
top DUT (.clk(tb_clk), .n_rst(tb_n_rst),
                    // TX Signals
                    .dplus_o(tb_dplus_o),
                    .dminus_o(tb_dminus_o),
                    // RX Signals
                    .dplus_i(tb_dplus_i),
                    .dminus_i(tb_dminus_i),
                    // AHB-Lite-Slave bus signals
                    .hsel(tb_hsel),
                    .htrans(tb_htrans),
                    .haddr(tb_haddr),
                    .hsize(tb_hsize),
                    .hwrite(tb_hwrite),
                    .hwdata(tb_hwdata),
                    .hrdata(tb_hrdata),
                    .hresp(tb_hresp), 
                    .d_mode(tb_d_mode)
                );

//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
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
task check_outputs;
  input string check_tag;
begin
  tb_mismatch = 1'b0;
  tb_check    = 1'b1;

  if(tb_expected_hrdata == tb_hrdata) begin // Check passed
    $info("Correct 'hrdata' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'hrdata' output %s during %s test case", check_tag, tb_test_case);
  end

  // if(tb_expected_dplus_o == tb_dplus_o) begin // Check passed
  //   $info("Correct 'dplus_o' output %s during %s test case", check_tag, tb_test_case);
  // end
  // else begin // Check failed
  //   tb_mismatch = 1'b1;
  //   $error("Incorrect 'dplus_o' output %s during %s test case", check_tag, tb_test_case);
  // end

  // if(tb_expected_dminus_o == tb_dminus_o) begin // Check passed
  //   $info("Correct 'dminus' output %s during %s test case", check_tag, tb_test_case);
  // end
  // else begin // Check failed
  //   tb_mismatch = 1'b1;
  //   $error("Incorrect 'dminus' output %s during %s test case", check_tag, tb_test_case);
  // end

  // Wait some small amount of time so check pulse timing is visible on waves
  #(0.1);
  tb_check =1'b0;
end
endtask

//*****************************************************************************
// Bus Model Usage Related TB Tasks
//*****************************************************************************
// Task to pulse the reset for the bus model
task reset_model;
begin
  tb_model_reset = 1'b1;
  #(0.1);
  tb_model_reset = 1'b0;
end
endtask

// Task to enqueue a new transaction
task enqueue_transaction;
  input logic for_dut;
  input logic write_mode;
  input logic [ADDR_MAX_BIT:0] address;
  input logic [DATA_MAX_BIT:0] data;
  input logic expected_error;
  input logic [1:0] size;
begin
  // Make sure enqueue flag is low (will need a 0->1 pulse later)
  tb_enqueue_transaction = 1'b0;
  #0.1ns;

  // Setup info about transaction
  tb_transaction_fake  = ~for_dut;
  tb_transaction_write = write_mode;
  tb_transaction_addr  = address;
  tb_transaction_data  = data;
  tb_transaction_error = expected_error;
  tb_transaction_size  = {size};

  // Pulse the enqueue flag
  tb_enqueue_transaction = 1'b1;
  #0.1ns;
  tb_enqueue_transaction = 1'b0;
end
endtask

// Task to wait for multiple transactions to happen
task execute_transactions;
  input integer num_transactions;
  integer wait_var;
begin
  // Activate the bus model
  tb_enable_transactions = 1'b1;
  @(posedge tb_clk);

  // Process the transactions (all but last one overlap 1 out of 2 cycles
  for(wait_var = 0; wait_var < num_transactions; wait_var++) begin
    @(posedge tb_clk);
  end

  // Run out the last one (currently in data phase)
  @(posedge tb_clk);

  // Turn off the bus model
  @(negedge tb_clk);
  tb_enable_transactions = 1'b0;
end
endtask

// Task to clear/initialize all TX/RX/Buffer side signals

task send_byte;
  input logic [7:0] data_byte;
  begin
    integer i;
    for(i = 7; i >= 0; i--) begin
        send_bit(data_byte[i]);
    end
  end
  endtask

  task send_bit_expected_Dplus;
  input logic data_bit;
  begin
    #(CLK_PERIOD * 0.1);
    tb_expected_dplus_o = data_bit;
    tb_expected_dplus_o = ~data_bit;
    #(CLK_PERIOD * 7.9);
  end
  endtask

  task send_byte_expected_Dplus_1;
  input logic [25:0] data_byte;
  begin
    integer i;
    for(i = 0; i <= 25; i++) begin
        send_bit_expected_Dplus(data_byte[i]);
    end
  end
  endtask

  task send_byte_expected_Dplus_2;
  input logic [33:0] data_byte;
  begin
    integer i;
    for(i = 0; i <= 33; i++) begin
        send_bit_expected_Dplus(data_byte[i]);
    end
  end
  endtask

  task send_byte_expected_Dplus_3;
  input logic [49:0] data_byte;
  begin
    integer i;
    for(i = 0; i <= 49; i++) begin
        send_bit_expected_Dplus(data_byte[i]);
    end
  end
  endtask

  task send_bit;
  input logic data_bit;
  begin
    #(CLK_PERIOD * 0.1);
    tb_dplus_i = data_bit;
    tb_dminus_i = ~data_bit;
    #(CLK_PERIOD * 7.9);
  end
  endtask

  task send_eop;
  begin
    #(CLK_PERIOD * 0.1);
    tb_dplus_i = 0;
    tb_dminus_i = 0;
    #(CLK_PERIOD * 16);
    tb_dplus_i = 1;
    #(CLK_PERIOD * 0.9);
  end
  endtask

  task send_sync;
  begin
    send_byte(8'b01010100);
  end
  endtask

  task send_pid;
    input logic [3:0] pid;
  begin
    send_byte({pid, ~pid});
  end
  endtask

task init_expected_outs;
begin
    tb_expected_dplus_o = '1;
    tb_expected_dminus_o = '0;
    tb_expected_hrdata = '0;
end
endtask

integer k;
//*****************************************************************************
//*****************************************************************************
// Main TB Process
//*****************************************************************************
//*****************************************************************************
initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initilization";
  tb_test_case_num   = -1;
  tb_test_data       = '0;
  tb_check_tag       = "N/A";
  tb_check           = 1'b0;
  tb_mismatch        = 1'b0;
  // Initialize all of the directly controled DUT inputs
  tb_n_rst          = 1'b1;

//   tb_dplus_o = '0;
//   tb_dminus_o = '0;
//   tb_hrdata = '0;
//   tb_hresp = '0;
  tb_tx_packet = '0;
  // Initialize all of the bus model control inputs
  tb_model_reset          = 1'b0;
  tb_enable_transactions  = 1'b0;
  tb_enqueue_transaction  = 1'b0;
  tb_transaction_write    = 1'b0;
  tb_transaction_fake     = 1'b0;
  tb_transaction_addr     = '0;
  tb_transaction_data     = '0;
  tb_transaction_error    = 1'b0;
  tb_transaction_size     = 3'd0;

  // tb_d_mode= '0;
  tb_test_byte = '0;

  // Wait some time before starting first test case
  #(0.1);

  // Clear the bus model
  reset_model();

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  tb_dplus_i = 1'b1;
  tb_dminus_i = 1'b0;
  
  // Setup provided signals with 'active' values for reset check (WHAT SHOULD I DO HERE)


  // Reset the DUT
  reset_dut();

  // Check outputs for reset state
  init_expected_outs();
  #(CLK_PERIOD);
  check_outputs("after DUT reset");
  // Give some visual spacing between check and next test case start
  #(CLK_PERIOD * 3);

  //*****************************************************************************
  // Test Case 1: HWDATA (CPU) -> USB Via TX
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "HWDATA (CPU) -> USB";
  tb_test_case_num = tb_test_case_num + 1;
  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = {8'b0, 8'b10110101, 8'b0, 8'b11110000}; //test data
  
  enqueue_transaction(1'b1, 1'b1, ADDR_DATA_BUFFER, tb_test_data, 1'b0, 2'd3); //hresp write to Status Reg
  execute_transactions(1);
  #(CLK_PERIOD * 3);
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  execute_transactions(100);
  #(CLK_PERIOD * 200);
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg

  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd, 1'b0, 2'd3); //txpacket
  
  // Run the transactions via the model

  //check the serial output here

  #(CLK_PERIOD * 300);
  
    //*****************************************************************************
  // Test Case 1: HWDATA (CPU) -> USB Via TX
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "HWDATA (CPU) -> USB";
  tb_test_case_num = tb_test_case_num + 1;
  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = {8'b0, 8'b10110101, 8'b0, 8'b11110000}; //test data
  
  enqueue_transaction(1'b1, 1'b1, ADDR_DATA_BUFFER, tb_test_data, 1'b0, 2'd2); //hresp write to Status Reg
  execute_transactions(1);
  #(CLK_PERIOD * 3);
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd2); //hresp write to Status Reg
  execute_transactions(100);
  #(CLK_PERIOD * 200);
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg

  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd, 1'b0, 2'd3); //txpacket
  
  // Run the transactions via the model

  //check the serial output here

  #(CLK_PERIOD * 300);
  
      //*****************************************************************************
  // Test Case 1: HWDATA (CPU) -> USB Via TX
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "HWDATA (CPU) -> USB";
  tb_test_case_num = tb_test_case_num + 1;
  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = {8'b0, 8'b10110101, 8'b0, 8'b11110000}; //test data
  
  enqueue_transaction(1'b1, 1'b1, ADDR_DATA_BUFFER, tb_test_data, 1'b0, 2'd1); //hresp write to Status Reg
  execute_transactions(1);
  #(CLK_PERIOD * 3);
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd1); //hresp write to Status Reg
  execute_transactions(100);
  #(CLK_PERIOD * 200);
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg
  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd1, 1'b0, 2'd3); //hresp write to Status Reg

  // enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd, 1'b0, 2'd3); //txpacket
  
  // Run the transactions via the model

  //check the serial output here

  #(CLK_PERIOD * 300);   
  
  
  
  //*****************************************************************************
  // Test Case 1.5: HWDATA (CPU) -> USB Via TX
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Fluash Data buffer";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = {32'b0}; //test data
  enqueue_transaction(1'b1, 1'b1, ADDR_FLUSH_CONTROL, 'd1, 1'b0, 2'd3);  //write flush command
  execute_transactions(1);
  #(CLK_PERIOD * 500); 

  //*****************************************************************************
  // Test Case 1.2: HWDATA (CPU) -> USB Via TX
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "ACK pid";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = {32'b0}; //test data
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd2, 1'b0, 2'd3); //write pid
  execute_transactions(1);
  #(CLK_PERIOD * 500);    

  //*****************************************************************************
  // Test Case 1.3: HWDATA (CPU) -> USB Via TX
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "NAK pid";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = {32'b0}; //test data
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd3, 1'b0, 2'd3); //write pid
  execute_transactions(1);
  #(CLK_PERIOD * 500); 
  
  //*****************************************************************************
  // Test Case 1.4: HWDATA (CPU) -> USB Via TX
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "STALL pid";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = {32'b0}; //test data
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, 8'd4, 1'b0, 2'd3);  //write pid
  execute_transactions(1);
  #(CLK_PERIOD * 500); 


  // //*****************************************************************************
  // // Test Case 2: USB -> Host(CPU) Via RX
  // //*****************************************************************************
  // // Update Navigation Info
  // tb_test_case     = "USB -> Host(CPU)";
  // tb_test_case_num = tb_test_case_num + 1;
  // init_expected_outs();
  
  // // Reset the DUT to isolate from prior test case
  // reset_dut();
  
  // tb_test_data = 32'hffefabaa;

  // //stream the input to rx here******
  // tb_test_byte = 8'b00110011;
  // send_sync();
  // send_pid(4'b0010);
  // send_byte(tb_test_byte);
  // tb_test_byte = 8'b11001100;
  // send_byte(tb_test_byte);
  // tb_test_byte = 8'b00001111;
  // send_byte(tb_test_byte);
  // tb_test_byte = 8'b11111111;
  // send_byte(tb_test_byte);
  // send_eop();

  // //enqueue a read operation to check
  // //init test data to be == to input stream
  // enqueue_transaction(1'b1, 1'b0, ADDR_DATA_BUFFER, tb_test_data, 1'b0, 2'd3); 
  // // Run the transactions via the model
  // execute_transactions(1);

  // #(CLK_PERIOD * 3);

  // //*****************************************************************************
  // // Test Case 3: Access Unused/Unallocated addresses 
  // //*****************************************************************************
  // // Update Navigation Info
  // tb_test_case     = "USB -> Host(CPU) (Invalid PID)";
  // tb_test_case_num = tb_test_case_num + 1;
  // init_expected_outs();
  
  // // Reset the DUT to isolate from prior test case
  // reset_dut();
  
  // tb_test_data = 32'h00000000;

  // //stream the input to rx here******
  // tb_test_byte = 8'b00110011;
  // send_sync();
  // send_pid(4'b0000);
  // send_eop();

  // //enqueue a read operation to check
  // //init test data to be == to input stream
  // enqueue_transaction(1'b1, 1'b0, ADDR_ERROR, 1'b1, 1'b0, 2'd3); 
  // // Run the transactions via the model
  // execute_transactions(1);

  // #(CLK_PERIOD * 3);

  // //*****************************************************************************
  // // Test Case 4: Wrong sync byte 
  // //*****************************************************************************
  // // Update Navigation Info
  // tb_test_case     = "USB -> Host(CPU) (Invalid Sync Byte)";
  // tb_test_case_num = tb_test_case_num + 1;
  // init_expected_outs();
  
  // // Reset the DUT to isolate from prior test case
  // reset_dut();
  
  // tb_test_data = 32'hffefabaa;

  // //stream the input to rx here******
  // tb_test_byte = 8'b00110011;
  // send_byte(tb_test_byte);
  // send_eop();

  // //enqueue a read operation to check
  // //init test data to be == to input stream
  // enqueue_transaction(1'b1, 1'b0, ADDR_ERROR, 1'b1, 1'b0, 2'd3); 
  // // Run the transactions via the model
  // execute_transactions(1);

  // #(CLK_PERIOD * 3);

  // //*****************************************************************************
  // // Test Case 5: Sending OUT Token 
  // //*****************************************************************************
  // // Update Navigation Info
  // tb_test_case     = "USB -> Host(CPU) (OUT Token)";
  // tb_test_case_num = tb_test_case_num + 1;
  // init_expected_outs();
  
  // // Reset the DUT to isolate from prior test case
  // reset_dut();

  // tb_test_byte = 8'b10101010;
  // send_sync();
  // send_pid(4'b0101);
  // send_byte(tb_test_byte);
  // send_byte(tb_test_byte);
  

  // //enqueue a read operation to check
  // //init test data to be == to input stream
  // enqueue_transaction(1'b1, 1'b0, ADDR_STATUS, 12'h104, 1'b0, 2'd3); 
  // // Run the transactions via the model
  // execute_transactions(1);

  // send_eop();

  // #(CLK_PERIOD * 3);

  // //*****************************************************************************
  // // Test Case 6: Sending IN Token 
  // //*****************************************************************************
  // // Update Navigation Info
  // tb_test_case     = "USB -> Host(CPU) (IN Token)";
  // tb_test_case_num = tb_test_case_num + 1;
  // init_expected_outs();
  
  // // Reset the DUT to isolate from prior test case
  // reset_dut();

  // tb_test_byte = 8'b10101010;
  // send_sync();
  // send_pid(4'b0100);
  // send_byte(tb_test_byte);
  // send_byte(tb_test_byte);
  

  // //enqueue a read operation to check
  // //init test data to be == to input stream
  // enqueue_transaction(1'b1, 1'b0, ADDR_STATUS, 12'h102, 1'b0, 2'd3); 
  // // Run the transactions via the model
  // execute_transactions(1);

  // send_eop();

  // #(CLK_PERIOD * 3);

  // //*****************************************************************************
  // // Test Case 7: Sending ACK Token 
  // //*****************************************************************************
  // // Update Navigation Info
  // tb_test_case     = "USB -> Host(CPU) (ACK Token)";
  // tb_test_case_num = tb_test_case_num + 1;
  // init_expected_outs();
  
  // // Reset the DUT to isolate from prior test case
  // reset_dut();

  // tb_test_byte = 8'b10101010;
  // send_sync();
  // send_pid(4'b1101);
  // send_byte(tb_test_byte);
  // send_byte(tb_test_byte);
  

  // //enqueue a read operation to check
  // //init test data to be == to input stream
  // enqueue_transaction(1'b1, 1'b0, ADDR_STATUS, 12'h108, 1'b0, 2'd3); 
  // // Run the transactions via the model
  // execute_transactions(1);

  // send_eop();

  // #(CLK_PERIOD * 3);

  // //*****************************************************************************
  // // Test Case 8: Sending NACK Token 
  // //*****************************************************************************
  // // Update Navigation Info
  // tb_test_case     = "USB -> Host(CPU) (NACK Token)";
  // tb_test_case_num = tb_test_case_num + 1;
  // init_expected_outs();
  
  // // Reset the DUT to isolate from prior test case
  // reset_dut();

  // tb_test_byte = 8'b10101010;
  // send_sync();
  // send_pid(4'b1100);
  // send_byte(tb_test_byte);
  // send_byte(tb_test_byte);
  

  // //enqueue a read operation to check
  // //init test data to be == to input stream
  // enqueue_transaction(1'b1, 1'b0, ADDR_STATUS, 12'h110, 1'b0, 2'd3); 
  // // Run the transactions via the model
  // execute_transactions(1);

  // send_eop();

  // #(CLK_PERIOD * 3);

$stop;

end

endmodule
