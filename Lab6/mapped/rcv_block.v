/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Feb  8 14:03:16 2024
/////////////////////////////////////////////////////////////


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_packet_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_packet_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_packet_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 stp ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module flex_counter_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n39, next_rollover_flag, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(next_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n39) );
  BUFX2 U8 ( .A(n39), .Y(rollover_flag) );
  NOR2X1 U9 ( .A(n2), .B(n3), .Y(next_rollover_flag) );
  NAND2X1 U10 ( .A(n4), .B(n5), .Y(n3) );
  XNOR2X1 U11 ( .A(rollover_val[1]), .B(next_count_out[1]), .Y(n5) );
  XNOR2X1 U12 ( .A(rollover_val[2]), .B(next_count_out[2]), .Y(n4) );
  NAND3X1 U13 ( .A(n6), .B(n12), .C(n13), .Y(n2) );
  XNOR2X1 U14 ( .A(rollover_val[0]), .B(next_count_out[0]), .Y(n13) );
  XNOR2X1 U15 ( .A(rollover_val[3]), .B(next_count_out[3]), .Y(n6) );
  OAI21X1 U16 ( .A(n14), .B(n15), .C(n16), .Y(next_count_out[3]) );
  NAND3X1 U17 ( .A(n12), .B(n17), .C(count_out[3]), .Y(n16) );
  XOR2X1 U18 ( .A(n18), .B(n19), .Y(n14) );
  AND2X1 U19 ( .A(n20), .B(count_out[3]), .Y(n19) );
  NAND2X1 U20 ( .A(n21), .B(count_out[2]), .Y(n18) );
  OAI21X1 U21 ( .A(n22), .B(n23), .C(n24), .Y(next_count_out[2]) );
  NAND3X1 U22 ( .A(n21), .B(n22), .C(n25), .Y(n24) );
  NAND2X1 U23 ( .A(n26), .B(n12), .Y(n23) );
  OAI21X1 U24 ( .A(n21), .B(n27), .C(count_enable), .Y(n26) );
  AND2X1 U25 ( .A(n28), .B(count_out[1]), .Y(n21) );
  OAI21X1 U26 ( .A(n29), .B(n30), .C(n31), .Y(next_count_out[1]) );
  NAND3X1 U27 ( .A(n28), .B(n29), .C(n25), .Y(n31) );
  INVX1 U28 ( .A(n15), .Y(n25) );
  NAND2X1 U29 ( .A(n32), .B(n12), .Y(n30) );
  OAI21X1 U30 ( .A(n28), .B(n27), .C(count_enable), .Y(n32) );
  INVX1 U31 ( .A(n20), .Y(n27) );
  INVX1 U32 ( .A(count_out[1]), .Y(n29) );
  OAI21X1 U33 ( .A(n28), .B(n15), .C(n33), .Y(next_count_out[0]) );
  NAND3X1 U34 ( .A(n12), .B(n17), .C(count_out[0]), .Y(n33) );
  INVX1 U35 ( .A(count_enable), .Y(n17) );
  NAND2X1 U36 ( .A(count_enable), .B(n12), .Y(n15) );
  INVX1 U37 ( .A(clear), .Y(n12) );
  AND2X1 U38 ( .A(count_out[0]), .B(n20), .Y(n28) );
  NAND3X1 U39 ( .A(n34), .B(n35), .C(n36), .Y(n20) );
  NOR2X1 U40 ( .A(n37), .B(n38), .Y(n36) );
  XOR2X1 U41 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n38) );
  XOR2X1 U42 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n37) );
  XOR2X1 U43 ( .A(rollover_val[2]), .B(n22), .Y(n35) );
  INVX1 U44 ( .A(count_out[2]), .Y(n22) );
  XNOR2X1 U45 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n34) );
endmodule


module flex_counter_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   next_rollover_flag, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [3:0] next_count_out;

  DFFSR \count_out_reg[0]  ( .D(next_count_out[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count_out[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count_out[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count_out[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(next_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(next_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(next_count_out[1]), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[2]), .B(next_count_out[2]), .Y(n3) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n12), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(next_count_out[0]), .Y(n12) );
  XNOR2X1 U14 ( .A(rollover_val[3]), .B(next_count_out[3]), .Y(n5) );
  OAI21X1 U15 ( .A(n13), .B(n14), .C(n15), .Y(next_count_out[3]) );
  NAND3X1 U16 ( .A(n6), .B(n16), .C(count_out[3]), .Y(n15) );
  XOR2X1 U17 ( .A(n17), .B(n18), .Y(n13) );
  AND2X1 U18 ( .A(n19), .B(count_out[3]), .Y(n18) );
  NAND2X1 U19 ( .A(n20), .B(count_out[2]), .Y(n17) );
  OAI21X1 U20 ( .A(n21), .B(n22), .C(n23), .Y(next_count_out[2]) );
  NAND3X1 U21 ( .A(n20), .B(n21), .C(n24), .Y(n23) );
  NAND2X1 U22 ( .A(n25), .B(n6), .Y(n22) );
  OAI21X1 U23 ( .A(n20), .B(n26), .C(count_enable), .Y(n25) );
  AND2X1 U24 ( .A(n27), .B(count_out[1]), .Y(n20) );
  OAI21X1 U25 ( .A(n28), .B(n29), .C(n30), .Y(next_count_out[1]) );
  NAND3X1 U26 ( .A(n27), .B(n28), .C(n24), .Y(n30) );
  INVX1 U27 ( .A(n14), .Y(n24) );
  NAND2X1 U28 ( .A(n31), .B(n6), .Y(n29) );
  OAI21X1 U29 ( .A(n27), .B(n26), .C(count_enable), .Y(n31) );
  INVX1 U30 ( .A(n19), .Y(n26) );
  INVX1 U31 ( .A(count_out[1]), .Y(n28) );
  OAI21X1 U32 ( .A(n27), .B(n14), .C(n32), .Y(next_count_out[0]) );
  NAND3X1 U33 ( .A(n6), .B(n16), .C(count_out[0]), .Y(n32) );
  INVX1 U34 ( .A(count_enable), .Y(n16) );
  NAND2X1 U35 ( .A(count_enable), .B(n6), .Y(n14) );
  INVX1 U36 ( .A(clear), .Y(n6) );
  AND2X1 U37 ( .A(count_out[0]), .B(n19), .Y(n27) );
  NAND3X1 U38 ( .A(n33), .B(n34), .C(n35), .Y(n19) );
  NOR2X1 U39 ( .A(n36), .B(n37), .Y(n35) );
  XOR2X1 U40 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n37) );
  XOR2X1 U41 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n36) );
  XOR2X1 U42 ( .A(rollover_val[2]), .B(n21), .Y(n34) );
  INVX1 U43 ( .A(count_out[2]), .Y(n21) );
  XNOR2X1 U44 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n33) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   n1;

  flex_counter_1 TIM1 ( .clk(clk), .n_rst(n_rst), .clear(n1), .count_enable(
        enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_strobe) );
  flex_counter_0 TIM2 ( .clk(clk), .n_rst(n_rst), .clear(n1), .count_enable(
        shift_strobe), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(packet_done) );
  INVX1 U3 ( .A(enable_timer), .Y(n1) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n28, n29, n30, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22;
  wire   [2:0] curr_state;

  DFFSR \curr_state_reg[0]  ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[0]) );
  DFFSR \curr_state_reg[2]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[2]) );
  DFFSR \curr_state_reg[1]  ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[1]) );
  NOR2X1 U6 ( .A(n4), .B(n5), .Y(sbc_enable) );
  INVX1 U7 ( .A(n6), .Y(enable_timer) );
  OAI21X1 U8 ( .A(n7), .B(n8), .C(n9), .Y(n30) );
  AOI21X1 U9 ( .A(n10), .B(n11), .C(sbc_clear), .Y(n9) );
  INVX1 U10 ( .A(n12), .Y(sbc_clear) );
  NAND3X1 U11 ( .A(curr_state[2]), .B(n5), .C(curr_state[0]), .Y(n12) );
  OAI22X1 U12 ( .A(n6), .B(n13), .C(n7), .D(n5), .Y(n29) );
  OAI21X1 U13 ( .A(n7), .B(n14), .C(n15), .Y(n28) );
  MUX2X1 U14 ( .B(n16), .A(n17), .S(curr_state[1]), .Y(n15) );
  NOR2X1 U15 ( .A(framing_error), .B(n8), .Y(n17) );
  NOR2X1 U16 ( .A(n4), .B(n13), .Y(n16) );
  INVX1 U17 ( .A(n18), .Y(n7) );
  OAI21X1 U18 ( .A(load_buffer), .B(n19), .C(n10), .Y(n18) );
  INVX1 U19 ( .A(n13), .Y(n10) );
  OAI21X1 U20 ( .A(packet_done), .B(n6), .C(n20), .Y(n13) );
  NAND2X1 U21 ( .A(n21), .B(n11), .Y(n20) );
  INVX1 U22 ( .A(n4), .Y(n11) );
  NAND2X1 U23 ( .A(n8), .B(n14), .Y(n4) );
  NOR2X1 U24 ( .A(new_packet_detected), .B(curr_state[1]), .Y(n21) );
  NAND3X1 U25 ( .A(n5), .B(n14), .C(curr_state[0]), .Y(n6) );
  INVX1 U26 ( .A(curr_state[2]), .Y(n14) );
  AOI21X1 U27 ( .A(curr_state[2]), .B(curr_state[1]), .C(n8), .Y(n19) );
  INVX1 U28 ( .A(n22), .Y(load_buffer) );
  NAND3X1 U29 ( .A(n8), .B(n5), .C(curr_state[2]), .Y(n22) );
  INVX1 U30 ( .A(curr_state[1]), .Y(n5) );
  INVX1 U31 ( .A(curr_state[0]), .Y(n8) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   new_packet_detected, shift_strobe, stop_bit, enable_timer,
         packet_done, SBC_clear, SBC_enable, load_buffer;
  wire   [7:0] packet_data;

  start_bit_det RCV1 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(new_packet_detected) );
  sr_9bit RCV2 ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  timer RCV3 ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_strobe(shift_strobe), .packet_done(packet_done) );
  rcu RCV4 ( .clk(clk), .n_rst(n_rst), .new_packet_detected(
        new_packet_detected), .packet_done(packet_done), .framing_error(
        framing_error), .sbc_clear(SBC_clear), .sbc_enable(SBC_enable), 
        .load_buffer(load_buffer), .enable_timer(enable_timer) );
  stop_bit_chk RCV5 ( .clk(clk), .n_rst(n_rst), .sbc_clear(SBC_clear), 
        .sbc_enable(SBC_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  rx_data_buff RCV6 ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
endmodule

