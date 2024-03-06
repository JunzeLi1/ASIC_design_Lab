// $Id: $
// File name:   apb_uart_rx.sv
// Created:     3/4/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module apb_uart_rx(
    input logic clk, n_rst, serial_in, psel, penable, pwrite,
    input logic [2:0] paddr,
    input logic [7:0] pwdata,
    output logic [7:0] prdata,
    output logic pslverr
);

    logic data_ready;
    logic [7:0] rx_data;
    logic data_read;
    logic overrun_error;
    logic framing_error;
    logic [3:0] data_size;
    logic [13:0] bit_period;
    apb_slave apb_slave_integrate (.clk(clk), .n_rst(n_rst), .data_ready(data_ready), .overrun_error(overrun_error), .framing_error(framing_error), .psel(psel),
                                    .penable(penable), .pwrite(pwrite), .rx_data(rx_data), .pwdata(pwdata), .paddr(paddr), .prdata(prdata), .pslverr(pslverr)
                                    , .data_size(data_size), .bit_period(bit_period), .data_read(data_read));
    rcv_block rcv_integrate (.clk(clk), .n_rst(n_rst), .serial_in(serial_in), .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error)
                            , .framing_error(framing_error), .data_size(data_size), .bit_period(bit_period));
               
endmodule