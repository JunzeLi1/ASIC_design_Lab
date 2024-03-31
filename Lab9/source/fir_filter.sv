// $Id: $
// File name:   fir_filter.sv
// Created:     2/19/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module fir_filter (
    input logic clk, n_reset, load_coeff, data_ready,
    input logic [15:0] sample_data, fir_coefficient,
    output logic one_k_samples, modwait, err,
    output logic [15:0] fir_out
);

    logic dr;
    logic lc;
    logic cnt_up;
    logic clear;
    logic [2:0] op;
    logic [3:0] src1;
    logic [3:0] src2;
    logic [3:0] dest;
    logic overflow;
    logic [16:0] outreg_data;

    // sync_low sync(.clk(clk), .n_rst(n_reset), .async_in(data_ready), 
    //             .sync_out(dr));
    // sync_low sync1(.clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
    //             .sync_out(lc));
    controller control_unit(.clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(load_coeff), .overflow(overflow),
            .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .err(err), .op(op), .src1(src1), 
            .src2(src2), .dest(dest));
    counter counter_fir(.clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), .one_k_samples(one_k_samples));
    datapath DAT (.clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), .dest(dest),
            .ext_data1(sample_data), .ext_data2(fir_coefficient), .outreg_data(outreg_data), .overflow(overflow));
    magnitude magnitude_fir(.in(outreg_data), .out(fir_out));
   
endmodule
