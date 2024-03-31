// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/20/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module ahb_lite_slave(
    input logic clk, n_rst, modwait, err, hsel, hsize, hwrite,
    input logic [1:0] coefficient_num, htrans,
    input logic [15:0] fir_out, hwdata,
    input logic [3:0] haddr, 
    output logic [15:0] sample_data, fir_coefficient, hrdata,
    output logic data_ready, new_coefficient_set, hresp,
    input logic clear_new_coefficient
);

    logic [3:0] next_haddr;
    logic [15:0] next_sample_data;
    logic [15:0] f0_coefficient;
    logic [15:0] f1_coefficient;
    logic [15:0] f2_coefficient;
    logic [15:0] f3_coefficient;
    logic [15:0] next_f0_coefficient;
    logic [15:0] next_f1_coefficient;
    logic [15:0] next_f2_coefficient;
    logic [15:0] next_f3_coefficient;
    logic next_new_coefficient_set;
    logic [15:0] next_hrdata;
    logic next_data_ready;
    logic next_next_data_ready;
    logic next_hwrite;
    logic next_hsize;
    logic next_hsel;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            next_haddr <= 0;
            sample_data <= 0;
            f0_coefficient <= 0;
            f1_coefficient <= 0;
            f2_coefficient <= 0;
            f3_coefficient <= 0;
            new_coefficient_set <= 0;
            hrdata <= 0;
            data_ready <= 0;
            next_next_data_ready <= 0;
            next_hwrite <= 0;
            next_hsize <= 0;
            next_hsel <= 0;
        end
        else begin
            next_haddr <= haddr;
            sample_data <= next_sample_data;
            f0_coefficient <= next_f0_coefficient;
            f1_coefficient <= next_f1_coefficient;
            f2_coefficient <= next_f2_coefficient;
            f3_coefficient <= next_f3_coefficient;
            new_coefficient_set <= next_new_coefficient_set;
            hrdata <= next_hrdata;
            data_ready <= next_next_data_ready || next_data_ready;
            next_next_data_ready <= next_data_ready;
            next_hwrite <= hwrite;
            next_hsize <= hsize;
            next_hsel <= hsel;
        end
    end

    always_comb begin
        next_f0_coefficient = f0_coefficient;
        next_f1_coefficient = f1_coefficient;
        next_f2_coefficient = f2_coefficient;
        next_f3_coefficient = f3_coefficient;
        next_sample_data = sample_data;
        next_new_coefficient_set = new_coefficient_set;
        // hresp = 0;
        next_data_ready = 0;
        next_hrdata = hrdata;

        if(clear_new_coefficient) begin
            next_new_coefficient_set = 0;
        end

        if(next_hsel && next_hwrite) begin
            if(next_hsize == 0) begin
                casez(next_haddr)
                4'd4: begin
                    next_sample_data = {sample_data[15:8], hwdata[7:0]};
                    next_data_ready = 1;
                end
                4'd5: begin
                    next_sample_data = {hwdata[7:0], sample_data[7:0]};
                    next_data_ready = 1;
                end
                4'd6: begin
                    next_f0_coefficient = {f0_coefficient[15:8], hwdata[7:0]};
                end
                4'd7: begin
                    next_f0_coefficient = {hwdata[7:0], f0_coefficient[7:0]};
                end
                4'd8: begin
                    next_f1_coefficient = {f1_coefficient[15:8], hwdata[7:0]};
                end
                4'd9: begin
                    next_f1_coefficient = {hwdata[7:0], f1_coefficient[7:0]};
                end
                4'd10: begin
                    next_f2_coefficient = {f2_coefficient[15:8], hwdata[7:0]};
                end
                4'd11: begin
                    next_f2_coefficient = {hwdata[7:0], f2_coefficient[7:0]};
                end
                4'd12: begin
                    next_f3_coefficient = {f3_coefficient[15:8], hwdata[7:0]};
                end
                4'd13: begin
                    next_f3_coefficient = {hwdata[7:0], f3_coefficient[7:0]};
                end
                4'd14: begin
                    next_new_coefficient_set = hwdata[0]; 
                end
                // default: hresp = 1;
                endcase
            end
            else begin
                casez(next_haddr)
                4'd4: begin
                    next_sample_data = hwdata;
                    next_data_ready = 1;
                end
                4'd5: begin
                    next_sample_data = hwdata;
                    next_data_ready = 1;
                end
                4'd6: begin
                    next_f0_coefficient = hwdata;
                end
                4'd7: begin
                    next_f0_coefficient = hwdata;
                end
                4'd8: begin
                    next_f1_coefficient = hwdata;
                end
                4'd9: begin
                    next_f1_coefficient = hwdata;
                end
                4'd10: begin
                    next_f2_coefficient = hwdata;
                end
                4'd11: begin
                    next_f2_coefficient = hwdata;
                end
                4'd12: begin
                    next_f3_coefficient = hwdata;
                end
                4'd13: begin
                    next_f3_coefficient = hwdata;
                end
                4'd14: begin
                    if(clear_new_coefficient) begin
                        next_new_coefficient_set = 0;
                    end
                    next_new_coefficient_set = hwdata[0]; 
                end
                // default: hresp = 1;
                endcase
            end
        end
        if(hsel && !hwrite) begin
            if (hsize == 0) begin
                casez(haddr)
                4'd0: begin
                    next_hrdata[7:0] = {7'b0, modwait || new_coefficient_set};
                end
                4'd1: begin
                    next_hrdata[15:8] = {7'b0, err};
                end
                4'd2: begin  
                    next_hrdata[7:0] = fir_out[7:0];
                end
                4'd3: begin
                    next_hrdata[15:8] = fir_out[15:8];
                end
                4'd4: begin
                    next_hrdata[7:0] = sample_data[7:0];
                end
                4'd5: begin
                    next_hrdata[15:8] = sample_data[15:8];
                end
                4'd6: begin
                    next_hrdata[7:0] = f0_coefficient[7:0];
                end
                4'd7: begin
                    next_hrdata[15:8] = f0_coefficient[15:8];
                end
                4'd8: begin
                    next_hrdata[7:0] = f1_coefficient[7:0];
                end
                4'd9: begin
                    next_hrdata[15:8] = f1_coefficient[15:8];
                end
                4'd10: begin
                    next_hrdata[7:0] = f2_coefficient[7:0];
                end
                4'd11: begin
                    next_hrdata[15:8] = f2_coefficient[15:8];
                end
                4'd12: begin
                    next_hrdata[7:0] = f3_coefficient[7:0];
                end
                4'd13: begin
                    next_hrdata[15:8] = f3_coefficient[15:8];
                end
                4'd14: begin
                    next_hrdata = {7'b0, new_coefficient_set};  
                end
                // default: hresp = 1;
                endcase
            end
            
            else begin
                casez(haddr)
                4'd0: begin
                    next_hrdata = {7'b0, err, 7'b0, modwait || new_coefficient_set};
                end
                4'd1: begin
                    next_hrdata = {7'b0, err, 7'b0, modwait || new_coefficient_set};
                end
                4'd2: begin
                    next_hrdata = fir_out;
                end
                4'd3: begin
                    next_hrdata = fir_out;
                end
                4'd4: begin
                    next_hrdata = sample_data;
                end
                4'd5: begin
                    next_hrdata = sample_data;
                end
                4'd6: begin
                    next_hrdata = f0_coefficient;
                end
                4'd7: begin
                    next_hrdata = f0_coefficient;
                end
                4'd8: begin
                    next_hrdata = f1_coefficient;
                end
                4'd9: begin
                    next_hrdata = f1_coefficient;
                end
                4'd10: begin
                    next_hrdata = f2_coefficient;
                end
                4'd11: begin
                    next_hrdata = f2_coefficient;
                end
                4'd12: begin
                    next_hrdata = f3_coefficient;
                end
                4'd13: begin
                    next_hrdata = f3_coefficient;
                end
                4'd14: begin
                    next_hrdata = {7'b0, new_coefficient_set};  
                end
                // default: hresp = 1;
                endcase
            end
        end
        if(hsel) begin
            if(hwrite == 0 && next_hwrite == 1) begin
                next_hrdata = hwdata;
            end
        end
        else begin
            next_hrdata = hrdata;
        end

        if(coefficient_num == 2'd0) begin
            fir_coefficient = f0_coefficient;
        end
        else if(coefficient_num == 2'd1) begin
            fir_coefficient = f1_coefficient;
        end
        else if(coefficient_num == 2'd2) begin
            fir_coefficient = f2_coefficient;
        end
        else begin
            fir_coefficient = f3_coefficient;
        end
        

        // // error checking function
        // if(haddr == 4'd15) begin
        //     hresp = 1;
        // end
        // else if((haddr < 4'd4) && hwrite == 1) begin
        //     hresp = 1;
        // end
    end

    always_comb begin
        hresp = 0;
        // error checking function
        if(haddr == 4'd15) begin
            hresp = 1;
        end
        if((haddr < 4'd4) && hwrite == 1) begin
            hresp = 1;
        end
    end
    
endmodule

