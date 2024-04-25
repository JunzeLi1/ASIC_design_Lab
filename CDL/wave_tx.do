onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_get_rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_store_tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_clear
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_store_rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_flush
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_hsize
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_buffer_occupancy
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_error
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_dplus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_dminus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_D_Plus
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_D_Minus
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_tx_error
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_mismatch
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_check
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_case
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_case_num
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_data
add wave -noupdate -divider {Top level}
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/get_rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/store_tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/clear
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/store_rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/flush
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/hsize
add wave -noupdate -radix binary -childformat {{{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[5]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[4]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[3]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[2]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[1]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[0]} -radix binary}} -subitemconfig {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[5]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[4]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[3]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[2]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[1]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[0]} {-height 16 -radix binary}} /tb_usb_tx_data_buffer/DUT/buffer_occupancy
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_error
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/dplus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/dminus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/get_tx_packet_data
add wave -noupdate -divider Data_buffer_TX
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/buffer_occupancy
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/buffer_occupancy1
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/clear
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/clk
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/data_in
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/data_out
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/empty
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/full
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/get_tx_packet_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/hsize
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/mem
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/n_rst
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/next_buffer_occupancy
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/next_read_ptr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/next_tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_get_rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_store_tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_clear
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_store_rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_flush
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_hsize
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_buffer_occupancy
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_tx_error
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_dplus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_dminus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_D_Plus
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_D_Minus
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/expected_tb_tx_error
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_mismatch
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_check
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_case
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_case_num
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_data
add wave -noupdate -divider {Top level}
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/tb_test_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/get_rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/store_tx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/clear
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/store_rx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/flush
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/hsize
add wave -noupdate -radix binary -childformat {{{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[5]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[4]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[3]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[2]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[1]} -radix binary} {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[0]} -radix binary}} -subitemconfig {{/tb_usb_tx_data_buffer/DUT/buffer_occupancy[5]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[4]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[3]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[2]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[1]} {-height 16 -radix binary} {/tb_usb_tx_data_buffer/DUT/buffer_occupancy[0]} {-height 16 -radix binary}} /tb_usb_tx_data_buffer/DUT/buffer_occupancy
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_error
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/dplus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/dminus_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/rx_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/get_tx_packet_data
add wave -noupdate -divider Data_buffer_TX
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/buffer_occupancy
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/buffer_occupancy1
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/clear
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/clk
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/data_in
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/data_out
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/empty
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/full
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/get_tx_packet_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/hsize
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/mem
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/n_rst
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/next_buffer_occupancy
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/next_read_ptr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/next_tx_packet_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/next_write_ptr1
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/read_ptr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/shift_reg
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/store_tx_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/tx_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/tx_packet_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/write_addr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER/write_ptr1
add wave -noupdate -divider Data_buffer_RX
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/buffer_occupancy_rx
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/clk
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/data_in
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/data_out
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/empty
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/flush
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/full
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/get_rx_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/mem
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/n_rst
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/next_buffer_occupancy_rx
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/next_read_ptr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/next_rx_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/next_write_ptr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/read_ptr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/rx_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/rx_packet_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/store_rx_packet_data
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/write_addr
add wave -noupdate /tb_usb_tx_data_buffer/DUT/DATA_BUFFER1/write_ptr
add wave -noupdate -divider Controller
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/bits8
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/bits54
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/byte_complete
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/enable_pts
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/enable_timer
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/enable_timer_bits8
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/enable_timer_bits52
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/enable_timer_bits54
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/get_tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/next_state
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/curr_state
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/send_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/send_EOP
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/tx_error
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/tx_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/tx_transfer_active
add wave -noupdate -radix unsigned /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/buffer_occupancy
add wave -noupdate -divider Shift_Reg
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/clk12
add wave -noupdate -radix hexadecimal /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/enable_pts
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/send_data
add wave -noupdate -color Cyan -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/serial_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/tx_packet
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/SHIFT_REG/tx_packet_out
add wave -noupdate -divider Timer
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER/byte_complete
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER/clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER/clk12
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER/count_out1
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER/count_out2
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER/enable_timer
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER/n_rst
add wave -noupdate -divider Timer2
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER2/bits8
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER2/clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER2/count_out1
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER2/enable_timer_bits8
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER2/n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/bits54
add wave -noupdate -divider Timer3
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/clk
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/count_out1
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/enable_timer_bits52
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/enable_timer_bits54
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/tmp_count_enable
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/TIMER3/tmp_rollover_val
add wave -noupdate -divider Encoder
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/clk
add wave -noupdate /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/clk12
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/CONTROLLER/enable_pts
add wave -noupdate -color Magenta /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/enable_pts1
add wave -noupdate -color Magenta /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/clk12_sync1
add wave -noupdate /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/clk12_sync
add wave -noupdate -color Cyan -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/serial_out
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/curr_state
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/D_plus
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/D_minus
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/n_rst
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/next_state
add wave -noupdate -radix binary /tb_usb_tx_data_buffer/DUT/USB/ENCODER_TX/send_EOP
add wave -noupdate -divider Timer4
add wave -noupdate /tb_usb_tx_data_buffer/DUT/USB/TIMER4/bits51
add wave -noupdate /tb_usb_tx_data_buffer/DUT/USB/TIMER4/clk
add wave -noupdate /tb_usb_tx_data_buffer/DUT/USB/TIMER4/count_out1
add wave -noupdate /tb_usb_tx_data_buffer/DUT/USB/TIMER4/enable_timer_bits51
add wave -noupdate /tb_usb_tx_data_buffer/DUT/USB/TIMER4/n_rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2330000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 179
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {6473250 ps}
