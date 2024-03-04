// $Id: $
// File name:   rcu.sv
// Created:     2/7/2024
// Author:      Junze Li
// Lab Section: 337-016
// Version:     1.0  Initial Design Entry
module rcu(
    input logic clk, n_rst, 
                new_packet_detected, packet_done, 
                framing_error,
    output logic sbc_clear, sbc_enable, load_buffer, enable_timer
);

    typedef enum logic [2:0] {idle, timer, ready_to_check_stop_bit, check_framing_error, load_data_buffer, clear_error} state_type;
    state_type curr_state, next_state;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            curr_state <= idle;          
        end
        else begin
            curr_state <= next_state;
        end
    end

    // always_comb begin
    //     next_state = curr_state;
    //     case(next_state)
    //         idle:
    //             if(new_packet_detected) begin
    //                 next_state = clear_error;
    //             end
    //         clear_error: begin
    //             next_state = timer;
    //         end
    //         timer:
    //             if(packet_done) begin
    //                 next_state = ready_to_check_stop_bit;
    //             end
    //         ready_to_check_stop_bit: begin
    //             next_state = check_framing_error;
    //         end
    //         check_framing_error:
    //             if(framing_error) begin
    //                 next_state = idle;
    //             end
    //             else begin
    //                 next_state = load_data_buffer;
    //             end
    //         load_data_buffer:begin
    //             next_state = idle;      
    //         end                      
    //     endcase       
    // end

    always_comb begin
        sbc_clear = 0;
        sbc_enable = 0;
        load_buffer = 0;
        enable_timer = 0;
        next_state = curr_state;
        case(curr_state)
            idle: begin
                if(new_packet_detected) begin
                    next_state = clear_error;
                end
            end

            clear_error: begin
                sbc_clear = 1;

                next_state = timer;
            end

            timer: begin
                enable_timer = 1;

                if (packet_done) begin
                    next_state = ready_to_check_stop_bit;
                end
            end

            ready_to_check_stop_bit: begin
                sbc_enable = 1;
                next_state = check_framing_error;
            end

            check_framing_error: begin
                if (framing_error) begin
                    next_state = idle;
                end else begin
                    next_state = load_data_buffer;
                end
            end

            load_data_buffer: begin
                load_buffer = 1;
                next_state = idle;
            end
        endcase
    end            
    

endmodule