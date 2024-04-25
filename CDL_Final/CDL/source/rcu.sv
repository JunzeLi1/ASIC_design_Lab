// $Id: $
// File name:   rcu.sv
// Created:     4/10/2024
// Author:      Hunter McCollough
// Lab Section: 337-019
// Version:     1.0  Initial Design Entry
// Description: receiver control unit

module rcu (
    input logic clk, n_rst, d_edge, eop, shift_enable, byte_received, buff_full,
    input logic [5:0] buffer_occupancy,
    input logic [7:0] data, 
    output logic rcving, w_enable, r_error, flush, data_en, buff_clear, data_ready,
    output logic [2:0] pid
);
    localparam SYNC_BYTE = 8'b10000000;

    typedef enum logic [4:0] { IDLE, EIDLE, SYNC, PID_CHK, DATA_RCV, DATA_LOAD, LOAD_WAIT, BUFF_CLEAR, INC_PCKT, ERR, EOP_WAIT, EEOP_WAIT, ADDR_CHK, ENDP1, ENDP2, ENDP_CHK, CRC_RCV, DATA_READY, PRE_EOP_WAIT } states;

    states state, nxt_state;

    logic nxt_w_enable, nxt_r_error, nxt_flush, nxt_data_en, nxt_buff_clear, nxt_data_ready;
    logic [2:0] nxt_pid;
    
    always_ff @( posedge clk, negedge n_rst ) begin
        if(!n_rst) begin
            state <= IDLE;
            w_enable <= 0;
            r_error <= 0;
            flush <= 0;
            data_en <= 0;
            buff_clear <= 0;
            data_ready <= 0;
            pid <= 3'b0;
        end
        else begin
            state <= nxt_state;
            w_enable <= nxt_w_enable;
            r_error <= nxt_r_error;
            flush <= nxt_flush;
            data_en <= nxt_data_en;
            buff_clear <= nxt_buff_clear;
            data_ready <= nxt_data_ready;
            pid <= nxt_pid;
        end
    end

    // Next State Logic
    always_comb begin
        nxt_state = state;
        case(state) 
            IDLE: if(d_edge) nxt_state = SYNC;
            EIDLE: if(d_edge) nxt_state = SYNC;
            SYNC: begin
                if((eop && shift_enable)) nxt_state = EOP_WAIT;
                else if((data == SYNC_BYTE) && byte_received) nxt_state = PID_CHK;
                else if((data != SYNC_BYTE) && byte_received) nxt_state = ERR;
            end
            PID_CHK: begin
                if(byte_received) begin
                    if((data[3:0] == 4'b0011) || (data[3:0] == 4'b1011)) nxt_state = DATA_RCV;
                    else if((data[3:0] == 4'b0001) || (data[3:0] == 4'b1001)) nxt_state = ADDR_CHK;
                    else if((data[3:0] == 4'b0010) || (data[3:0] == 4'b1010) || (data[3:0] == 4'b1110)) nxt_state = PRE_EOP_WAIT;
                    else nxt_state = ERR;
                end
            end
            DATA_RCV:begin
                if(eop && byte_received) nxt_state = DATA_LOAD;
                else if(eop && shift_enable) nxt_state = INC_PCKT;
                else if(buff_full) nxt_state = DATA_LOAD;
            end
            DATA_LOAD: begin
                if(eop && shift_enable) nxt_state = EOP_WAIT;
                else nxt_state = LOAD_WAIT;
            end
            LOAD_WAIT: if(shift_enable) nxt_state = BUFF_CLEAR;
            BUFF_CLEAR: begin
                if(eop) nxt_state = EOP_WAIT;
                else if(shift_enable) nxt_state = DATA_RCV;
            end
            INC_PCKT: if(eop && shift_enable) nxt_state = EIDLE;
            ERR: if(eop && shift_enable) nxt_state = EEOP_WAIT;
            PRE_EOP_WAIT: begin
                if(!eop && shift_enable) nxt_state = ERR;
                else if(eop && shift_enable) nxt_state = EOP_WAIT;
            end
            EOP_WAIT: begin
                if(!eop && shift_enable) nxt_state = ERR;
                else if(eop && shift_enable) nxt_state = DATA_READY;
            end
            EEOP_WAIT: begin
                if(!eop && shift_enable) nxt_state = ERR;
                else if(eop && shift_enable) nxt_state = EIDLE;
            end
            ADDR_CHK: begin
                if(byte_received && (data == 8'b0)) nxt_state = ENDP1;
                else if(byte_received && !(data == 8'b0)) nxt_state = ERR;
            end
            ENDP1: if(shift_enable) nxt_state = ENDP2;
            ENDP2: if(shift_enable) nxt_state = ENDP_CHK;
            ENDP_CHK: begin
                if(shift_enable) begin
                    if((data[7:5] == 3'b0)) nxt_state = CRC_RCV;
                    else nxt_state = ERR;
                end 
            end
            CRC_RCV: if(eop && shift_enable) nxt_state = EOP_WAIT;
            DATA_READY: nxt_state = IDLE;
        endcase
    end

    // Output Logic
    always_comb begin
        nxt_data_en = 1'b0;
        nxt_buff_clear = 1'b0;
        nxt_data_ready = 1'b0;
        nxt_pid = pid;
        rcving = 1'b1;
        nxt_w_enable = w_enable;
        nxt_r_error = r_error;
        nxt_flush = flush;
        case(state)
            IDLE: begin
                rcving = 1'b0;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b0;
                nxt_flush = 1'b0;
                nxt_pid = 3'b0;
            end
            EIDLE: begin
                rcving = 1'b0;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b1;
                nxt_flush = 1'b0;
                nxt_pid = 3'b0;
            end
            SYNC: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b0;
                nxt_flush = 1'b1;
                nxt_pid = 3'b0;
            end
            PID_CHK: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b0;
                nxt_flush = 1'b0;
                if(byte_received) begin
                    case(data[3:0])
                        4'b0001: nxt_pid = 3'b001;
                        4'b1001: nxt_pid = 3'b010;
                        4'b0011: nxt_pid = 3'b011;
                        4'b1011: nxt_pid = 3'b100;
                        4'b0010: nxt_pid = 3'b101;
                        4'b1010: nxt_pid = 3'b110;
                        4'b1110: nxt_pid = 3'b111;
                        default: nxt_pid = 3'b000;
                    endcase
                end
            end
            DATA_RCV: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b0;
                nxt_flush = 1'b0;
                nxt_pid = pid;
                nxt_data_en = 1'b1;
            end
            DATA_LOAD: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b1;
                nxt_r_error = 1'b0;
                nxt_flush = 1'b0;
                nxt_pid = pid;
                nxt_data_en = 1'b1;
            end
            LOAD_WAIT: nxt_w_enable = 1'b0;
            BUFF_CLEAR: nxt_buff_clear = 1'b1;
            ERR: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b1;
                nxt_flush = 1'b0;
                nxt_pid = pid;
            end
            INC_PCKT: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b1;
                nxt_r_error = 1'b1;
                nxt_flush = 1'b0;
                nxt_pid = pid;
            end
            EOP_WAIT: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b0;
                nxt_flush = 1'b0;
                nxt_pid = pid;
            end
            EEOP_WAIT: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b1;
                nxt_flush = 1'b0;
                nxt_pid = pid;
            end
            CRC_RCV: begin
                rcving = 1'b1;
                nxt_w_enable = 1'b0;
                nxt_r_error = 1'b0;
                nxt_flush = 1'b0;
                nxt_pid = pid;
            end
            DATA_READY: nxt_data_ready = 1'b1;
        endcase
    end

endmodule