`timescale 1ns / 10ps

module tb_usb_receiver ();
    
  //Declare params and tb signals
  localparam CLK_PERIOD = 1;

  logic tb_clk;
  logic tb_n_rst;
  logic tb_dp_i;
  logic tb_dm_i;
  logic [1:0] tb_hsize;
  logic [7:0] tb_buffer_occupancy;
  logic tb_w_enable;
  logic tb_rcving;
  logic tb_r_error;
  logic tb_flush;
  logic tb_data_ready;
  logic [31:0] tb_rcv_data;
  logic [7:0] tb_test_byte;
  logic [2:0] tb_PID;

  integer tb_test_num;
  string tb_test_description;

  // DUT Portmap
  usb_receiver DUT (
    .clk(tb_clk),
    .n_rst(tb_n_rst),
    .dp_i(tb_dp_i),
    .dm_i(tb_dm_i),
    .hsize(tb_hsize),
    .buffer_occupancy(tb_buffer_occupancy),
    .w_enable(tb_w_enable),
    .rcving(tb_rcving),
    .r_error(tb_r_error),
    .flush(tb_flush),
    .data_ready(tb_data_ready),
    .pid(tb_PID),
    .rcv_data(tb_rcv_data)
  );

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

  task check_pid;
  input logic [2:0] expected_pid;
  begin
    // pid check
    assert(expected_pid == tb_PID)
      $info("Test case %0d: PID correct", tb_test_num);
    else
      $error("Test case %0d: PID not correct", tb_test_num);

  end
  endtask

  task check_rcv_data;
  input logic [31:0] expected_rcv_data;
  begin
    // rcv_data check
    assert(expected_rcv_data == tb_rcv_data)
      $info("Test case %0d: rcv_data correct", tb_test_num);
    else
      $error("Test case %0d: rcv_data not correct", tb_test_num);

  end
  endtask

    task check_rcu_outputs;
    input logic expected_w_enable;
    input logic expected_rcving;
    input logic expected_r_error;
    input logic expected_flush;
    input logic expected_data_ready;
  begin    
    // w_enable check
    assert(expected_w_enable == tb_w_enable)
      $info("Test case %0d: w_enable correct", tb_test_num);
    else
      $error("Test case %0d: w_enable was not correct", tb_test_num);
      
    // rcving check
    assert(expected_rcving == tb_rcving)
      $info("Test case %0d: rcving correct", tb_test_num);
    else
      $error("Test case %0d: rcving not correct", tb_test_num);
    
    // r_error check
    assert(expected_r_error == tb_r_error)
      $info("Test case %0d: r_error correct", tb_test_num);
    else
      $error("Test case %0d: r_error not correct", tb_test_num);
      
    // flush check
    assert(expected_flush == tb_flush)
      $info("Test case %0d: flush correct", tb_test_num);
    else
      $error("Test case %0d: flush not correct", tb_test_num);

    // data ready check
    assert(expected_data_ready == tb_data_ready)
      $info("Test case %0d: data_ready correct", tb_test_num);
    else
      $error("Test case %0d: data_ready not correct", tb_test_num);

  end
  endtask

  task send_byte;
  input logic [7:0] data_byte;
  begin
    integer i;
    for(i = 7; i >= 0; i--) begin
        send_bit(data_byte[i]);
    end
  end
  endtask

  task send_bit;
  input logic data_bit;
  begin
    tb_dp_i = data_bit;
    tb_dm_i = ~data_bit;
    #(CLK_PERIOD * 8);
  end
  endtask

  task send_eop;
  begin
    tb_dp_i = 0;
    tb_dm_i = 0;
    #(CLK_PERIOD * 16);
    tb_dp_i = 1;
    #(CLK_PERIOD * 8);
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


  always begin
    tb_clk = 1'b0;
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    #(CLK_PERIOD/2.0);
  end

  initial begin
  // initialize test bench signal
  tb_n_rst = 1'b1;
  tb_dp_i = 1'b1;
  tb_dm_i = 1'b0;
  tb_hsize = 2'b01;
  tb_buffer_occupancy = 8'b0;
  tb_test_num = 0;

  // Test 1 reset DUT
  tb_test_num++;
  tb_test_description = "reset DUT";

  reset_dut();
  #(CLK_PERIOD * 4);
  check_rcu_outputs(0,0,0,0,0);

  // Test 2 sending correct OUT
  tb_test_num++;
  tb_test_description = "sending correct OUT";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b10101010;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0101);
  check_pid(3'b001);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,0,0,0);
  send_byte(tb_test_byte);
  send_eop();
  check_rcv_data(32'h00000000);

  // Test 3 sending incorrect address OUT
  tb_test_num++;
  tb_test_description = "sending incorrect address OUT";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00101010;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0101);
  check_pid(3'b001);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,1,0,0);
  send_byte(tb_test_byte);
  send_eop();
  check_rcv_data(32'h00000000);

  // Test 4 sending incorrect endpoint OUT
  tb_test_num++;
  tb_test_description = "sending incorrect endpoint OUT";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b10101010;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0101);
  check_pid(3'b001);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11101010;
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,1,0,0);
  send_eop();
  check_rcv_data(32'h00000000);
  
  // Test 5 sending correct IN
  tb_test_num++;
  tb_test_description = "sending correct IN";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b01010101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0100);
  check_pid(3'b010);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,0,0,0);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,0,0,0);
  send_eop();
  check_rcv_data(32'h00000000);

  // Test 6 sending incorrect address IN
  tb_test_num++;
  tb_test_description = "sending incorrect address IN";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00010101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0100);
  check_pid(3'b010);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,1,0,0);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,1,0,0);
  send_eop();
  check_rcv_data(32'h00000000);

  // Test 7 sending incorrect endpoint IN
  tb_test_num++;
  tb_test_description = "sending incorrect endpoint IN";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b01010101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0100);
  check_pid(3'b010);
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b00001010;
  send_byte(tb_test_byte);
  check_rcu_outputs(0,1,1,0,0);
  send_eop();
  check_rcv_data(32'h00000000);

  // Test 8 one byte DATA0
  tb_test_num++;
  tb_test_description = "one byte DATA0";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0010);
  check_pid(3'b011);
  send_byte(tb_test_byte);
  check_rcv_data(32'haa000000);
  check_rcu_outputs(0,1,0,0,0);
  send_eop();
  

  // Test 9 two bytes DATA0
  tb_test_num++;
  tb_test_description = "two bytes DATA0";
  tb_hsize = 2'b10;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0010);
  check_pid(3'b011);
  send_byte(tb_test_byte);
  check_rcv_data(32'haa000000);
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11001100;
  send_byte(tb_test_byte);
  check_rcv_data(32'habaa0000); 
  check_rcu_outputs(0,1,0,0,0);
  send_eop();

  // Test 10 four bytes DATA0
  tb_test_num++;
  tb_test_description = "four bytes DATA0";
  tb_hsize = 2'b11;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0010);
  check_pid(3'b011);
  send_byte(tb_test_byte);
  check_rcv_data(32'haa000000);
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11001100;
  send_byte(tb_test_byte);
  check_rcv_data(32'habaa0000); 
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b00001111;
  send_byte(tb_test_byte);
  check_rcv_data(32'hefabaa00); 
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11111111;
  send_byte(tb_test_byte);
  check_rcv_data(32'hffefabaa); 
  check_rcu_outputs(0,1,0,0,0);
  send_eop();

  // Test 11 early EOP DATA0
  tb_test_num++;
  tb_test_description = "early EOP DATA0";
  tb_hsize = 2'b10;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0010);
  check_pid(3'b011);
  send_byte(tb_test_byte);
  check_rcv_data(32'haa000000);
  check_rcu_outputs(0,1,0,0,0);
  send_bit(1'b1);
  send_bit(1'b0);
  send_bit(1'b0);
  send_bit(1'b1);
  send_eop();
  check_rcv_data(32'haa000000); 
  check_rcu_outputs(0,0,1,0,0);

  // Test 12 one byte DATA1
  tb_test_num++;
  tb_test_description = "one byte DATA1";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b11100101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0011);
  check_pid(3'b100);
  send_byte(tb_test_byte);
  check_rcv_data(32'h16000000);
  check_rcu_outputs(0,1,0,0,0);
  send_eop();

  // Test 13 two bytes DATA1
  tb_test_num++;
  tb_test_description = "two bytes DATA1";
  tb_hsize = 2'b10;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b01101001;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0011);
  check_pid(3'b100);
  send_byte(tb_test_byte);
  check_rcv_data(32'h45000000); 
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b01001011;
  send_byte(tb_test_byte);
  check_rcv_data(32'h88450000); 
  check_rcu_outputs(0,1,0,0,0);
  send_eop();

  // Test 14 four bytes DATA1
  tb_test_num++;
  tb_test_description = "four bytes DATA0";
  tb_hsize = 2'b11;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0011);
  check_pid(3'b100);
  send_byte(tb_test_byte);
  check_rcv_data(32'hab000000);
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11001100;
  send_byte(tb_test_byte);
  check_rcv_data(32'habab0000); 
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b00100111;
  send_byte(tb_test_byte);
  check_rcv_data(32'hd3abab00); 
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11000111;
  send_byte(tb_test_byte);
  check_rcv_data(32'hdbd3abab); 
  check_rcu_outputs(0,1,0,0,0);
  send_eop();

  // Test 15 early EOP DATA1
  tb_test_num++;
  tb_test_description = "early EOP DATA1";
  tb_hsize = 2'b10;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0011);
  check_pid(3'b100);
  send_byte(tb_test_byte);
  check_rcv_data(32'hab000000);
  check_rcu_outputs(0,1,0,0,0);
  send_bit(1'b1);
  send_bit(1'b0);
  send_bit(1'b0);
  send_bit(1'b1);
  send_eop();
  check_rcv_data(32'hab000000); 
  check_rcu_outputs(0,0,1,0,0);

  // Test 16 ACK Correct
  tb_test_num++;
  tb_test_description = "ACK Correct";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b11100101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b1101);
  check_pid(3'b101);
  send_eop();
  check_rcu_outputs(0,0,0,0,0);

  // Test 17 ACK incorrect
  tb_test_num++;
  tb_test_description = "ACK incorrect";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b11100101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b1101);
  check_pid(3'b101);
  send_byte(tb_test_byte);
  check_rcv_data(32'h00000000);
  send_eop();
  check_rcu_outputs(0,0,1,0,0);

  // Test 18 NACK Correct
  tb_test_num++;
  tb_test_description = "NACK Correct";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b11100101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b1100);
  check_pid(3'b110);
  send_eop();
  check_rcu_outputs(0,0,0,0,0);

  // Test 19 NACK incorrect
  tb_test_num++;
  tb_test_description = "NACK incorrect";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b11100101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b1100);
  check_pid(3'b110);
  send_byte(tb_test_byte);
  check_rcv_data(32'h00000000);
  send_eop();
  check_rcu_outputs(0,0,1,0,0);

  // Test 20 STALL correct
  tb_test_num++;
  tb_test_description = "STALL Correct";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b11100101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b1111);
  check_pid(3'b111);
  send_eop();
  check_rcu_outputs(0,0,0,0,0);

  // Test 21 STALL incorrect
  tb_test_num++;
  tb_test_description = "STALL incorrect";

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b11100101;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b1111);
  check_pid(3'b111);
  send_byte(tb_test_byte);
  check_rcv_data(32'h00000000);
  send_eop();
  check_rcu_outputs(0,0,1,0,0);

  // Test 22 Invalid PID
  tb_test_num++;
  tb_test_description = "sending invalid PID";
  tb_hsize = 2'b11;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b1000);
  check_pid(3'b000);
  check_rcu_outputs(0,1,1,0,0);
  send_eop();

  // Test 23 Invalid Sync
  tb_test_num++;
  tb_test_description = "sending invalid SYNC";
  tb_hsize = 2'b00;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_byte(tb_test_byte);
  #(CLK_PERIOD);
  check_rcu_outputs(0,1,1,0,0);
  send_eop();

  // Test 24 Multiple byte packet
  tb_test_num++;
  tb_test_description = "Multiple byte packet";
  tb_hsize = 2'b01;

  reset_dut();
  #(CLK_PERIOD * 4);
  
  tb_test_byte = 8'b00110011;
  send_sync();
  check_rcu_outputs(0,1,0,1,0);
  send_pid(4'b0011);
  check_pid(3'b100);
  send_byte(tb_test_byte);
  check_rcv_data(32'hab000000);
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11001100;
  send_byte(tb_test_byte);
  check_rcv_data(32'hab000000); 
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b00100111;
  send_byte(tb_test_byte);
  check_rcv_data(32'hd3000000); 
  check_rcu_outputs(0,1,0,0,0);
  tb_test_byte = 8'b11000111;
  send_byte(tb_test_byte);
  check_rcv_data(32'hdb000000); 
  check_rcu_outputs(0,1,0,0,0);
  send_eop();

  $stop;
  end

endmodule