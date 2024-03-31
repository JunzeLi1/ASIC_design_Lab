// $Id: $
// File name:   coefficient_loader.sv
// Created:     3/20/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module coefficient_loader (
    input logic clk, n_reset, new_coefficient_set, modwait,
    output logic load_coeff, clear_new_coefficient,
    output logic [1:0] coefficient_num
);
    
    typedef enum logic [3:0] {IDLE, LOAD0, WAIT0, LOAD1, WAIT1, LOAD2, WAIT2, LOAD3, CLEAR} state_type;
    state_type curr_state, next_state;

    logic [1:0] next_coefficient_num;

    always_ff @(posedge clk, negedge n_reset) begin
        if(!n_reset) begin
            curr_state <= IDLE;
            coefficient_num <= 0;
        end
        else begin
            curr_state <= next_state;
            coefficient_num <= next_coefficient_num;
        end
    end

    always_comb begin
        next_state = curr_state;
        load_coeff = '0;
        next_coefficient_num = coefficient_num;
        clear_new_coefficient = '0;
        case (curr_state)
            IDLE: begin
                if(new_coefficient_set) begin
                    next_state = LOAD0;
                end
            end
            LOAD0: begin
                load_coeff = 1'd1;
                next_coefficient_num = 2'd0;
                next_state = WAIT0;
            end
            WAIT0: begin
                load_coeff = 0;
                //next_coefficient_num = 2'd0;
                if(!modwait) begin
                    next_state = LOAD1;
                end
            end
            LOAD1: begin
                load_coeff = 1;
                next_coefficient_num = 2'd1;
                next_state = WAIT1;
            end
            WAIT1: begin
                load_coeff = 0;
                //next_coefficient_num = 2'd1;
                if(!modwait) begin
                    next_state = LOAD2;
                end
            end
            LOAD2: begin
                load_coeff = 1;
                next_coefficient_num = 2'd2;
                next_state = WAIT2;
            end
            WAIT2: begin
                load_coeff = 0;
                //next_coefficient_num = 2'd2;
                if(!modwait) begin
                    next_state = LOAD3;
                end
            end
            LOAD3: begin
                load_coeff = 1;
                next_coefficient_num = 2'd3;
                next_state = CLEAR;
            end
            CLEAR: begin
                clear_new_coefficient = 1;
                next_state = IDLE;
            end
        endcase
        
    end
endmodule