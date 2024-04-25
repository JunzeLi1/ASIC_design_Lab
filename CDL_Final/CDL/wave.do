onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/tb_test_case
add wave -noupdate -radix unsigned /tb_ahb_lite_slave/tb_test_case_num
add wave -noupdate /tb_ahb_lite_slave/tb_check
add wave -noupdate /tb_ahb_lite_slave/tb_mismatch
add wave -noupdate /tb_ahb_lite_slave/DUT/clk
add wave -noupdate /tb_ahb_lite_slave/DUT/n_rst
add wave -noupdate -expand -group {HBus Signals} /tb_ahb_lite_slave/DUT/hsel
add wave -noupdate -expand -group {HBus Signals} /tb_ahb_lite_slave/DUT/hwrite
add wave -noupdate -expand -group {HBus Signals} /tb_ahb_lite_slave/DUT/hsize
add wave -noupdate -expand -group {HBus Signals} /tb_ahb_lite_slave/DUT/htrans
add wave -noupdate -expand -group {HBus Signals} -radix unsigned /tb_ahb_lite_slave/DUT/haddr
add wave -noupdate -expand -group {HBus Signals} -radix unsigned /tb_ahb_lite_slave/DUT/hwdata
add wave -noupdate -expand -group {HBus Signals} -radix unsigned /tb_ahb_lite_slave/DUT/hrdata
add wave -noupdate -expand -group {HBus Signals} /tb_ahb_lite_slave/DUT/hresp
add wave -noupdate -group RX /tb_ahb_lite_slave/DUT/rx_packet
add wave -noupdate -group RX /tb_ahb_lite_slave/DUT/rx_data_ready
add wave -noupdate -group RX /tb_ahb_lite_slave/DUT/rx_transfer_active
add wave -noupdate -group RX /tb_ahb_lite_slave/DUT/rx_error
add wave -noupdate -expand -group TX /tb_ahb_lite_slave/DUT/tx_transfer_active
add wave -noupdate -expand -group TX /tb_ahb_lite_slave/DUT/tx_error
add wave -noupdate -expand -group TX /tb_ahb_lite_slave/DUT/tx_packet
add wave -noupdate -expand -group {Data Buff} /tb_ahb_lite_slave/DUT/buffer_occupancy
add wave -noupdate -expand -group {Data Buff} -radix unsigned /tb_ahb_lite_slave/DUT/rx_data
add wave -noupdate -expand -group {Data Buff} /tb_ahb_lite_slave/DUT/get_rx_data
add wave -noupdate -expand -group {Data Buff} /tb_ahb_lite_slave/DUT/store_tx_data
add wave -noupdate -expand -group {Data Buff} -radix unsigned /tb_ahb_lite_slave/DUT/tx_data
add wave -noupdate -expand -group {Data Buff} /tb_ahb_lite_slave/DUT/clear
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_hsel
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_hwrite
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_hsize
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_htrans
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_haddr
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_hwdata
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_rx_packet
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_rx_data_ready
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_rx_transfer_active
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_rx_error
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_tx_transfer_active
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_tx_error
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_buffer_occupancy
add wave -noupdate -group {Registered Inputs} /tb_ahb_lite_slave/DUT/reg_rx_data
add wave -noupdate -expand -group {Next Output} -radix unsigned /tb_ahb_lite_slave/DUT/next_hrdata
add wave -noupdate -expand -group {Next Output} -radix unsigned /tb_ahb_lite_slave/DUT/next_tx_packet
add wave -noupdate -expand -group {Next Output} /tb_ahb_lite_slave/DUT/next_get_rx_data
add wave -noupdate -expand -group {Next Output} /tb_ahb_lite_slave/DUT/next_store_tx_data
add wave -noupdate -expand -group {Next Output} /tb_ahb_lite_slave/DUT/next_clear
add wave -noupdate -expand -group {Next Output} -radix unsigned /tb_ahb_lite_slave/DUT/next_tx_data
add wave -noupdate -expand -group {Next Output} /tb_ahb_lite_slave/DUT/next_d_mode
add wave -noupdate /tb_ahb_lite_slave/DUT/d_mode
add wave -noupdate /tb_ahb_lite_slave/DUT/hsize_o
add wave -noupdate -group {Intermediate Signals} /tb_ahb_lite_slave/DUT/rx_pid_status
add wave -noupdate -group {Intermediate Signals} /tb_ahb_lite_slave/DUT/reg_rx_pid_status
add wave -noupdate -expand -group {TB Expected Outputs} /tb_ahb_lite_slave/tb_expected_clear
add wave -noupdate -expand -group {TB Expected Outputs} /tb_ahb_lite_slave/tb_expected_get_rx_data
add wave -noupdate -expand -group {TB Expected Outputs} /tb_ahb_lite_slave/tb_expected_hrdata
add wave -noupdate -expand -group {TB Expected Outputs} /tb_ahb_lite_slave/tb_expected_store_tx_data
add wave -noupdate -expand -group {TB Expected Outputs} /tb_ahb_lite_slave/tb_expected_tx_packet
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {890133 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 205
configure wave -valuecolwidth 143
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
WaveRestoreZoom {829586 ps} {975200 ps}
