/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 24 22:56:00 2024
/////////////////////////////////////////////////////////////


module adder_16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34, n35,
         n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52, n54,
         n56, n57, n58, n59, n60, n61, n63, n65, n67, n69, n71, n129, n130,
         n131, n132, n133;

  FAX1 U2 ( .A(B[15]), .B(A[15]), .C(n13), .YC(SUM[16]), .YS(SUM[15]) );
  FAX1 U3 ( .A(B[14]), .B(A[14]), .C(n14), .YC(n13), .YS(SUM[14]) );
  FAX1 U4 ( .A(B[13]), .B(A[13]), .C(n15), .YC(n14), .YS(SUM[13]) );
  FAX1 U5 ( .A(B[12]), .B(A[12]), .C(n16), .YC(n15), .YS(SUM[12]) );
  FAX1 U6 ( .A(B[11]), .B(A[11]), .C(n17), .YC(n16), .YS(SUM[11]) );
  XOR2X1 U7 ( .A(n20), .B(n1), .Y(SUM[10]) );
  OAI21X1 U8 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U9 ( .A(n19), .B(n61), .Y(n1) );
  NOR2X1 U11 ( .A(B[10]), .B(A[10]), .Y(n18) );
  NAND2X1 U12 ( .A(B[10]), .B(A[10]), .Y(n19) );
  XNOR2X1 U13 ( .A(n25), .B(n2), .Y(SUM[9]) );
  AOI21X1 U14 ( .A(n133), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U17 ( .A(n24), .B(n133), .Y(n2) );
  NAND2X1 U20 ( .A(B[9]), .B(A[9]), .Y(n24) );
  XOR2X1 U21 ( .A(n28), .B(n3), .Y(SUM[8]) );
  OAI21X1 U22 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U23 ( .A(n27), .B(n63), .Y(n3) );
  NOR2X1 U25 ( .A(B[8]), .B(A[8]), .Y(n26) );
  NAND2X1 U26 ( .A(B[8]), .B(A[8]), .Y(n27) );
  XNOR2X1 U27 ( .A(n33), .B(n4), .Y(SUM[7]) );
  AOI21X1 U28 ( .A(n132), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U31 ( .A(n32), .B(n132), .Y(n4) );
  NAND2X1 U34 ( .A(B[7]), .B(A[7]), .Y(n32) );
  XOR2X1 U35 ( .A(n36), .B(n5), .Y(SUM[6]) );
  OAI21X1 U36 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n35), .B(n65), .Y(n5) );
  NOR2X1 U39 ( .A(B[6]), .B(A[6]), .Y(n34) );
  NAND2X1 U40 ( .A(B[6]), .B(A[6]), .Y(n35) );
  XNOR2X1 U41 ( .A(n41), .B(n6), .Y(SUM[5]) );
  AOI21X1 U42 ( .A(n131), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U45 ( .A(n40), .B(n131), .Y(n6) );
  NAND2X1 U48 ( .A(B[5]), .B(A[5]), .Y(n40) );
  XOR2X1 U49 ( .A(n44), .B(n7), .Y(SUM[4]) );
  OAI21X1 U50 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U51 ( .A(n43), .B(n67), .Y(n7) );
  NOR2X1 U53 ( .A(B[4]), .B(A[4]), .Y(n42) );
  NAND2X1 U54 ( .A(B[4]), .B(A[4]), .Y(n43) );
  XNOR2X1 U55 ( .A(n49), .B(n8), .Y(SUM[3]) );
  AOI21X1 U56 ( .A(n130), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U59 ( .A(n48), .B(n130), .Y(n8) );
  NAND2X1 U62 ( .A(B[3]), .B(A[3]), .Y(n48) );
  XOR2X1 U63 ( .A(n52), .B(n9), .Y(SUM[2]) );
  OAI21X1 U64 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U65 ( .A(n51), .B(n69), .Y(n9) );
  NOR2X1 U67 ( .A(B[2]), .B(A[2]), .Y(n50) );
  NAND2X1 U68 ( .A(B[2]), .B(A[2]), .Y(n51) );
  XNOR2X1 U69 ( .A(n57), .B(n10), .Y(SUM[1]) );
  AOI21X1 U70 ( .A(n129), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U73 ( .A(n56), .B(n129), .Y(n10) );
  NAND2X1 U76 ( .A(B[1]), .B(A[1]), .Y(n56) );
  XNOR2X1 U77 ( .A(n11), .B(CI), .Y(SUM[0]) );
  OAI21X1 U78 ( .A(n58), .B(n60), .C(n59), .Y(n57) );
  NAND2X1 U79 ( .A(n59), .B(n71), .Y(n11) );
  NOR2X1 U81 ( .A(B[0]), .B(A[0]), .Y(n58) );
  NAND2X1 U82 ( .A(B[0]), .B(A[0]), .Y(n59) );
  OR2X2 U87 ( .A(B[1]), .B(A[1]), .Y(n129) );
  OR2X2 U88 ( .A(B[3]), .B(A[3]), .Y(n130) );
  OR2X2 U89 ( .A(B[5]), .B(A[5]), .Y(n131) );
  OR2X2 U90 ( .A(B[7]), .B(A[7]), .Y(n132) );
  OR2X2 U91 ( .A(B[9]), .B(A[9]), .Y(n133) );
  INVX2 U92 ( .A(n58), .Y(n71) );
  INVX2 U93 ( .A(n50), .Y(n69) );
  INVX2 U94 ( .A(n42), .Y(n67) );
  INVX2 U95 ( .A(n34), .Y(n65) );
  INVX2 U96 ( .A(n26), .Y(n63) );
  INVX2 U97 ( .A(n18), .Y(n61) );
  INVX2 U98 ( .A(CI), .Y(n60) );
  INVX2 U99 ( .A(n56), .Y(n54) );
  INVX2 U100 ( .A(n48), .Y(n46) );
  INVX2 U101 ( .A(n40), .Y(n38) );
  INVX2 U102 ( .A(n32), .Y(n30) );
  INVX2 U103 ( .A(n24), .Y(n22) );
endmodule


module adder_16 ( a, b, carry_in, sum, overflow );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input carry_in;
  output overflow;


  adder_16_DW01_add_1 r304 ( .A({1'b0, a}), .B({1'b0, b}), .CI(carry_in), 
        .SUM({overflow, sum}) );
endmodule

