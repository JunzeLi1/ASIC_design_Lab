// $Id: $
// File name:   encoder.sv
// Created:     4/10/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module encoder (
    input logic serial_out, send_EOP, clk, n_rst, clk12, enable_pts,
    output logic D_plus, D_minus
);
    
    typedef enum logic [1:0] {IDLE, ZERO, ONE, EOP} state_type;
    state_type curr_state, next_state;

    logic clk12_sync1;
    logic clk12_sync;
    logic enable_pts1;
    // logic send_EOP1;
    // logic [63:0] shift_reg;

    // always_ff @(posedge clk, negedge n_rst) begin
    //     if (!n_rst) begin
    //         shift_reg <= 64'b0;
    //     end
    //     else begin
    //         shift_reg <= {shift_reg[62:0], send_EOP};
    //     end
    // end

    // assign send_EOP1 = shift_reg[63];

    always_ff @(posedge clk, negedge n_rst) begin 
        if(!n_rst) begin
            clk12_sync1 <= 0;
            enable_pts1 <= 0;
        end
        else begin
            clk12_sync1 <= clk12;
            enable_pts1 <= enable_pts;
        end
    end
    
    always_ff @(posedge clk, negedge n_rst) begin 
        if(!n_rst) begin
            clk12_sync <= 0;
        end
        else begin
            clk12_sync <= clk12_sync1 || enable_pts1;
        end
    end

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            curr_state <= IDLE;
        end
        else begin
            curr_state <= next_state;
        end
    end

    always_comb begin
        next_state = curr_state;
        D_minus = 0;
        D_plus = 0;
        case (curr_state)
            IDLE: begin
                D_plus = 1;
                D_minus = 0;
                if(serial_out == 0 && clk12_sync) begin
                    next_state = ZERO;
                end
                else if(serial_out == 1 && clk12_sync) begin
                    next_state = ONE;
                end
            end

            ZERO: begin
                D_plus = 0;
                D_minus = 1;
                if(send_EOP == 1) begin
                    next_state = EOP;
                end
                else if(serial_out == 0 && clk12_sync) begin
                    next_state = ONE;
                end
            end

            ONE: begin
                D_plus = 1;
                D_minus = 0;
                if(send_EOP == 1) begin
                    next_state = EOP;
                end
                else if(serial_out == 0 && clk12_sync) begin
                    next_state = ZERO;
                end
            end

            EOP: begin
                D_plus = 0;
                D_minus = 0;
                if(send_EOP == 1) begin
                    next_state = EOP;
                end
                else begin
                    next_state = IDLE;
                end
            end
            
        endcase
        
    end
endmodule