/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Jan 29 17:41:14 2024
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   dtemp;

  DFFSR dtemp_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dtemp) );
  DFFSR sync_out_reg ( .D(dtemp), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

