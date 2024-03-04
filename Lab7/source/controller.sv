// $Id: $
// File name:   controller.sv
// Created:     2/19/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module controller (
    input logic clk, n_rst, dr, lc, overflow,
    output logic cnt_up, clear, modwait, err, 
    output logic [2:0] op,
    output logic [3:0] src1, src2, dest
);
    
    typedef enum logic [4:0] {IDLE, EIDLE, STORE, ZERO, SORT1, SORT2,
                SORT3, SORT4, MUL1, ADD1, MUL2, SUB1, MUL3, ADD2, MUL4, 
                SUB2, LOAD1, LOAD2, LOAD3, LOAD4, WAIT1, WAIT2, WAIT3} state_type;
    state_type curr_state, next_state;
    logic next_modwait;
    
    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            curr_state <= IDLE;
            modwait <= 0;
        end
        else begin
            curr_state <= next_state;
            modwait <= next_modwait;
        end       
    end

    always_comb begin
        next_state = curr_state;
        cnt_up = 0;
        clear = 0;
        next_modwait = modwait;
        err = 0;
        op = '0;
        src1 = 4'd0;
        src2 = 4'd0;
        dest = 4'd0;
        clear = lc;
        case(curr_state) 
            IDLE: begin
                next_modwait = 0;
                if(dr == 1) begin
                    next_state = STORE;
                    next_modwait = 1;
                end
                else if(lc == 1) begin
                    next_state = LOAD1;
                    next_modwait = 1;
                end
                else begin
                    next_state = IDLE;
                end
            end
            
            STORE: begin
                next_modwait = 1;
                dest = 4'd5;
                op = 3'b010;
                if(dr == 0) begin
                    next_state = EIDLE;
                end
                else begin
                    next_state = ZERO;
                    cnt_up = 1;
                end
            end
            
            ZERO: begin
                next_state = SORT1;
                next_modwait = 1;
                op = 3'b101;
            end

            SORT1: begin
                next_state = SORT2;
                next_modwait = 1;
                src1 = 4'd2;
                dest = 4'd1;
                op = 3'b001;
            end

            SORT2: begin
                next_state = SORT3;
                next_modwait = 1;
                src1 = 4'd3;
                dest = 4'd2;
                op = 3'b001;
            end

            SORT3: begin
                next_state = SORT4;
                next_modwait = 1;
                src1 = 4'd4;
                dest = 4'd3;
                op = 3'b001;
            end

            SORT4: begin
                next_state = MUL1;
                next_modwait = 1;
                src1 = 4'd5;
                dest = 4'd4;
                op = 3'b001;
            end

            MUL1: begin
                next_state = ADD1;
                next_modwait = 1;
                op = 3'b110;
                src1 = 4'd1;
                src2 = 4'd6;
                dest = 4'd10;
            end

            ADD1: begin
                next_state = MUL2;
                next_modwait = 1;
                op = 3'b100;
                src1 = 4'd0;
                src2 = 4'd10;
                dest = 4'd0;
                if(overflow == 1) begin
                    next_state = EIDLE;
                    next_modwait = 0;
                end
            end

            MUL2: begin
                next_state = SUB1;
                next_modwait = 1;
                op = 3'b110;
                src1 = 4'd2;
                src2 = 4'd7;
                dest = 4'd10;
            end

            SUB1: begin
                next_state = MUL3;
                next_modwait = 1;
                op = 3'b101;
                src1 = 4'd0;
                src2 = 4'd10;
                dest = 4'd0;
                if(overflow == 1) begin
                    next_state = EIDLE;
                    next_modwait = 0;
                end
            end

            MUL3: begin
                next_state = ADD2;
                next_modwait = 1;
                op = 3'b110;
                src1 = 4'd3;
                src2 = 4'd8;
                dest = 4'd10;
            end

            ADD2: begin
                // next_state = MUL4;
                op = 3'b100;
                src1 = 4'd0;
                src2 = 4'd10;
                dest = 4'd0;
                next_modwait = 1;
                if(overflow == 1) begin
                    next_state = EIDLE;
                    next_modwait = 0;
                end
                else begin
                    next_state = MUL4;
                end
            end

            MUL4: begin
                next_state = SUB2;
                next_modwait = 1;
                op = 3'b110;
                src1 = 4'd4;
                src2 = 4'd9;
                dest = 4'd10;
            end

            SUB2: begin
                next_state = IDLE; // needed fix!!!!!!!!!!!!!!!!
                next_modwait = 0;
                op = 3'b101;
                src1 = 4'd0;
                src2 = 4'd10;
                dest = 4'd0;
                if(overflow == 1) begin
                    next_state = EIDLE;
                    next_modwait = 0;
                end
            end

            EIDLE: begin 
                err = 1;
                next_modwait = 0;
                if(dr == 1) begin
                    next_state = STORE;
                    next_modwait = 1;
                end
                else if(lc == 1) begin
                    next_state = LOAD1;
                    next_modwait = 1;
                end
                else begin
                    next_state = EIDLE;
                    next_modwait = 0;
                end
            end   

            LOAD1: begin
                err = 0;
                op = 3'b011;
                dest = 4'd6;
                clear = lc;
                next_state = WAIT1;
                next_modwait = 0;              
            end

            WAIT1: begin
                clear = lc;
                next_modwait = 0;
                if(lc == 1) begin
                    next_state = LOAD2;
                    next_modwait = 1;
                end

            end

            LOAD2: begin
                op = 3'b011;
                dest = 4'd7;
                clear = lc;
                next_state = WAIT2;
                next_modwait = 0;
            end

            WAIT2: begin
                next_modwait = 0;
                if(lc == 1) begin
                    next_state = LOAD3;
                    next_modwait = 1;
                end
                clear = lc;
            end

            LOAD3: begin
                op = 3'b011;
                dest = 4'd8;
                clear = lc;
                next_state = WAIT3;
                next_modwait = 0;
            end

            WAIT3: begin
                next_modwait = 0;
                if(lc == 1) begin
                    next_state = LOAD4;
                    next_modwait = 1;
                end
                clear = lc;
            end

            LOAD4: begin
                op = 3'b011;
                dest = 4'd9;
                clear = lc;
                next_state = IDLE;
                next_modwait = 0;
            end
        endcase
        
    end
    
endmodule