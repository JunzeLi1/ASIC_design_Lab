// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/20/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module ahb_lite_fir_filter(
    input logic clk, n_rst, hsel, hsize, hwrite,
    input logic [3:0] haddr,
    input logic [1:0] htrans,
    input logic [15:0] hwdata,
    output logic [15:0] hrdata,
    output logic hresp
);

    logic err;
    logic modwait;
    logic [1:0] coefficient_num;
    logic [15:0] fir_out;
    logic [15:0] sample_data;
    logic [15:0] fir_coefficient;
    logic data_ready;
    logic new_coefficient_set;
    logic clear_new_coefficient;
    logic load_coeff;

    ahb_lite_slave AHB_SLAVE (
        .clk(clk), 
        .n_rst(n_rst), 
        .modwait(modwait), 
        .err(err), 
        .hsel(hsel), 
        .hsize(hsize), 
        .hwrite(hwrite),
        .coefficient_num(coefficient_num), 
        .htrans(htrans),
        .fir_out(fir_out), 
        .hwdata(hwdata),
        .haddr(haddr),
        .sample_data(sample_data), 
        .fir_coefficient(fir_coefficient), 
        .hrdata(hrdata),
        .data_ready(data_ready), 
        .new_coefficient_set(new_coefficient_set), 
        .hresp(hresp),
        .clear_new_coefficient(clear_new_coefficient)
    );

    fir_filter FIR (
        .clk(clk), 
        .n_reset(n_rst), 
        .load_coeff(load_coeff), 
        .data_ready(data_ready),
        .sample_data(sample_data), 
        .fir_coefficient(fir_coefficient),
        .one_k_samples(one_k_samples), 
        .modwait(modwait), 
        .err(err),
        .fir_out(fir_out)
    );

    coefficient_loader COF (
        .clk(clk), 
        .n_reset(n_rst), 
        .new_coefficient_set(new_coefficient_set), 
        .modwait(modwait),
        .load_coeff(load_coeff),
        .coefficient_num(coefficient_num),
        .clear_new_coefficient(clear_new_coefficient)
    );

    
endmodule