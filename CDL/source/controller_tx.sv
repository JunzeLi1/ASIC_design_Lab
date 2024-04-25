// $Id: $
// File name:   controller_tx.sv
// Created:     4/10/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module controller_tx (
    input logic [2:0] tx_packet, 
    input logic byte_complete, clk, n_rst,
    input logic bits8, bits54, bits51,// new defined 
    input logic [5:0] buffer_occupancy,
    output logic enable_timer, send_EOP, enable_pts, tx_transfer_active, tx_error, get_tx_packet_data,
    output logic [1:0] send_data,
    output logic enable_timer_bits8,
    output logic enable_timer_bits54,
    output logic enable_timer_bits52,
    output logic enable_timer_bits51//new defined
);

    typedef enum logic [4:0] {IDLE, SYNC1, SYNC2, PID, DISABLE_EN1, DISABLE_EN2, EOP1, EOP2, DISABLE_EN3, DISABLE_EN4, DISABLE_EN5, DATA, PID1, 
                            WAIT1, WAIT2, WAIT3, WAIT4, PTS, PTS1, PTS2, PTS3, GET1, GET2, ERROR} state_type;
    state_type curr_state, next_state;

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
        enable_timer = 0;
        send_EOP = 0;
        enable_pts = 0;
        tx_transfer_active = 0;
        tx_error = 0;
        send_data = '0;
        get_tx_packet_data = 0;
        enable_timer_bits8 = 0;
        enable_timer_bits54 = 0;
        enable_timer_bits52 = 0; 
        enable_timer_bits51 = 0;// new added
        case(curr_state)
            IDLE: begin
                if(tx_packet == 2 || tx_packet == 3 || tx_packet == 4) begin
                    next_state = SYNC1;
                end
                else if(tx_packet == 1) begin
                    next_state = SYNC2;               
                end
            end

            SYNC1: begin
                send_data = 2'b1;
                enable_timer = 1;
                enable_pts = 1;
                tx_transfer_active = 1;
                enable_timer_bits8 = 1;
                next_state = DISABLE_EN1;
            end

            DISABLE_EN1: begin
                enable_timer = 1;
                send_data = 2'd1;
                tx_transfer_active = 1;
                enable_timer_bits8 = 1;
                if(bits8) begin
                    next_state = WAIT4;
                end
            end

            WAIT4: begin
                enable_timer = 1;
                enable_timer_bits54 = 1;
                tx_transfer_active = 1;
                if(bits54) begin
                    next_state = PTS3;
                    enable_pts = 1;
                    send_data = 2'd2;
                end
            end

            PTS3: begin
                enable_timer = 1;
                send_data = 2'd2;
                tx_transfer_active = 1;
                if(byte_complete) begin
                    next_state = PID;
                end
            end

            PID: begin
                send_data = 2'd2;
                enable_timer_bits8 = 1;
                enable_timer = 1;
                tx_transfer_active = 1;
                next_state = DISABLE_EN2;
            end

            DISABLE_EN2: begin
                enable_timer = 1;
                tx_transfer_active = 1;
                enable_timer_bits8 = 1;
                if(bits8) begin
                    next_state = WAIT3;
                end
            end

            EOP1: begin
                send_EOP = 1;
                tx_transfer_active = 1;
                next_state = IDLE;
            end 

            EOP2: begin
                tx_transfer_active = 1;
                next_state = IDLE;
            end

            SYNC2: begin
                send_data = 2'd1;
                enable_timer = 1;
                enable_pts = 1;
                tx_transfer_active = 1;
                enable_timer_bits8 = 1; //newly added
                // new definedsim:/tb_usb_tx/DUT/SHIFT_REG/SR8/serial_out

                next_state = DISABLE_EN3;
            end

            DISABLE_EN3: begin
                enable_timer = 1;
                send_data = 2'd1;
                tx_transfer_active = 1;
                enable_timer_bits8 = 1;
                if(bits8) begin
                    next_state = WAIT1;
                end
            end

            WAIT1: begin
                enable_timer = 1;
                enable_timer_bits54 = 1;
                tx_transfer_active = 1;
                if(bits54) begin
                    next_state = PTS;
                    enable_pts = 1;
                    send_data = 2'd2;
                end
            end

            PTS: begin
                enable_timer = 1;
                send_data = 2'd2;
                tx_transfer_active = 1;
                if(byte_complete) begin
                    next_state = PID1;
                end
            end

            PID1: begin
                send_data = 2'd2;
                enable_timer_bits8 = 1; //new defined
                tx_transfer_active = 1;
                next_state = DISABLE_EN4;
                enable_timer = 1;
            end

            DISABLE_EN4: begin
                enable_timer = 1;
                tx_transfer_active = 1;
                //get_tx_packet_data = 1;
                enable_timer_bits8 = 1;
                if(bits8) begin
                    next_state = WAIT2;
                end
            end

            WAIT2: begin
                enable_timer = 1;
                enable_timer_bits52 = 1;
                enable_timer_bits51 = 1;
                tx_transfer_active = 1;
                if(bits51) begin
                    next_state = GET1;
                    get_tx_packet_data = 1;
                end
            end

            GET1: begin
                enable_timer = 1;
                tx_transfer_active = 1;
                if(bits54) begin
                    next_state = PTS1;
                    enable_pts = 1;
                    send_data = 2'd3;
                end
            end

            PTS1: begin
                enable_timer = 1;
                send_data = 2'd3;
                tx_transfer_active = 1;
                if(byte_complete) begin
                    next_state = DATA;
                end
            end

            DATA: begin
                send_data = 2'd3;
                tx_transfer_active = 1;
                enable_timer_bits8 = 1;
                if(buffer_occupancy == 0) begin
                    next_state = ERROR;
                end
                next_state = DISABLE_EN5;
                enable_timer = 1;
            end
            
            DISABLE_EN5: begin
                enable_timer = 1;
                tx_transfer_active = 1;
                enable_timer_bits8 = 1;
                if(bits8) begin
                    next_state = WAIT3;
                end
            end

            WAIT3: begin
                enable_timer = 1;
                enable_timer_bits52 = 1;
                tx_transfer_active = 1;
                enable_timer_bits51 = 1;
                if(bits51) begin
                    next_state = GET2;
                    get_tx_packet_data = 1;
                end
            end

            GET2: begin
                enable_timer = 1;
                tx_transfer_active = 1;
                if(bits54) begin
                    enable_pts = 1;
                    next_state = PTS2;
                    send_data = 2'd3;
                end
            end

            PTS2: begin
                enable_timer = 1;
                tx_transfer_active = 1;            
                if(byte_complete) begin
                    if(buffer_occupancy == 0) begin
                        send_EOP = 1;
                        next_state = EOP1;
                    end
                    else begin
                        send_data = 2'd3;
                        next_state = DATA;
                    end
                end
            end

            ERROR: begin
                tx_error = 1;
                next_state = IDLE;
            end
        
        endcase
    end
    
endmodule