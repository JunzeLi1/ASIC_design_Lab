// $Id: $
// File name:   tb_ahb_slave.sv
// Created:     10/1/2018
// Author:      Tim Pritchett
// Lab Section: 9999
// Version:     1.0  Initial Design Entry
// Description: Starter bus model based test bench for the AHB-Lite-slave module

/**
To Do: Complete the task for clearning the signals, then setup the testcases
**/

`timescale 1ns / 10ps

module tb_ahb_lite_slave();

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
// RX side signals
//*****************************************************************************
logic [2:0] tb_rx_packet;
logic       tb_rx_data_ready;
logic       tb_rx_transfer_active;
logic       tb_rx_error;

//*****************************************************************************
// TX side signals
//*****************************************************************************
logic       tb_tx_transfer_active;
logic       tb_tx_error;
logic [2:0] tb_tx_packet;

//*****************************************************************************
// Data-Buffer side signals
//*****************************************************************************
logic [31:0]tb_tx_data;
logic [31:0]tb_rx_data;
logic [5:0] tb_buffer_occupancy;
logic       tb_get_rx_data;
logic       tb_store_tx_data;
logic       tb_clear;
logic       tb_d_mode;


//*****************************************************************************
// Expected Signals
//*****************************************************************************
//outs from ahb 
logic       tb_expected_get_rx_data;
logic       tb_expected_store_tx_data;
logic       tb_expected_clear;
logic       tb_expected_tx_packet;

logic [31:0]tb_expected_hrdata;
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
ahb_lite_slave DUT (.clk(tb_clk), .n_rst(tb_n_rst),
                    // TX Signals
                    .tx_transfer_active(tb_tx_transfer_active),
                    .tx_error(tb_tx_error),
                    .tx_packet(tb_tx_packet),
                    // RX Signals
                    .rx_data_ready(tb_rx_data_ready),
                    .rx_transfer_active(tb_rx_transfer_active), 
                    .rx_error(tb_rx_error),
                    .rx_packet(tb_rx_packet),
                    // Data Buffer Signals
                    .buffer_occupancy(tb_buffer_occupancy),
                    .rx_data(tb_rx_data),
                    .get_rx_data(tb_get_rx_data),
                    .store_tx_data(tb_store_tx_data),
                    .tx_data(tb_tx_data),
                    .clear(tb_clear),
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
  if(tb_expected_get_rx_data == tb_get_rx_data) begin // Check passed
    $info("Correct 'get_rx_data' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'get_rx_data' output %s during %s test case", check_tag, tb_test_case);
  end

  if(tb_expected_store_tx_data == tb_store_tx_data) begin // Check passed
    $info("Correct 'store_tx' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'store_tx' output %s during %s test case", check_tag, tb_test_case);
  end

  if(tb_expected_clear == tb_clear) begin // Check passed
    $info("Correct 'clear' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'clear' output %s during %s test case", check_tag, tb_test_case);
  end

  if(tb_expected_tx_packet == tb_tx_packet) begin // Check passed
    $info("Correct 'tx_packet' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'tx_packet' output %s during %s test case", check_tag, tb_test_case);
  end

  if(tb_expected_hrdata == tb_hrdata) begin // Check passed
    $info("Correct 'hrdata' output %s during %s test case", check_tag, tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'hrdata' output %s during %s test case", check_tag, tb_test_case);
  end

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
task init_tx;
begin
    tb_tx_transfer_active = '0;
    tb_tx_error = '0;
    // tb_tx_packet = '0;
end
endtask

task init_rx;
begin
    tb_rx_packet = '0;
    tb_rx_data_ready = '0;
    tb_rx_transfer_active = '0;
    tb_rx_error= '0;
end
endtask

task init_dbuff;
begin
    // tb_tx_data= '0;
    tb_buffer_occupancy= '0;
    tb_rx_data ='0;
    // tb_get_rx_data= '0;
    // tb_store_tx_data= '0;
    // tb_clear= '0;
end
endtask

task init_expected_outs;
begin
    tb_expected_get_rx_data = '0;
    tb_expected_store_tx_data = '0;
    tb_expected_clear = '0;
    tb_expected_tx_packet = '0;
    tb_expected_hrdata = '0;
end
endtask
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
  init_tx();
  init_rx();
  init_dbuff();
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
  // Test Case 1: (RAW Overlapping test case of DBUFF
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Config and Check Data Buffer";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();

  // Reset the DUT to isolate from prior test case
  reset_dut();
  
  //___________Full Size Transfer__________________
  tb_test_data = 32'd5000;
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_DATA_BUFFER, tb_test_data, 1'b0, 2'd3); //4 byte write
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_DATA_BUFFER, tb_test_data, 1'b0, 2'd3); //4 byte read
  // Run the transactions via the model
  execute_transactions(2);

  #(CLK_PERIOD);
  @(negedge tb_clk);
  @(negedge tb_clk);
  //___________2 Byte__________________
  // tb_test_data = {16'b0, 8'd1, 8'd0}; 
  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_DATA_BUFFER, tb_test_data, 1'b0, 2'd2); //2 byte
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_DATA_BUFFER, tb_test_data[15:0], 1'b0, 2'd2); //2
  // Run the transactions via the model
  execute_transactions(2);

  #(CLK_PERIOD);
  @(negedge tb_clk);
  @(negedge tb_clk);
  //___________1 Byte__________________
  // tb_test_data = {16'b0, 8'd0, 8'd1}; 

  // Enqueue the write
  enqueue_transaction(1'b1, 1'b1, ADDR_DATA_BUFFER, tb_test_data[7:0], 1'b0, 2'd1); //1 byte
  // Enqueue the 'check' read
  enqueue_transaction(1'b1, 1'b0, ADDR_DATA_BUFFER, tb_test_data[7:0], 1'b0, 2'd1); //1
  // Run the transactions via the model
  execute_transactions(2);

  #(CLK_PERIOD * 3);

  //*****************************************************************************
  // Test Case 2: Write to Read-Only Reg
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Write to Read Only";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();
  
  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = 32'd100;
  
  enqueue_transaction(1'b1, 1'b1, ADDR_STATUS, tb_test_data, 1'b1, 2'd1); //hresp write to Status Reg
  enqueue_transaction(1'b1, 1'b1, ADDR_ERROR, tb_test_data, 1'b1, 2'd1); //hresp write to Error Reg
  enqueue_transaction(1'b1, 1'b1, ADDR_BUFFER_OCC, tb_test_data, 1'b1, 2'd1); //hresp write to Buff Occ Reg
  // Run the transactions via the model
  execute_transactions(3);

  #(CLK_PERIOD * 3);

// //*****************************************************************************
// // Test Case 3:  Isolated Read/Write 
// //*****************************************************************************
  tb_test_case     = "Isolated Read/Write";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = 32'd1;

  //write to TX Packet Control
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, tb_test_data, 1'b0, 2'd1);
  execute_transactions(1);
  #(CLK_PERIOD);

  //read from TX Packet Control
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, tb_test_data[7:0], 1'b0, 2'd1);
  execute_transactions(1);

  #(CLK_PERIOD * 3);

//*****************************************************************************
// Test Case 4:  Access Unused/Unallocated addresses
//*****************************************************************************
  tb_test_case     = "Access Unallocated Address";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = 32'd200;

  //write to invalid address 9
  enqueue_transaction(1'b1, 1'b1, 4'd9, tb_test_data, 1'b1, 2'd1);
  execute_transactions(1);
  #(CLK_PERIOD);

  //read from invalid address 14
  enqueue_transaction(1'b1, 1'b0, 4'd14, tb_test_data[7:0], 1'b1, 2'd1);
  execute_transactions(1);

  #(CLK_PERIOD * 3);

//*****************************************************************************
// Test Case 5:  From the RX line -> Hrdata line
//*****************************************************************************
  tb_test_case     = "RX_data -> HRDATA";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_rx_data = 32'd500;
  //__________________Fullsize transfer____________________
  //read from buff reg
  enqueue_transaction(1'b1, 1'b0, ADDR_DATA_BUFFER, tb_rx_data, 1'b0, 2'd3);
  execute_transactions(1);

  #(CLK_PERIOD * 3);

  if(tb_expected_hrdata == tb_hrdata) begin // Check passed
    $info("Correct 'hrdata' full size output"); 
    end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'hrdata' full size output");
  end

  //___________________half word transfer_________________________
  enqueue_transaction(1'b1, 1'b0, ADDR_DATA_BUFFER, tb_rx_data[15:0], 1'b0, 2'd2);
  execute_transactions(1);

  #(CLK_PERIOD * 3);

  if(tb_expected_hrdata == tb_hrdata) begin // Check passed
    $info("Correct 'hrdata' two byte size output"); 
    end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'hrdata' two byte size output");
  end

  //___________________single byte_________________________
  enqueue_transaction(1'b1, 1'b0, ADDR_DATA_BUFFER, tb_rx_data[7:0], 1'b0, 2'd1);
  execute_transactions(1);

  #(CLK_PERIOD * 3);

  if(tb_expected_hrdata == tb_hrdata) begin // Check passed
    $info("Correct 'hrdata' single byte output"); 
    end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'hrdata' single byte output");
  end

// //*****************************************************************************
// // Test Case 6: TX Control Reg
// //*****************************************************************************
  tb_test_case     = "TX Control Reg";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = 32'd3;

  //write to TX Packet Control
  enqueue_transaction(1'b1, 1'b1, ADDR_TX_CONTROL, tb_test_data, 1'b0, 2'd2);
  execute_transactions(1);
  #(CLK_PERIOD);

  //read from TX Packet Control
  enqueue_transaction(1'b1, 1'b0, ADDR_TX_CONTROL, 3'b110, 1'b0, 2'd2); //expect the decoded tx control signal bc 
  execute_transactions(1);

  #(CLK_PERIOD * 3);

// //*****************************************************************************
// // Test Case 7: Buffer Occupancy Reg
// //*****************************************************************************
  tb_test_case     = "Buffer Occupancy Reg";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();

  // Reset the DUT to isolate from prior test case
  reset_dut();

  // Enqueue the needed transactions 
  tb_test_data = 32'd1;

  tb_buffer_occupancy= '1;

  //read from Buffer Occupancy Control
  enqueue_transaction(1'b1, 1'b0, ADDR_BUFFER_OCC, tb_buffer_occupancy, 1'b0, 2'd3);
  execute_transactions(1);

  #(CLK_PERIOD * 3);

// //*****************************************************************************
// // Test Case 8: Flush Reg
// //*****************************************************************************
  tb_test_case     = "Flush Reg";
  tb_test_case_num = tb_test_case_num + 1;
  init_tx();
  init_rx();
  init_dbuff();
  init_expected_outs();

  // Reset the DUT to isolate from prior test case
  reset_dut();

  //enqueue needed data
  tb_test_data = 32'd1;

  //write to TX Packet Control
  enqueue_transaction(1'b1, 1'b1, ADDR_FLUSH_CONTROL, tb_test_data, 1'b0, 2'd1);
  execute_transactions(1);
  #(CLK_PERIOD);

  //read from TX Packet Control
  enqueue_transaction(1'b1, 1'b0, ADDR_FLUSH_CONTROL, tb_test_data, 1'b0, 2'd1);
  execute_transactions(1);

$stop;

end

endmodule
