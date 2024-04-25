// $Id: $
// File name:   ahb_slave.sv
// Created:     4/12/2024
// Author:      Kai Ze Ee
// Lab Section: 337-16
// Version:     1.0  Initial Design Entry

/**
To do list: 
* check what needs to be done with hready signal? since I am not stalling, can I ignore it?
* handle output logic for error, when writint to read etc, refer to the commetns
* handle tx and flush control signals. verify your method of clearing them
* hsize issue, can throw error if transfer size of 3bytes
* make sure the buffer occupancy val is correct, check with Andy
* check reg12 read logic

when TX is in EOP state, make some flag high and pass it to me to use in add 13
*/

module ahb_lite_slave
(
    //inputs
	input logic clk, 
    input logic n_rst, 
    //slave side
    input logic hsel, hwrite, 
    input logic [1:0] hsize, htrans,
    input logic [3:0] haddr, 
    input logic [31:0] hwdata,
    //rx inputs
    input logic [2:0] rx_packet,
    input logic rx_data_ready, rx_transfer_active, rx_error,
    //tx inputs
    input logic tx_transfer_active, tx_error,
    //data buffer inputs
    input logic [5:0] buffer_occupancy,
    input logic [31:0] rx_data,

    //outputs
    //slave side 
    output logic [31:0] hrdata,
    output logic hresp, //hready //would it always be one?
    output logic [1:0] hsize_out,
    //to tx
    output logic [2:0] tx_packet,
    //to data buffer
    output logic get_rx_data, store_tx_data, clear, 
    output logic [31:0] tx_data,
    //top out
    output logic d_mode //what is this?
);

//__________________________________registers for all input values used in conditions______________________________________________________
//(for hwdata, we use the current as this implementation builds around curr of hwdata)
//slave side
logic reg_hsel, reg_hwrite;
logic [1:0] reg_hsize, reg_htrans;
logic [3:0] reg_haddr;
logic [31:0] reg_hwdata;

//___________________next inputs__________________________
//rx inputs
logic [2:0] reg_rx_packet;
logic reg_rx_data_ready, reg_rx_transfer_active, reg_rx_error;
//tx inputs
logic reg_tx_transfer_active, reg_tx_error;
//data buffer
logic [5:0] reg_buffer_occupancy;
logic [31:0] reg_rx_data;

//____________________________________next state output signals_____________________________________________
//slaveside
logic [31:0] next_hrdata;
//tx
logic [2:0] next_tx_packet;
//data buffer
logic next_get_rx_data, next_store_tx_data, next_clear; 
logic [31:0] next_tx_data;
//top out
logic next_d_mode;

// for PID packet decoder logic
logic [3:0] rx_pid_status;
logic [3:0] reg_rx_pid_status;
logic [1:0] hsize_1;

always_ff @(posedge clk, negedge n_rst)begin
    if (n_rst == 0)begin
        //regs      
        reg_hsel <= '0;
        reg_hwrite <= '0;
        reg_hsize <= '0;
        reg_htrans <= '0;
        reg_haddr <= '0;
        reg_hwdata <= '0;

        reg_rx_packet <= '0;
        reg_rx_data_ready <= '0;
        reg_rx_transfer_active <= '0; 
        reg_rx_error <= '0;

        reg_tx_transfer_active <= '0;
        reg_tx_error <= '0;

        reg_buffer_occupancy <= '0;
        reg_rx_data <= '0;

        reg_rx_pid_status <= '0;
        //next state
        hrdata <= '0;

        tx_packet <= '0;

        get_rx_data <= '0; 
        store_tx_data <= '0; 
        clear <= '0; 

        //x_data <= '0;

        d_mode <= '0;
        hsize_out <= '0;
        hsize_1 <= '0;
    end

    else begin
        reg_hsel <= hsel;
        reg_hwrite <= hwrite;
        reg_hsize <= hsize;
        reg_htrans <= htrans;
        reg_haddr <= haddr;
        reg_hwdata <= hwdata;

        //fix the reg vs next. 
        //reg should only be used to register

        reg_rx_packet <= rx_packet;
        reg_rx_data_ready <= rx_data_ready;
        reg_rx_transfer_active <= rx_transfer_active; 
        reg_rx_error <= rx_error;

        reg_tx_transfer_active <= tx_transfer_active;
        reg_tx_error <= tx_error;

        reg_buffer_occupancy <= buffer_occupancy;
        reg_rx_data <= rx_data; 

        reg_rx_pid_status <= rx_pid_status;

        //next state
        hrdata <= next_hrdata;

        tx_packet <= next_tx_packet;

        get_rx_data <= next_get_rx_data; 
        store_tx_data <= next_store_tx_data; //handle me, must be cleared after packet sent (based on what signal)
        clear <= next_clear; //handle me, after one cycle, it needs to be reset

        tx_data <= next_tx_data;

        d_mode <= next_d_mode;
        hsize_1 <= hsize;
        hsize_out <= hsize_1;      
    end
end

always_comb begin
    //initializations
    // hsize_o = hsize;

    next_hrdata = 0; //you dont want to hold the state, right?


    //these other signals shld be inits to 0, bc you dont want to hold it, you want to rewrite it
    //if you hold and change the tranfer size form large to small, it will be messed up
    next_tx_packet = '0;

    next_get_rx_data = 0; 
    next_store_tx_data = 0; 
    next_clear = clear; //0 unless tkaing pulse from CPU

    next_tx_data = tx_data;

    next_d_mode = d_mode; 

    hresp = 0;

    rx_pid_status = '0;

    //rx PID decode for Status Reg
    case (rx_packet)
    3'b010: rx_pid_status[0] = 1'b1;
    3'b001: rx_pid_status[1] = 1'b1;
    3'b101: rx_pid_status[2] = 1'b1;
    3'b110: rx_pid_status[3] = 1'b1;
    endcase

    //________________________________________write operations_______________________________
    if (reg_hsel) begin
        if (reg_hwrite)begin
            if(reg_hsize == 3)begin //full size transfer
                case (reg_haddr)
                    //Data Buffer Reg
                    0: next_tx_data = hwdata;
                    1: next_tx_data = hwdata;
                    2: next_tx_data = hwdata;
                    3: next_tx_data = hwdata;
                    //4-5(Status Reg) 6-7(TX RX Error Reg) 8(Buff Occupancy) -- read only
                    //9-11 Empty
                    //TX Packet Control Reg
                    12: begin
                        if (hwdata == 'd1)begin
                            next_store_tx_data = hwdata;
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd2)begin
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd3)begin
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd4)begin
                            next_tx_packet = hwdata;
                        end
                    end
                    //Flush Buffer Control Reg
                    13: next_clear = hwdata[0]; //must clear when buff clear?
                endcase
            end
            else if(reg_hsize == 2)begin
                case (reg_haddr)
                    //Data Buffer Reg
                    0: next_tx_data[15:0]= hwdata[15:0];
                    1: next_tx_data[15:0] = hwdata[15:0];
                    2: next_tx_data[31:16] = hwdata[15:0];
                    3: next_tx_data[31:16] = hwdata[15:0];
                    //TX Packet Control Reg
                    12: begin
                        if (hwdata == 'd1)begin
                            next_store_tx_data = '1;
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd2)begin
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd3)begin
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd4)begin
                            next_tx_packet = hwdata;
                        end
                    end
                    //Flush Buffer Control Reg
                    13: next_clear = hwdata[0];
                endcase
            end
            else if(reg_hsize == 1)begin //1byte of 8bit
                case (reg_haddr)
                    //Data Buffer Reg
                    0: next_tx_data[7:0] = hwdata[7:0];
                    1: next_tx_data[15:8] = hwdata[7:0];
                    2: next_tx_data[23:16] = hwdata[7:0];
                    3: next_tx_data [31:24]= hwdata[7:0];
                    //TX Packet Control Reg
                    12: begin
                        if (hwdata == 'd1)begin
                            next_store_tx_data = '1;
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd2)begin
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd3)begin
                            next_tx_packet = hwdata;
                        end
                        if (hwdata == 'd4)begin
                            next_tx_packet = hwdata;
                        end
                    end
                    //Flush Buffer Control Reg
                    13: begin
                        next_clear = hwdata[0]; 
                    end
                endcase
            end
        end
    end

    //__________________________________________read operations___________________________________
    if (hsel)begin
        if(!hwrite)begin
            //_________________rawhzrd operation______________________________
            if ((reg_haddr == haddr) && (reg_hwrite == 1))begin //raw hazard case
                if(hsize == 3)begin //full size transfer
                    case (haddr)
                        //Data Buffer Register
                        4'd0: next_hrdata = hwdata;
                        4'd1: next_hrdata = hwdata; 
                        4'd2: next_hrdata = hwdata;
                        4'd3: next_hrdata = hwdata;
                        // //Status Register
                        // 4'd4: next_hrdata = {22'b0, reg_tx_transfer_active, reg_rx_transfer_active, 3'b0, reg_rx_pid_status, reg_rx_data_ready};
                        // 4'd5: next_hrdata = {22'b0, reg_tx_transfer_active, reg_rx_transfer_active, 3'b0, reg_rx_pid_status, reg_rx_data_ready};
                        // //Error Register
                        // 4'd6: next_hrdata = {24'b0, reg_tx_error, 6'b0, reg_rx_error};
                        // 4'd7: next_hrdata = {24'b0, reg_tx_error, 6'b0, reg_rx_error};
                        // //Buffer Occupancy Register
                        // 4'd8: next_hrdata = {25'b0, reg_buffer_occupancy}; //make sure that this is in bytes?
                        //TX Packet Control Register
                        4'd12: next_hrdata = hwdata; //because refer to the write above, just polling what is on hwdata
                        4'd13: next_hrdata = hwdata; //might have to reg this too
                    endcase
                end
                else if(hsize == 2)begin //2byte of 16bit
                    case (haddr)
                        //Data Buffer Register
                        0: next_hrdata[15:0] = hwdata[15:0];
                        1: next_hrdata[15:0] = hwdata[31:16]; 
                        2: next_hrdata[15:0] = hwdata[15:0];
                        3: next_hrdata[15:0] = hwdata[31:16];
                        //Status Register
                        // 4: next_hrdata[15:0] = {6'b0, reg_tx_transfer_active, reg_rx_transfer_active, 3'b0, reg_rx_pid_status, reg_rx_data_ready};
                        // 5: next_hrdata[15:0] = {6'b0, reg_tx_transfer_active, reg_rx_transfer_active, 3'b0, reg_rx_pid_status, reg_rx_data_ready};
                        // //Error Register
                        // 6: next_hrdata = {8'b0, reg_tx_error, 6'b0, reg_rx_error};
                        // 7: next_hrdata = {8'b0, reg_tx_error, 6'b0, reg_rx_error};
                        // //Buffer Occupancy Register
                        // 8: next_hrdata = {9'b0, reg_buffer_occupancy}; //make sure that this is in bytes?
                        //TX Packet Control Register
                        12: next_hrdata = hwdata; //because refer to the write above, just polling what is on hwdata
                        13: next_hrdata = hwdata;
                    endcase
                end
                else if(hsize == 1)begin //1byte of 8bit
                    case (haddr)
                        //Data Buffer Register
                        0: next_hrdata[7:0] = hwdata[7:0];
                        1: next_hrdata[7:0] = hwdata[15:8];
                        2: next_hrdata[7:0] = hwdata[23:16];
                        3: next_hrdata[7:0] = hwdata[31:24]; 
                        //Status Register
                        // 4: next_hrdata[7:0] = {reg_rx_transfer_active, 3'b0, reg_rx_pid_status, reg_rx_data_ready};
                        // 5: next_hrdata[7:0] = {6'b0, reg_tx_transfer_active};
                        // //Error Register
                        // 6: next_hrdata[7:0] = {reg_tx_error, 6'b0, reg_rx_error};
                        // 7: next_hrdata[7:0] = {8'b0};
                        // //Buffer Occupancy Register
                        // 8: next_hrdata[7:0] = {1'b0, reg_buffer_occupancy}; //make sure that this is in bytes?
                        //TX Packet Control Register
                        12: next_hrdata = hwdata; //because refer to the write above, just polling what is on hwdata
                        13: next_hrdata = hwdata;
                    endcase
                end
            end
            //_____________________normal operation_________________________
            else begin 
                if(hsize == 3)begin //full size transfer
                case (haddr)
                    //Data Buffer Register
                    0: next_hrdata = rx_data; 
                    1: next_hrdata = rx_data;
                    2: next_hrdata = rx_data;
                    3: next_hrdata = rx_data;
                    //Status Register
                    4: next_hrdata = {22'b0, tx_transfer_active, rx_transfer_active, 3'b0, rx_pid_status, rx_data_ready};
                    5: next_hrdata = {22'b0, tx_transfer_active, rx_transfer_active, 3'b0, rx_pid_status, rx_data_ready};
                    //Error Register
                    6: next_hrdata = {24'b0, tx_error, 6'b0, rx_error};
                    7: next_hrdata = {24'b0, tx_error, 6'b0, rx_error};
                    //Buffer Occupancy Register
                    8: next_hrdata = {26'b0, buffer_occupancy}; //make sure that this is in bytes?
                    //TX Packet Control Register
                    12: next_hrdata = tx_packet; //because refer to the write above, just polling what is on hwdata
                    13: next_hrdata = clear;
                endcase
                end
                if(hsize == 2)begin //2byte of 16bit
                    case (haddr)
                        //Data Buffer Register
                        0: next_hrdata[15:0] = rx_data[15:0];
                        1: next_hrdata[15:0] = rx_data[31:16]; 
                        2: next_hrdata[15:0] = rx_data[15:0];
                        3: next_hrdata[15:0] = rx_data[31:16];
                        //Status Register
                        4: next_hrdata[15:0] = {6'b0, tx_transfer_active, rx_transfer_active, 3'b0, rx_pid_status, rx_data_ready};
                        5: next_hrdata[15:0] = {6'b0, tx_transfer_active, rx_transfer_active, 3'b0, rx_pid_status, rx_data_ready};
                        //Error Register
                        6: next_hrdata = {8'b0, tx_error, 6'b0, rx_error};
                        7: next_hrdata = {8'b0, tx_error, 6'b0, rx_error};
                        //Buffer Occupancy Register
                        8: next_hrdata = {10'b0, buffer_occupancy}; //make sure that this is in bytes?
                        //TX Packet Control Register
                        12: next_hrdata = tx_packet; //because refer to the write above, just polling what is on hwdata
                        13: next_hrdata = clear;
                    endcase
                end
                if(hsize == 1)begin //1byte of 8bit
                    case (haddr)
                        //Data Buffer Register
                        0: next_hrdata[7:0] = rx_data[7:0];
                        1: next_hrdata[7:0] = rx_data[15:8];
                        2: next_hrdata[7:0] = rx_data[23:16];
                        3: next_hrdata[7:0] = rx_data[31:24]; 
                        //Status Register
                        4: next_hrdata[7:0] = {rx_transfer_active, 3'b0, rx_pid_status, rx_data_ready};
                        5: next_hrdata[7:0] = {6'b0, tx_transfer_active};
                        //Error Register
                        6: next_hrdata[7:0] = {tx_error, 6'b0, rx_error};
                        7: next_hrdata[7:0] = {8'b0};
                        //Buffer Occupancy Register
                        8: next_hrdata[7:0] = {2'b0, buffer_occupancy}; //make sure that this is in bytes?
                        //TX Packet Control Register
                        12: next_hrdata = tx_packet; //because refer to the write above, just polling what is on hwdata
                        13: next_hrdata = clear;
                    endcase
                end
            end
        end
    end

    //______________________________________output logic____________________

    //enable signal for TX test (not needed with the TX control register)
    // if (reg_hwrite && ((reg_haddr==0)||(reg_haddr==1)||(reg_haddr == 2)||(reg_haddr == 3)))begin
    //     next_store_tx_data = 1;
    // end

    //enable signal for RX test
    if (!hwrite && ((haddr==0)||(haddr==1)||(haddr == 2)||(haddr == 3)) && rx_data_ready)begin
        next_get_rx_data = 1;
    end

    //error handling when writing to read only addr
    if ((haddr>=4 && haddr<=8) && hwrite)begin
        hresp = 1;
    end

    if (haddr < 0 || haddr > 13)begin // not between 0 and 13
        hresp = 1;
    end

    if (haddr == 9 || haddr == 10 || haddr == 11)begin // void addresses
        hresp = 1;
    end


    //if txactive 
    // if(reg_tx_transfer_active == !tx_transfer_active)begin //negedge detection high to low
    //     next_tx_packet = 0;
    // end

end
endmodule

