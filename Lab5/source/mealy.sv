// $Id: $
// File name:   mealy.sv
// Created:     2/6/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module mealy(
    input logic clk, n_rst, i,
    output logic o
);

    typedef enum logic [2:0] {WAITING, A, B, C} state_type;
    state_type curr_state, next_state;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            curr_state <= WAITING;
        end
        else begin
            curr_state <= next_state;
        end
    end

    always_comb begin 
        next_state = curr_state;
        case(curr_state)
            WAITING:
                if(i == 1) begin
                    next_state = A;
                end
            A:
                if(i == 1) begin
                    next_state = B;
                end
                else begin
                    next_state = WAITING;
                end
            B:
                if(i == 0) begin
                    next_state = C;
                end
            C:
                if(i == 1) begin
                    next_state = A;
                end
                else begin
                    next_state = WAITING;
                end
        endcase           
    end

    assign o = ((curr_state == C) && (i==1));
endmodule