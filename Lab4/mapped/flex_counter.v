/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 31 00:43:43 2024
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   next_rollover_flag, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66;
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
  NOR2X1 U37 ( .A(n35), .B(n36), .Y(next_rollover_flag) );
  NAND2X1 U38 ( .A(n37), .B(n38), .Y(n36) );
  XNOR2X1 U39 ( .A(rollover_val[1]), .B(next_count_out[1]), .Y(n38) );
  XNOR2X1 U40 ( .A(rollover_val[2]), .B(next_count_out[2]), .Y(n37) );
  NAND3X1 U41 ( .A(n39), .B(n40), .C(n41), .Y(n35) );
  XNOR2X1 U42 ( .A(rollover_val[0]), .B(next_count_out[0]), .Y(n41) );
  XNOR2X1 U43 ( .A(rollover_val[3]), .B(next_count_out[3]), .Y(n39) );
  OAI21X1 U44 ( .A(n42), .B(n43), .C(n44), .Y(next_count_out[3]) );
  NAND3X1 U45 ( .A(n40), .B(n45), .C(count_out[3]), .Y(n44) );
  XOR2X1 U46 ( .A(n46), .B(n47), .Y(n42) );
  AND2X1 U47 ( .A(n48), .B(count_out[3]), .Y(n47) );
  NAND2X1 U48 ( .A(n49), .B(count_out[2]), .Y(n46) );
  OAI21X1 U49 ( .A(n50), .B(n51), .C(n52), .Y(next_count_out[2]) );
  NAND3X1 U50 ( .A(n49), .B(n50), .C(n53), .Y(n52) );
  NAND2X1 U51 ( .A(n54), .B(n40), .Y(n51) );
  OAI21X1 U52 ( .A(n49), .B(n55), .C(count_enable), .Y(n54) );
  AND2X1 U53 ( .A(n56), .B(count_out[1]), .Y(n49) );
  OAI21X1 U54 ( .A(n57), .B(n58), .C(n59), .Y(next_count_out[1]) );
  NAND3X1 U55 ( .A(n56), .B(n57), .C(n53), .Y(n59) );
  INVX1 U56 ( .A(n43), .Y(n53) );
  NAND2X1 U57 ( .A(n60), .B(n40), .Y(n58) );
  OAI21X1 U58 ( .A(n56), .B(n55), .C(count_enable), .Y(n60) );
  INVX1 U59 ( .A(n48), .Y(n55) );
  INVX1 U60 ( .A(count_out[1]), .Y(n57) );
  OAI21X1 U61 ( .A(n56), .B(n43), .C(n61), .Y(next_count_out[0]) );
  NAND3X1 U62 ( .A(n40), .B(n45), .C(count_out[0]), .Y(n61) );
  INVX1 U63 ( .A(count_enable), .Y(n45) );
  NAND2X1 U64 ( .A(count_enable), .B(n40), .Y(n43) );
  INVX1 U65 ( .A(clear), .Y(n40) );
  AND2X1 U66 ( .A(count_out[0]), .B(n48), .Y(n56) );
  NAND3X1 U67 ( .A(n62), .B(n63), .C(n64), .Y(n48) );
  NOR2X1 U68 ( .A(n65), .B(n66), .Y(n64) );
  XOR2X1 U69 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n66) );
  XOR2X1 U70 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n65) );
  XOR2X1 U71 ( .A(rollover_val[2]), .B(n50), .Y(n63) );
  INVX1 U72 ( .A(count_out[2]), .Y(n50) );
  XNOR2X1 U73 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n62) );
endmodule

