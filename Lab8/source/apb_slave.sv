// $Id: $
// File name:   apb_slave.sv
// Created:     3/4/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module apb_slave (
    input logic clk, n_rst, data_ready, overrun_error, framing_error, 
                psel, penable, pwrite, 
    input logic [7:0] rx_data, pwdata,
    input logic [2:0] paddr,
    output logic [7:0] prdata,
    output logic pslverr, data_read,
    output logic [3:0] data_size,
    output logic [13:0] bit_period
);
    logic [13:0] next_bit_period;
    logic [3:0] next_data_size;
    logic [7:0] next_pr_data;


    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            bit_period <= '0;
            data_size <= '0;
            prdata <= '0;
        end
        else begin
            bit_period <= next_bit_period;
            data_size <= next_data_size;
            prdata <= next_pr_data;
        end     
    end   
    
    always_comb begin
        next_bit_period = bit_period;
        next_data_size = data_size;
        next_pr_data = prdata;
        data_read = 0;
        pslverr = 0;
        
        if(psel) begin
            if(pwrite) begin
                casez (paddr)
                    3'b010: begin
                        next_bit_period[7:0] = pwdata;                 
                    end
                    3'b011: begin
                        if (pwdata[7:6] == '0) begin
                            next_bit_period[13:8] = pwdata[5:0];
                        end else begin
                            pslverr = 1;
                        end      
                    end
                    3'b100: begin
                        if (pwdata == 8'd5 || pwdata == 8'd7 || pwdata == 8'd8) begin
                            next_data_size = pwdata[3:0];
                        end else begin
                            pslverr = 1;
                        end
                    end
                    default: pslverr = 1;
                endcase
            end
            else begin //read
                casez (paddr)
                    3'b000: begin
                        next_pr_data = {7'b0, data_ready};
                    end
                    3'b001: begin
                        next_pr_data = {6'b0, overrun_error, framing_error};
                    end
                    3'b010: begin
                        next_pr_data = bit_period[7:0];
                    end
                    3'b011: begin
                        next_pr_data = {2'b0, bit_period[13:8]};
                    end
                    3'b100: begin
                        next_pr_data = {4'b0, data_size};
                    end
                    3'b110: begin
                        data_read = 1;
                        if (data_size == 4'd8) begin
                            next_pr_data = rx_data; //size =  8
                        end
                        else if (data_size == 4'd7) begin
                            next_pr_data ={1'b0, rx_data[7:1]};
                        end
                        else begin
                            next_pr_data ={3'b0, rx_data[7:3]}; //size = 5
                        end
                    end
                    default: pslverr = 1;
                endcase
            end
        end
    end
    


    // always_comb begin
    //     if(write_select == 3'b010) begin
    //         next_bit_period[7:0] = pwdata;
    //     end
    //     else begin
    //         next_bit_period[7:0] = bit_period[7:0];
    //     end

    //     if(write_select == 3'b011) begin
    //         next_bit_period[13:8] = pwdata[5:0];
    //     end
    //     else begin
    //         next_bit_period[13:8] = bit_period[13:8];
    //     end

    //     if(write_select == 3'b100) begin
    //         next_data_size = pwdata[3:0];
    //     end
    //     else begin
    //         next_data_size = data_size;
    //     end
    // end

    // always_comb begin
    //     case(read_select)
    //         3'b000: begin
    //             next_pr_data = {7'b0, next_data_ready};
    //         end
    //         3'b001: begin
    //             next_pr_data = {6'b0, overrun_error, framing_error};
    //         end
    //         3'b010: begin
    //             next_pr_data = next_bit_period[7:0];
    //         end
    //         3'b011: begin
    //             next_pr_data = {2'b0, next_bit_period[13:8]};
    //         end
    //         3'b100: begin
    //             next_pr_data = {4'b0, data_size};
    //         end
    //         3'b110: begin
    //             next_pr_data = next_rx_data;
    //         end
    //     endcase
    // end

endmodule