onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_apb_uart_rx/tb_test_case
add wave -noupdate /tb_apb_uart_rx/tb_test_case_num
add wave -noupdate /tb_apb_uart_rx/tb_test_bit_period
add wave -noupdate /tb_apb_uart_rx/tb_mismatch
add wave -noupdate /tb_apb_uart_rx/tb_check
add wave -noupdate /tb_apb_uart_rx/tb_clk
add wave -noupdate /tb_apb_uart_rx/tb_n_rst
add wave -noupdate /tb_apb_uart_rx/tb_psel
add wave -noupdate /tb_apb_uart_rx/tb_paddr
add wave -noupdate /tb_apb_uart_rx/tb_penable
add wave -noupdate /tb_apb_uart_rx/tb_pwrite
add wave -noupdate /tb_apb_uart_rx/tb_pwdata
add wave -noupdate /tb_apb_uart_rx/tb_prdata
add wave -noupdate /tb_apb_uart_rx/tb_pslverr
add wave -noupdate /tb_apb_uart_rx/tb_data_size
add wave -noupdate /tb_apb_uart_rx/tb_serial_in
add wave -noupdate /tb_apb_uart_rx/tb_rx_data_send_in_8
add wave -noupdate /tb_apb_uart_rx/tb_rx_data_send_in_7
add wave -noupdate /tb_apb_uart_rx/tb_rx_data_send_in_5
add wave -noupdate /tb_apb_uart_rx/tb_rx_data_stop_bit
add wave -noupdate -divider {top lvel}
add wave -noupdate /tb_apb_uart_rx/DUT/clk
add wave -noupdate /tb_apb_uart_rx/DUT/n_rst
add wave -noupdate /tb_apb_uart_rx/DUT/serial_in
add wave -noupdate /tb_apb_uart_rx/DUT/psel
add wave -noupdate /tb_apb_uart_rx/DUT/penable
add wave -noupdate /tb_apb_uart_rx/DUT/pwrite
add wave -noupdate /tb_apb_uart_rx/DUT/paddr
add wave -noupdate /tb_apb_uart_rx/DUT/pwdata
add wave -noupdate /tb_apb_uart_rx/DUT/prdata
add wave -noupdate /tb_apb_uart_rx/DUT/pslverr
add wave -noupdate /tb_apb_uart_rx/DUT/data_ready
add wave -noupdate /tb_apb_uart_rx/DUT/rx_data
add wave -noupdate /tb_apb_uart_rx/DUT/data_read
add wave -noupdate /tb_apb_uart_rx/DUT/overrun_error
add wave -noupdate /tb_apb_uart_rx/DUT/framing_error
add wave -noupdate /tb_apb_uart_rx/DUT/data_size
add wave -noupdate /tb_apb_uart_rx/DUT/bit_period
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3307902 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {3301930 ps} {3318071 ps}
