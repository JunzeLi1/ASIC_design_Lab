onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top/tb_test_case
add wave -noupdate /tb_top/tb_test_case_num
add wave -noupdate /tb_top/DUT/RX/clk
add wave -noupdate /tb_top/DUT/RX/n_rst
add wave -noupdate -divider TX
add wave -noupdate /tb_top/DUT/TX/clk
add wave -noupdate /tb_top/DUT/TX/clk12
add wave -noupdate /tb_top/DUT/TX/bits8
add wave -noupdate /tb_top/DUT/TX/bits51
add wave -noupdate /tb_top/DUT/TX/bits54
add wave -noupdate /tb_top/DUT/TX/buffer_occupancy
add wave -noupdate /tb_top/DUT/TX/byte_complete
add wave -noupdate -color Cyan /tb_top/DUT/TX/dminus_out
add wave -noupdate -color Cyan /tb_top/DUT/TX/dplus_out
add wave -noupdate /tb_top/DUT/TX/enable_pts
add wave -noupdate /tb_top/DUT/TX/enable_timer
add wave -noupdate /tb_top/DUT/TX/enable_timer_bits8
add wave -noupdate /tb_top/DUT/TX/enable_timer_bits51
add wave -noupdate /tb_top/DUT/TX/enable_timer_bits52
add wave -noupdate /tb_top/DUT/TX/enable_timer_bits54
add wave -noupdate /tb_top/DUT/TX/get_tx_packet_data
add wave -noupdate /tb_top/DUT/TX/n_rst
add wave -noupdate /tb_top/DUT/TX/send_data
add wave -noupdate /tb_top/DUT/TX/send_EOP
add wave -noupdate /tb_top/DUT/TX/serial_out
add wave -noupdate /tb_top/DUT/TX/tx_error
add wave -noupdate /tb_top/DUT/TX/tx_packet
add wave -noupdate /tb_top/DUT/TX/tx_packet_data
add wave -noupdate /tb_top/DUT/TX/tx_transfer_active
add wave -noupdate -divider TX_Data_Buffer
add wave -noupdate -divider TX_Controller
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/bits8
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/bits51
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/bits54
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/buffer_occupancy
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/byte_complete
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/clk
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/curr_state
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/enable_pts
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/enable_timer
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/enable_timer_bits8
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/enable_timer_bits51
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/enable_timer_bits52
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/enable_timer_bits54
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/get_tx_packet_data
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/send_data
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/send_EOP
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/tx_error
add wave -noupdate /tb_top/DUT/TX/CONTROLLER/tx_packet
add wave -noupdate -divider TX_shift_Reg
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/clk
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/clk12
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/data
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/enable_pts
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/n_rst
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/send_data
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/serial_out
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/tx_packet
add wave -noupdate /tb_top/DUT/TX/SHIFT_REG/tx_packet_data
add wave -noupdate -divider -height 25 RX
add wave -noupdate /tb_top/DUT/RX/dp_i
add wave -noupdate /tb_top/DUT/RX/dm_i
add wave -noupdate /tb_top/DUT/RX/buffer_occupancy
add wave -noupdate /tb_top/DUT/RX/w_enable
add wave -noupdate /tb_top/DUT/RX/rcving
add wave -noupdate /tb_top/DUT/RX/r_error
add wave -noupdate /tb_top/DUT/RX/flush
add wave -noupdate /tb_top/DUT/RX/data_ready
add wave -noupdate /tb_top/DUT/RX/pid
add wave -noupdate /tb_top/DUT/RX/rcv_data
add wave -noupdate /tb_top/DUT/RX/controller/state
add wave -noupdate /tb_top/DUT/RX/dp_sync
add wave -noupdate /tb_top/DUT/RX/dm_sync
add wave -noupdate /tb_top/DUT/RX/eop
add wave -noupdate /tb_top/DUT/RX/d_orig
add wave -noupdate /tb_top/DUT/RX/d_edge
add wave -noupdate /tb_top/DUT/RX/shift_enable
add wave -noupdate /tb_top/DUT/RX/byte_received
add wave -noupdate /tb_top/DUT/RX/buff_full
add wave -noupdate /tb_top/DUT/RX/data_en
add wave -noupdate /tb_top/DUT/RX/data
add wave -noupdate /tb_top/DUT/RX/buff_clear
add wave -noupdate -divider -height 25 AHB
add wave -noupdate /tb_top/DUT/BUS/hsel
add wave -noupdate /tb_top/DUT/BUS/hwrite
add wave -noupdate /tb_top/DUT/BUS/hsize
add wave -noupdate /tb_top/DUT/BUS/htrans
add wave -noupdate /tb_top/DUT/BUS/haddr
add wave -noupdate /tb_top/DUT/BUS/hwdata
add wave -noupdate /tb_top/DUT/BUS/hrdata
add wave -noupdate /tb_top/DUT/BUS/rx_packet
add wave -noupdate /tb_top/DUT/BUS/rx_data_ready
add wave -noupdate /tb_top/DUT/BUS/rx_transfer_active
add wave -noupdate /tb_top/DUT/BUS/rx_error
add wave -noupdate /tb_top/DUT/BUS/tx_transfer_active
add wave -noupdate /tb_top/DUT/BUS/tx_error
add wave -noupdate /tb_top/DUT/BUS/buffer_occupancy
add wave -noupdate /tb_top/DUT/BUS/rx_data
add wave -noupdate /tb_top/DUT/BUS/hresp
add wave -noupdate /tb_top/DUT/BUS/tx_packet
add wave -noupdate /tb_top/DUT/BUS/get_rx_data
add wave -noupdate /tb_top/DUT/BUS/store_tx_data
add wave -noupdate /tb_top/DUT/BUS/clear
add wave -noupdate /tb_top/DUT/BUS/tx_data
add wave -noupdate /tb_top/DUT/BUS/d_mode
add wave -noupdate -group Reg /tb_top/DUT/BUS/reg_hsel
add wave -noupdate -group Reg /tb_top/DUT/BUS/reg_hwrite
add wave -noupdate -group Reg /tb_top/DUT/BUS/reg_hsize
add wave -noupdate -group Reg /tb_top/DUT/BUS/reg_haddr
add wave -noupdate -group Reg /tb_top/DUT/BUS/reg_tx_transfer_active
add wave -noupdate -group Next /tb_top/DUT/BUS/next_hrdata
add wave -noupdate -divider -height 25 {RX Buffer}
add wave -noupdate /tb_top/DUT/RXDBUFF/get_rx_data
add wave -noupdate /tb_top/DUT/RXDBUFF/store_rx_packet_data
add wave -noupdate /tb_top/DUT/RXDBUFF/flush
add wave -noupdate /tb_top/DUT/RXDBUFF/rx_packet_data
add wave -noupdate /tb_top/DUT/RXDBUFF/rx_data
add wave -noupdate /tb_top/DUT/RXDBUFF/buffer_occupancy_rx
add wave -noupdate /tb_top/DUT/RXDBUFF/write_ptr
add wave -noupdate /tb_top/DUT/RXDBUFF/data_out
add wave -noupdate /tb_top/DUT/RXDBUFF/next_buffer_occupancy_rx
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35695583 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {37563947 ps}
