/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Jan 24 22:56:32 2024
/////////////////////////////////////////////////////////////


module adder_16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n45, n47, n49, n51, n109,
         n110, n111;

  FAX1 U2 ( .A(B[15]), .B(A[15]), .C(n9), .YC(SUM[16]), .YS(SUM[15]) );
  FAX1 U3 ( .A(B[14]), .B(A[14]), .C(n10), .YC(n9), .YS(SUM[14]) );
  FAX1 U4 ( .A(B[13]), .B(A[13]), .C(n11), .YC(n10), .YS(SUM[13]) );
  FAX1 U5 ( .A(B[12]), .B(A[12]), .C(n12), .YC(n11), .YS(SUM[12]) );
  FAX1 U6 ( .A(B[11]), .B(A[11]), .C(n13), .YC(n12), .YS(SUM[11]) );
  FAX1 U7 ( .A(B[10]), .B(A[10]), .C(n14), .YC(n13), .YS(SUM[10]) );
  FAX1 U8 ( .A(B[9]), .B(A[9]), .C(n15), .YC(n14), .YS(SUM[9]) );
  FAX1 U9 ( .A(B[8]), .B(A[8]), .C(n16), .YC(n15), .YS(SUM[8]) );
  FAX1 U10 ( .A(B[7]), .B(A[7]), .C(n17), .YC(n16), .YS(SUM[7]) );
  XOR2X1 U11 ( .A(n20), .B(n1), .Y(SUM[6]) );
  OAI21X1 U12 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U13 ( .A(n19), .B(n45), .Y(n1) );
  NOR2X1 U15 ( .A(B[6]), .B(A[6]), .Y(n18) );
  NAND2X1 U16 ( .A(B[6]), .B(A[6]), .Y(n19) );
  XNOR2X1 U17 ( .A(n25), .B(n2), .Y(SUM[5]) );
  AOI21X1 U18 ( .A(n111), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U21 ( .A(n24), .B(n111), .Y(n2) );
  NAND2X1 U24 ( .A(B[5]), .B(A[5]), .Y(n24) );
  XOR2X1 U25 ( .A(n28), .B(n3), .Y(SUM[4]) );
  OAI21X1 U26 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U27 ( .A(n27), .B(n47), .Y(n3) );
  NOR2X1 U29 ( .A(B[4]), .B(A[4]), .Y(n26) );
  NAND2X1 U30 ( .A(B[4]), .B(A[4]), .Y(n27) );
  XNOR2X1 U31 ( .A(n33), .B(n4), .Y(SUM[3]) );
  AOI21X1 U32 ( .A(n110), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U35 ( .A(n32), .B(n110), .Y(n4) );
  NAND2X1 U38 ( .A(B[3]), .B(A[3]), .Y(n32) );
  XOR2X1 U39 ( .A(n36), .B(n5), .Y(SUM[2]) );
  OAI21X1 U40 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U41 ( .A(n35), .B(n49), .Y(n5) );
  NOR2X1 U43 ( .A(B[2]), .B(A[2]), .Y(n34) );
  NAND2X1 U44 ( .A(B[2]), .B(A[2]), .Y(n35) );
  XNOR2X1 U45 ( .A(n41), .B(n6), .Y(SUM[1]) );
  AOI21X1 U46 ( .A(n109), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U49 ( .A(n40), .B(n109), .Y(n6) );
  NAND2X1 U52 ( .A(B[1]), .B(A[1]), .Y(n40) );
  XNOR2X1 U53 ( .A(n7), .B(CI), .Y(SUM[0]) );
  OAI21X1 U54 ( .A(n42), .B(n44), .C(n43), .Y(n41) );
  NAND2X1 U55 ( .A(n43), .B(n51), .Y(n7) );
  NOR2X1 U57 ( .A(B[0]), .B(A[0]), .Y(n42) );
  NAND2X1 U58 ( .A(B[0]), .B(A[0]), .Y(n43) );
  OR2X2 U63 ( .A(B[1]), .B(A[1]), .Y(n109) );
  OR2X2 U64 ( .A(B[3]), .B(A[3]), .Y(n110) );
  OR2X2 U65 ( .A(B[5]), .B(A[5]), .Y(n111) );
  INVX2 U66 ( .A(n42), .Y(n51) );
  INVX2 U67 ( .A(n34), .Y(n49) );
  INVX2 U68 ( .A(n26), .Y(n47) );
  INVX2 U69 ( .A(n18), .Y(n45) );
  INVX2 U70 ( .A(CI), .Y(n44) );
  INVX2 U71 ( .A(n40), .Y(n38) );
  INVX2 U72 ( .A(n32), .Y(n30) );
  INVX2 U73 ( .A(n24), .Y(n22) );
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

