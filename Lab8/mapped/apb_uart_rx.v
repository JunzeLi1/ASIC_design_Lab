/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Mar  4 22:28:01 2024
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, data_ready, overrun_error, framing_error, psel, 
        penable, pwrite, rx_data, pwdata, paddr, prdata, pslverr, data_read, 
        data_size, bit_period );
  input [7:0] rx_data;
  input [7:0] pwdata;
  input [2:0] paddr;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output pslverr, data_read;
  wire   n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152;

  DFFSR \bit_period_reg[13]  ( .D(n143), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[13]) );
  DFFSR \bit_period_reg[12]  ( .D(n144), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[12]) );
  DFFSR \bit_period_reg[11]  ( .D(n145), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[11]) );
  DFFSR \bit_period_reg[10]  ( .D(n146), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[10]) );
  DFFSR \bit_period_reg[9]  ( .D(n171), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[9]) );
  DFFSR \bit_period_reg[8]  ( .D(n172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[8]) );
  DFFSR \bit_period_reg[7]  ( .D(n147), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[7]) );
  DFFSR \bit_period_reg[6]  ( .D(n148), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[6]) );
  DFFSR \bit_period_reg[5]  ( .D(n149), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[5]) );
  DFFSR \bit_period_reg[4]  ( .D(n150), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[4]) );
  DFFSR \bit_period_reg[3]  ( .D(n167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[3]) );
  DFFSR \bit_period_reg[2]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[2]) );
  DFFSR \bit_period_reg[1]  ( .D(n169), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[1]) );
  DFFSR \bit_period_reg[0]  ( .D(n170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[0]) );
  DFFSR \data_size_reg[3]  ( .D(n151), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg[2]  ( .D(n152), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \data_size_reg[1]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \data_size_reg[0]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR \prdata_reg[7]  ( .D(n158), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[7]) );
  DFFSR \prdata_reg[1]  ( .D(n142), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[1]) );
  DFFSR \prdata_reg[2]  ( .D(n163), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[2]) );
  DFFSR \prdata_reg[3]  ( .D(n162), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[3]) );
  DFFSR \prdata_reg[4]  ( .D(n161), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[4]) );
  DFFSR \prdata_reg[5]  ( .D(n160), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[5]) );
  DFFSR \prdata_reg[6]  ( .D(n159), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[6]) );
  DFFSR \prdata_reg[0]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[0]) );
  OAI21X1 U29 ( .A(n27), .B(n28), .C(n29), .Y(pslverr) );
  OAI21X1 U30 ( .A(n30), .B(n31), .C(n32), .Y(n29) );
  MUX2X1 U31 ( .B(n33), .A(n34), .S(n35), .Y(n31) );
  NAND2X1 U32 ( .A(n36), .B(n37), .Y(n33) );
  NOR2X1 U33 ( .A(n38), .B(n36), .Y(n30) );
  OAI21X1 U34 ( .A(n39), .B(n40), .C(n41), .Y(n142) );
  MUX2X1 U35 ( .B(prdata[1]), .A(n42), .S(n43), .Y(n41) );
  NAND2X1 U36 ( .A(n44), .B(n45), .Y(n42) );
  AOI22X1 U37 ( .A(n46), .B(overrun_error), .C(data_size[1]), .D(n35), .Y(n45)
         );
  NOR2X1 U38 ( .A(paddr[1]), .B(n47), .Y(n46) );
  AOI22X1 U39 ( .A(bit_period[9]), .B(n48), .C(bit_period[1]), .D(n49), .Y(n44) );
  INVX1 U40 ( .A(n50), .Y(n39) );
  OAI21X1 U41 ( .A(n51), .B(n52), .C(n53), .Y(n50) );
  AOI22X1 U42 ( .A(n54), .B(rx_data[2]), .C(n55), .D(rx_data[4]), .Y(n53) );
  MUX2X1 U43 ( .B(n56), .A(n57), .S(n58), .Y(n143) );
  INVX1 U44 ( .A(n59), .Y(n144) );
  MUX2X1 U45 ( .B(pwdata[4]), .A(bit_period[12]), .S(n58), .Y(n59) );
  MUX2X1 U46 ( .B(n60), .A(n61), .S(n58), .Y(n145) );
  INVX1 U47 ( .A(bit_period[11]), .Y(n61) );
  MUX2X1 U48 ( .B(n62), .A(n63), .S(n58), .Y(n146) );
  INVX1 U49 ( .A(bit_period[10]), .Y(n63) );
  INVX1 U50 ( .A(n64), .Y(n147) );
  MUX2X1 U51 ( .B(bit_period[7]), .A(pwdata[7]), .S(n65), .Y(n64) );
  INVX1 U52 ( .A(n66), .Y(n148) );
  MUX2X1 U53 ( .B(bit_period[6]), .A(pwdata[6]), .S(n65), .Y(n66) );
  MUX2X1 U54 ( .B(n67), .A(n56), .S(n65), .Y(n149) );
  INVX1 U55 ( .A(pwdata[5]), .Y(n56) );
  INVX1 U56 ( .A(n68), .Y(n150) );
  MUX2X1 U57 ( .B(bit_period[4]), .A(pwdata[4]), .S(n65), .Y(n68) );
  MUX2X1 U58 ( .B(n60), .A(n69), .S(n70), .Y(n151) );
  INVX1 U59 ( .A(data_size[3]), .Y(n69) );
  MUX2X1 U60 ( .B(n62), .A(n71), .S(n70), .Y(n152) );
  INVX1 U61 ( .A(data_size[2]), .Y(n71) );
  MUX2X1 U62 ( .B(n72), .A(n73), .S(n58), .Y(n172) );
  MUX2X1 U63 ( .B(n74), .A(n75), .S(n58), .Y(n171) );
  NAND3X1 U64 ( .A(n48), .B(n38), .C(n32), .Y(n58) );
  INVX1 U65 ( .A(bit_period[9]), .Y(n75) );
  MUX2X1 U66 ( .B(n76), .A(n72), .S(n65), .Y(n170) );
  MUX2X1 U67 ( .B(n77), .A(n74), .S(n65), .Y(n169) );
  INVX1 U68 ( .A(bit_period[1]), .Y(n77) );
  MUX2X1 U69 ( .B(n78), .A(n62), .S(n65), .Y(n168) );
  MUX2X1 U70 ( .B(n79), .A(n60), .S(n65), .Y(n167) );
  AND2X1 U71 ( .A(n49), .B(n32), .Y(n65) );
  INVX1 U72 ( .A(pwdata[3]), .Y(n60) );
  MUX2X1 U73 ( .B(n72), .A(n80), .S(n70), .Y(n166) );
  MUX2X1 U74 ( .B(n74), .A(n81), .S(n70), .Y(n165) );
  NAND3X1 U75 ( .A(n32), .B(n35), .C(n34), .Y(n70) );
  INVX1 U76 ( .A(n82), .Y(n34) );
  NAND3X1 U77 ( .A(n83), .B(n38), .C(n84), .Y(n82) );
  NOR2X1 U78 ( .A(pwdata[5]), .B(pwdata[4]), .Y(n84) );
  NOR2X1 U79 ( .A(pwdata[7]), .B(pwdata[6]), .Y(n38) );
  MUX2X1 U80 ( .B(n85), .A(n86), .S(pwdata[3]), .Y(n83) );
  NAND3X1 U81 ( .A(n74), .B(n62), .C(n72), .Y(n86) );
  INVX1 U82 ( .A(pwdata[0]), .Y(n72) );
  INVX1 U83 ( .A(pwdata[2]), .Y(n62) );
  NAND2X1 U84 ( .A(pwdata[2]), .B(pwdata[0]), .Y(n85) );
  AND2X1 U85 ( .A(pwrite), .B(psel), .Y(n32) );
  INVX1 U86 ( .A(data_size[1]), .Y(n81) );
  INVX1 U87 ( .A(pwdata[1]), .Y(n74) );
  OAI21X1 U88 ( .A(n87), .B(n40), .C(n88), .Y(n164) );
  MUX2X1 U89 ( .B(prdata[0]), .A(n89), .S(n43), .Y(n88) );
  OR2X1 U90 ( .A(n90), .B(n91), .Y(n89) );
  OAI22X1 U91 ( .A(n37), .B(n76), .C(n36), .D(n73), .Y(n91) );
  INVX1 U92 ( .A(bit_period[8]), .Y(n73) );
  INVX1 U93 ( .A(bit_period[0]), .Y(n76) );
  OAI22X1 U94 ( .A(n92), .B(n80), .C(n93), .D(n94), .Y(n90) );
  NAND2X1 U95 ( .A(n95), .B(n96), .Y(n94) );
  MUX2X1 U96 ( .B(data_ready), .A(framing_error), .S(paddr[0]), .Y(n93) );
  AOI21X1 U97 ( .A(rx_data[0]), .B(n97), .C(n98), .Y(n87) );
  OAI22X1 U98 ( .A(n99), .B(n51), .C(n100), .D(n101), .Y(n98) );
  INVX1 U99 ( .A(rx_data[1]), .Y(n51) );
  OAI21X1 U100 ( .A(n102), .B(n40), .C(n103), .Y(n163) );
  MUX2X1 U101 ( .B(prdata[2]), .A(n104), .S(n43), .Y(n103) );
  OAI21X1 U102 ( .A(n37), .B(n78), .C(n105), .Y(n104) );
  AOI22X1 U103 ( .A(data_size[2]), .B(n35), .C(bit_period[10]), .D(n48), .Y(
        n105) );
  INVX1 U104 ( .A(bit_period[2]), .Y(n78) );
  AOI21X1 U105 ( .A(n97), .B(rx_data[2]), .C(n106), .Y(n102) );
  OAI22X1 U106 ( .A(n99), .B(n101), .C(n100), .D(n107), .Y(n106) );
  OAI21X1 U107 ( .A(n108), .B(n40), .C(n109), .Y(n162) );
  MUX2X1 U108 ( .B(prdata[3]), .A(n110), .S(n43), .Y(n109) );
  OAI21X1 U109 ( .A(n37), .B(n79), .C(n111), .Y(n110) );
  AOI22X1 U110 ( .A(data_size[3]), .B(n35), .C(bit_period[11]), .D(n48), .Y(
        n111) );
  INVX1 U111 ( .A(n92), .Y(n35) );
  NAND3X1 U112 ( .A(n47), .B(n95), .C(paddr[2]), .Y(n92) );
  INVX1 U113 ( .A(paddr[1]), .Y(n95) );
  INVX1 U114 ( .A(bit_period[3]), .Y(n79) );
  INVX1 U115 ( .A(n112), .Y(n108) );
  OAI21X1 U116 ( .A(n101), .B(n52), .C(n113), .Y(n112) );
  AOI22X1 U117 ( .A(rx_data[4]), .B(n54), .C(n55), .D(rx_data[6]), .Y(n113) );
  INVX1 U118 ( .A(rx_data[3]), .Y(n101) );
  NAND2X1 U119 ( .A(n114), .B(n115), .Y(n161) );
  MUX2X1 U120 ( .B(prdata[4]), .A(n116), .S(n43), .Y(n115) );
  AND2X1 U121 ( .A(n48), .B(bit_period[12]), .Y(n116) );
  INVX1 U122 ( .A(n36), .Y(n48) );
  AOI22X1 U123 ( .A(n117), .B(bit_period[4]), .C(n118), .D(n119), .Y(n114) );
  OAI21X1 U124 ( .A(n120), .B(n52), .C(n121), .Y(n119) );
  AOI22X1 U125 ( .A(rx_data[7]), .B(n55), .C(rx_data[5]), .D(n54), .Y(n121) );
  INVX1 U126 ( .A(n100), .Y(n55) );
  NAND2X1 U127 ( .A(n99), .B(n52), .Y(n100) );
  INVX1 U128 ( .A(rx_data[4]), .Y(n120) );
  OR2X1 U129 ( .A(n122), .B(n123), .Y(n160) );
  OAI21X1 U130 ( .A(n67), .B(n124), .C(n125), .Y(n123) );
  MUX2X1 U131 ( .B(prdata[5]), .A(n126), .S(n43), .Y(n125) );
  NOR2X1 U132 ( .A(n36), .B(n57), .Y(n126) );
  INVX1 U133 ( .A(bit_period[13]), .Y(n57) );
  NAND3X1 U134 ( .A(paddr[0]), .B(n96), .C(paddr[1]), .Y(n36) );
  INVX1 U135 ( .A(bit_period[5]), .Y(n67) );
  OAI21X1 U136 ( .A(n107), .B(n127), .C(n128), .Y(n122) );
  NAND3X1 U137 ( .A(n118), .B(n54), .C(rx_data[6]), .Y(n128) );
  INVX1 U138 ( .A(n99), .Y(n54) );
  INVX1 U139 ( .A(rx_data[5]), .Y(n107) );
  NAND2X1 U140 ( .A(n129), .B(n130), .Y(n159) );
  AOI22X1 U141 ( .A(n131), .B(rx_data[7]), .C(n132), .D(rx_data[6]), .Y(n130)
         );
  NOR2X1 U142 ( .A(n99), .B(n40), .Y(n131) );
  NAND3X1 U143 ( .A(data_size[2]), .B(data_size[1]), .C(n133), .Y(n99) );
  NOR2X1 U144 ( .A(data_size[3]), .B(n80), .Y(n133) );
  AOI22X1 U145 ( .A(n117), .B(bit_period[6]), .C(prdata[6]), .D(n134), .Y(n129) );
  OAI21X1 U146 ( .A(n43), .B(n135), .C(n136), .Y(n158) );
  AOI22X1 U147 ( .A(n132), .B(rx_data[7]), .C(n117), .D(bit_period[7]), .Y(
        n136) );
  INVX1 U148 ( .A(n124), .Y(n117) );
  NAND2X1 U149 ( .A(n49), .B(n43), .Y(n124) );
  INVX1 U150 ( .A(n37), .Y(n49) );
  NAND3X1 U151 ( .A(n47), .B(n96), .C(paddr[1]), .Y(n37) );
  INVX1 U152 ( .A(paddr[2]), .Y(n96) );
  INVX1 U153 ( .A(n127), .Y(n132) );
  NAND2X1 U154 ( .A(n118), .B(n97), .Y(n127) );
  INVX1 U155 ( .A(n52), .Y(n97) );
  NAND3X1 U156 ( .A(data_size[3]), .B(n80), .C(n137), .Y(n52) );
  NOR2X1 U157 ( .A(data_size[2]), .B(data_size[1]), .Y(n137) );
  INVX1 U158 ( .A(data_size[0]), .Y(n80) );
  INVX1 U159 ( .A(n40), .Y(n118) );
  NAND3X1 U160 ( .A(paddr[1]), .B(paddr[2]), .C(n43), .Y(n40) );
  INVX1 U161 ( .A(prdata[7]), .Y(n135) );
  INVX1 U162 ( .A(n134), .Y(n43) );
  NAND2X1 U163 ( .A(n138), .B(n27), .Y(n134) );
  NAND2X1 U164 ( .A(paddr[2]), .B(paddr[0]), .Y(n27) );
  NOR2X1 U165 ( .A(n139), .B(n140), .Y(data_read) );
  NAND2X1 U166 ( .A(paddr[1]), .B(n138), .Y(n140) );
  INVX1 U167 ( .A(n28), .Y(n138) );
  NAND2X1 U168 ( .A(psel), .B(n141), .Y(n28) );
  INVX1 U169 ( .A(pwrite), .Y(n141) );
  NAND2X1 U170 ( .A(paddr[2]), .B(n47), .Y(n139) );
  INVX1 U171 ( .A(paddr[0]), .Y(n47) );
endmodule


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


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n94, next_rollover_flag, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, N41, \eq_56/B[0] , \eq_56/B[1] , \eq_56/B[2] ,
         \eq_56/B[3] , \eq_56/B[4] , \eq_56/B[5] , \eq_56/B[6] , \eq_56/B[7] ,
         \eq_56/B[8] , \eq_56/B[9] , \eq_56/B[10] , \eq_56/B[11] ,
         \eq_56/B[12] , \eq_56/B[13] , n2, n3, n4, n5, n6, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93;

  DFFSR \count_out_reg[0]  ( .D(\eq_56/B[0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(\eq_56/B[1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(\eq_56/B[2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(\eq_56/B[3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(\eq_56/B[4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(\eq_56/B[5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(\eq_56/B[6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(\eq_56/B[7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(\eq_56/B[8] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(\eq_56/B[9] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  DFFSR \count_out_reg[10]  ( .D(\eq_56/B[10] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[10]) );
  DFFSR \count_out_reg[11]  ( .D(\eq_56/B[11] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[11]) );
  DFFSR \count_out_reg[12]  ( .D(\eq_56/B[12] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[12]) );
  DFFSR \count_out_reg[13]  ( .D(\eq_56/B[13] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[13]) );
  DFFSR rollover_flag_reg ( .D(next_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(n94) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 add_42_aco ( .A({N41, N40, N39, N38, 
        N37, N36, N35, N34, N33, N32, N31, N30, N29, N28}), .SUM({N20, N19, 
        N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7}) );
  BUFX2 U5 ( .A(n94), .Y(rollover_flag) );
  OR2X2 U6 ( .A(clear), .B(count_enable), .Y(n40) );
  AND2X1 U20 ( .A(n2), .B(n3), .Y(next_rollover_flag) );
  NOR2X1 U21 ( .A(n4), .B(n5), .Y(n3) );
  NAND3X1 U22 ( .A(n6), .B(n22), .C(n23), .Y(n5) );
  NOR2X1 U23 ( .A(n24), .B(n25), .Y(n23) );
  XOR2X1 U24 ( .A(rollover_val[12]), .B(\eq_56/B[12] ), .Y(n25) );
  XOR2X1 U25 ( .A(rollover_val[6]), .B(\eq_56/B[6] ), .Y(n24) );
  XNOR2X1 U26 ( .A(rollover_val[11]), .B(\eq_56/B[11] ), .Y(n22) );
  XNOR2X1 U27 ( .A(rollover_val[10]), .B(\eq_56/B[10] ), .Y(n6) );
  NAND3X1 U28 ( .A(n26), .B(n27), .C(n28), .Y(n4) );
  NOR2X1 U29 ( .A(clear), .B(n29), .Y(n28) );
  XOR2X1 U30 ( .A(rollover_val[9]), .B(\eq_56/B[9] ), .Y(n29) );
  XNOR2X1 U31 ( .A(rollover_val[8]), .B(\eq_56/B[8] ), .Y(n27) );
  XNOR2X1 U32 ( .A(rollover_val[7]), .B(\eq_56/B[7] ), .Y(n26) );
  NOR2X1 U33 ( .A(n30), .B(n31), .Y(n2) );
  NAND3X1 U34 ( .A(n32), .B(n33), .C(n34), .Y(n31) );
  XNOR2X1 U35 ( .A(rollover_val[4]), .B(\eq_56/B[4] ), .Y(n34) );
  XNOR2X1 U36 ( .A(rollover_val[3]), .B(\eq_56/B[3] ), .Y(n33) );
  XNOR2X1 U37 ( .A(rollover_val[5]), .B(\eq_56/B[5] ), .Y(n32) );
  NAND3X1 U38 ( .A(n35), .B(n36), .C(n37), .Y(n30) );
  NOR2X1 U39 ( .A(n38), .B(n39), .Y(n37) );
  XOR2X1 U40 ( .A(rollover_val[1]), .B(\eq_56/B[1] ), .Y(n39) );
  XOR2X1 U41 ( .A(rollover_val[2]), .B(\eq_56/B[2] ), .Y(n38) );
  XNOR2X1 U42 ( .A(rollover_val[13]), .B(\eq_56/B[13] ), .Y(n36) );
  XNOR2X1 U43 ( .A(rollover_val[0]), .B(\eq_56/B[0] ), .Y(n35) );
  OAI21X1 U44 ( .A(n40), .B(n41), .C(n42), .Y(\eq_56/B[9] ) );
  NAND2X1 U45 ( .A(N16), .B(n43), .Y(n42) );
  OAI21X1 U46 ( .A(n40), .B(n44), .C(n45), .Y(\eq_56/B[8] ) );
  NAND2X1 U47 ( .A(N15), .B(n43), .Y(n45) );
  OAI21X1 U48 ( .A(n40), .B(n46), .C(n47), .Y(\eq_56/B[7] ) );
  NAND2X1 U49 ( .A(N14), .B(n43), .Y(n47) );
  OAI21X1 U50 ( .A(n40), .B(n48), .C(n49), .Y(\eq_56/B[6] ) );
  NAND2X1 U51 ( .A(N13), .B(n43), .Y(n49) );
  OAI21X1 U52 ( .A(n40), .B(n50), .C(n51), .Y(\eq_56/B[5] ) );
  NAND2X1 U53 ( .A(N12), .B(n43), .Y(n51) );
  OAI21X1 U54 ( .A(n40), .B(n52), .C(n53), .Y(\eq_56/B[4] ) );
  NAND2X1 U55 ( .A(N11), .B(n43), .Y(n53) );
  OAI21X1 U56 ( .A(n40), .B(n54), .C(n55), .Y(\eq_56/B[3] ) );
  NAND2X1 U57 ( .A(N10), .B(n43), .Y(n55) );
  OAI21X1 U58 ( .A(n40), .B(n56), .C(n57), .Y(\eq_56/B[2] ) );
  NAND2X1 U59 ( .A(N9), .B(n43), .Y(n57) );
  OAI21X1 U60 ( .A(n40), .B(n58), .C(n59), .Y(\eq_56/B[1] ) );
  NAND2X1 U61 ( .A(N8), .B(n43), .Y(n59) );
  OAI21X1 U62 ( .A(n40), .B(n60), .C(n61), .Y(\eq_56/B[13] ) );
  NAND2X1 U63 ( .A(N20), .B(n43), .Y(n61) );
  OAI21X1 U64 ( .A(n40), .B(n62), .C(n63), .Y(\eq_56/B[12] ) );
  NAND2X1 U65 ( .A(N19), .B(n43), .Y(n63) );
  OAI21X1 U66 ( .A(n40), .B(n64), .C(n65), .Y(\eq_56/B[11] ) );
  NAND2X1 U67 ( .A(N18), .B(n43), .Y(n65) );
  OAI21X1 U68 ( .A(n40), .B(n66), .C(n67), .Y(\eq_56/B[10] ) );
  NAND2X1 U69 ( .A(N17), .B(n43), .Y(n67) );
  OAI21X1 U70 ( .A(n40), .B(n68), .C(n69), .Y(\eq_56/B[0] ) );
  NAND2X1 U71 ( .A(N7), .B(n43), .Y(n69) );
  NOR2X1 U72 ( .A(n70), .B(clear), .Y(n43) );
  INVX1 U73 ( .A(count_enable), .Y(n70) );
  NOR2X1 U74 ( .A(n71), .B(n60), .Y(N41) );
  NOR2X1 U75 ( .A(n71), .B(n62), .Y(N40) );
  INVX1 U76 ( .A(count_out[12]), .Y(n62) );
  NOR2X1 U77 ( .A(n71), .B(n64), .Y(N39) );
  INVX1 U78 ( .A(count_out[11]), .Y(n64) );
  NOR2X1 U79 ( .A(n71), .B(n66), .Y(N38) );
  INVX1 U80 ( .A(count_out[10]), .Y(n66) );
  NOR2X1 U81 ( .A(n71), .B(n41), .Y(N37) );
  INVX1 U82 ( .A(count_out[9]), .Y(n41) );
  NOR2X1 U83 ( .A(n71), .B(n44), .Y(N36) );
  INVX1 U84 ( .A(count_out[8]), .Y(n44) );
  NOR2X1 U85 ( .A(n71), .B(n46), .Y(N35) );
  NOR2X1 U86 ( .A(n71), .B(n48), .Y(N34) );
  NOR2X1 U87 ( .A(n71), .B(n50), .Y(N33) );
  INVX1 U88 ( .A(count_out[5]), .Y(n50) );
  NOR2X1 U89 ( .A(n71), .B(n52), .Y(N32) );
  INVX1 U90 ( .A(count_out[4]), .Y(n52) );
  NOR2X1 U91 ( .A(n71), .B(n54), .Y(N31) );
  INVX1 U92 ( .A(count_out[3]), .Y(n54) );
  NOR2X1 U93 ( .A(n71), .B(n56), .Y(N30) );
  INVX1 U94 ( .A(count_out[2]), .Y(n56) );
  NOR2X1 U95 ( .A(n71), .B(n58), .Y(N29) );
  INVX1 U96 ( .A(count_out[1]), .Y(n58) );
  NOR2X1 U97 ( .A(n71), .B(n68), .Y(N28) );
  AND2X1 U98 ( .A(n72), .B(n73), .Y(n71) );
  NOR2X1 U99 ( .A(n74), .B(n75), .Y(n73) );
  NAND3X1 U100 ( .A(n76), .B(n77), .C(n78), .Y(n75) );
  XNOR2X1 U101 ( .A(count_out[11]), .B(rollover_val[11]), .Y(n78) );
  XNOR2X1 U102 ( .A(count_out[12]), .B(rollover_val[12]), .Y(n77) );
  XNOR2X1 U103 ( .A(count_out[10]), .B(rollover_val[10]), .Y(n76) );
  NAND3X1 U104 ( .A(n79), .B(n80), .C(n81), .Y(n74) );
  NOR2X1 U105 ( .A(n82), .B(n83), .Y(n81) );
  XNOR2X1 U106 ( .A(rollover_val[7]), .B(n46), .Y(n83) );
  INVX1 U107 ( .A(count_out[7]), .Y(n46) );
  XNOR2X1 U108 ( .A(rollover_val[6]), .B(n48), .Y(n82) );
  INVX1 U109 ( .A(count_out[6]), .Y(n48) );
  XNOR2X1 U110 ( .A(count_out[8]), .B(rollover_val[8]), .Y(n80) );
  XNOR2X1 U111 ( .A(count_out[9]), .B(rollover_val[9]), .Y(n79) );
  NOR2X1 U112 ( .A(n84), .B(n85), .Y(n72) );
  NAND3X1 U113 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  XNOR2X1 U114 ( .A(count_out[4]), .B(rollover_val[4]), .Y(n88) );
  XNOR2X1 U115 ( .A(count_out[5]), .B(rollover_val[5]), .Y(n87) );
  XNOR2X1 U116 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n86) );
  NAND3X1 U117 ( .A(n89), .B(n90), .C(n91), .Y(n84) );
  NOR2X1 U118 ( .A(n92), .B(n93), .Y(n91) );
  XNOR2X1 U119 ( .A(rollover_val[13]), .B(n60), .Y(n93) );
  INVX1 U120 ( .A(count_out[13]), .Y(n60) );
  XNOR2X1 U121 ( .A(rollover_val[0]), .B(n68), .Y(n92) );
  INVX1 U122 ( .A(count_out[0]), .Y(n68) );
  XNOR2X1 U123 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n90) );
  XNOR2X1 U124 ( .A(count_out[2]), .B(rollover_val[2]), .Y(n89) );
endmodule


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
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


module timer ( clk, n_rst, enable_timer, data_size, bit_period, shift_strobe, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5;

  flex_counter_NUM_CNT_BITS14 TIM1 ( .clk(clk), .n_rst(n_rst), .clear(n4), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_strobe) );
  flex_counter TIM2 ( .clk(clk), .n_rst(n_rst), .clear(n4), .count_enable(
        shift_strobe), .rollover_val({\_2_net_[3] , \_2_net_[2] , \_2_net_[1] , 
        n5}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(enable_timer), .Y(n4) );
  INVX1 U3 ( .A(data_size[0]), .Y(n5) );
  XOR2X1 U4 ( .A(data_size[3]), .B(n1), .Y(\_2_net_[3] ) );
  NOR2X1 U5 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U6 ( .A(n3), .B(n2), .Y(\_2_net_[2] ) );
  NAND2X1 U7 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U8 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U9 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
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


module rcv_block ( clk, n_rst, serial_in, data_read, data_size, bit_period, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
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
        .data_size(data_size), .bit_period(bit_period), .shift_strobe(
        shift_strobe), .packet_done(packet_done) );
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


module apb_uart_rx ( clk, n_rst, serial_in, psel, penable, pwrite, paddr, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave apb_slave_integrate ( .clk(clk), .n_rst(n_rst), .data_ready(
        data_ready), .overrun_error(overrun_error), .framing_error(
        framing_error), .psel(psel), .penable(penable), .pwrite(pwrite), 
        .rx_data(rx_data), .pwdata(pwdata), .paddr(paddr), .prdata(prdata), 
        .pslverr(pslverr), .data_read(data_read), .data_size(data_size), 
        .bit_period(bit_period) );
  rcv_block rcv_integrate ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .data_read(data_read), .data_size(data_size), .bit_period(bit_period), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
endmodule

