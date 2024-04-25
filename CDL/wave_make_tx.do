onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_usb_tx/tb_test_case
add wave -noupdate /tb_usb_tx/tb_test_case_num
add wave -noupdate /tb_usb_tx/tb_clk
add wave -noupdate -radix binary /tb_usb_tx/DUT/clk12
add wave -noupdate /tb_usb_tx/tb_n_rst
add wave -noupdate -radix binary /tb_usb_tx/tb_tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx/tb_tx_packet
add wave -noupdate -radix binary /tb_usb_tx/tb_tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx/tb_dplus_out
add wave -noupdate -radix binary /tb_usb_tx/tb_dminus_out
add wave -noupdate -radix binary /tb_usb_tx/tb_tx_error
add wave -noupdate /tb_usb_tx/CLK_PERIOD
add wave -noupdate /tb_usb_tx/PACKET_SIZE
add wave -noupdate -radix binary /tb_usb_tx/tb_buffer_occupancy
add wave -noupdate -radix binary /tb_usb_tx/tb_get_tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx/expected_tb_D_Plus
add wave -noupdate -radix binary /tb_usb_tx/expected_tb_D_Minus
add wave -noupdate -radix binary /tb_usb_tx/expected_tb_tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx/expected_tb_tx_error
add wave -noupdate -radix binary /tb_usb_tx/tb_mismatch
add wave -noupdate -radix binary /tb_usb_tx/tb_check
add wave -noupdate -radix binary /tb_usb_tx/tb_test_data
add wave -noupdate -radix binary /tb_usb_tx/tb_test_packet
add wave -noupdate -radix binary /tb_usb_tx/DUT/buffer_occupancy
add wave -noupdate -radix binary /tb_usb_tx/DUT/clk
add wave -noupdate -radix binary /tb_usb_tx/DUT/n_rst
add wave -noupdate -radix binary /tb_usb_tx/DUT/tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx/DUT/tx_packet
add wave -noupdate -radix binary /tb_usb_tx/DUT/tx_transfer_active
add wave -noupdate -radix binary /tb_usb_tx/DUT/tx_error
add wave -noupdate -radix binary /tb_usb_tx/DUT/dplus_out
add wave -noupdate -radix binary /tb_usb_tx/DUT/dminus_out
add wave -noupdate -radix binary /tb_usb_tx/DUT/get_tx_packet_data
add wave -noupdate -radix binary /tb_usb_tx/DUT/enable_timer
add wave -noupdate -radix binary /tb_usb_tx/DUT/byte_complete
add wave -noupdate -radix binary /tb_usb_tx/DUT/send_data
add wave -noupdate -radix binary /tb_usb_tx/DUT/enable_pts
add wave -noupdate -radix binary /tb_usb_tx/DUT/send_EOP
add wave -noupdate -divider Controller
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/curr_state
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/tx_packet
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/send_data
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/byte_complete
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/clk
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/n_rst
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/bits8
add wave -noupdate -divider Timer
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/bits54
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/enable_timer
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/send_EOP
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/enable_pts
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/tx_transfer_active
add wave -noupdate /tb_usb_tx/DUT/CONTROLLER/tx_error
add wave -noupdate -divider Timer2
add wave -noupdate /tb_usb_tx/DUT/TIMER/n1
add wave -noupdate /tb_usb_tx/DUT/TIMER2/enable_timer_bits8
add wave -noupdate /tb_usb_tx/DUT/TIMER2/clk
add wave -noupdate /tb_usb_tx/DUT/TIMER2/n_rst
add wave -noupdate -divider Timer3
add wave -noupdate /tb_usb_tx/DUT/TIMER2/bits8
add wave -noupdate /tb_usb_tx/DUT/TIMER3/enable_timer_bits54
add wave -noupdate /tb_usb_tx/DUT/TIMER3/enable_timer_bits52
add wave -noupdate /tb_usb_tx/DUT/TIMER3/clk
add wave -noupdate /tb_usb_tx/DUT/TIMER3/n_rst
add wave -noupdate /tb_usb_tx/DUT/TIMER3/bits54
add wave -noupdate /tb_usb_tx/DUT/TIMER3/N4
add wave -noupdate /tb_usb_tx/DUT/TIMER3/n3
add wave -noupdate /tb_usb_tx/DUT/TIMER3/n1
add wave -noupdate /tb_usb_tx/DUT/TIMER3/n2
add wave -noupdate -divider Shift_reg
add wave -noupdate /tb_usb_tx/DUT/TIMER3/tmp_rollover_val
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/send_data
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/tx_packet
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/tx_packet_data
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/enable_pts
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/clk12
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/clk
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n_rst
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/serial_out
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/N26
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/N27
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/N29
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n1
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n2
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n3
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n4
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n5
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n6
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n7
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n8
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n9
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n10
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n11
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n12
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n13
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n14
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n15
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n16
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n17
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n18
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n19
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n20
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n21
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n22
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/n23
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/tx_packet_out
add wave -noupdate -divider Encoder
add wave -noupdate /tb_usb_tx/DUT/SHIFT_REG/data
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/serial_out
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/send_EOP
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/clk
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n_rst
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/D_plus
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/D_minus
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n20
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n21
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n22
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n5
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n6
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n7
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n8
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n9
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n10
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n11
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n12
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n13
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n14
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n15
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n16
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n17
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n18
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/n19
add wave -noupdate /tb_usb_tx/DUT/ENCODER_TX/curr_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1416273 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 182
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
WaveRestoreZoom {492360 ps} {1762071 ps}
