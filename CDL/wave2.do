onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_test_case
add wave -noupdate -radix unsigned /tb_data_buffer_tx/tb_test_case_num
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_clk
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_n_rst
add wave -noupdate -radix unsigned /tb_data_buffer_tx/tb_test_data
add wave -noupdate -radix unsigned /tb_data_buffer_tx/tb_test_data1
add wave -noupdate /tb_data_buffer_tx/DUT/data_in
add wave -noupdate -color Magenta -radix hexadecimal /tb_data_buffer_tx/tb_tx_data
add wave -noupdate -color Magenta -radix unsigned /tb_data_buffer_tx/tb_store_tx_data
add wave -noupdate -color Magenta -radix unsigned /tb_data_buffer_tx/tb_get_tx_packet_data
add wave -noupdate -color Magenta -radix hexadecimal /tb_data_buffer_tx/tb_tx_packet_data
add wave -noupdate -radix hexadecimal /tb_data_buffer_tx/tb_rx_packet_data
add wave -noupdate -radix hexadecimal /tb_data_buffer_tx/tb_rx_data
add wave -noupdate -radix unsigned /tb_data_buffer_tx/DUT/next_rx_data
add wave -noupdate -radix unsigned /tb_data_buffer_tx/DUT/next_tx_packet_data
add wave -noupdate -radix unsigned /tb_data_buffer_tx/DUT/next_buffer_occupancy
add wave -noupdate /tb_data_buffer_tx/tb_hsize
add wave -noupdate -color Cyan -radix unsigned /tb_data_buffer_tx/DUT/write_ptr
add wave -noupdate -color Cyan -radix unsigned /tb_data_buffer_tx/DUT/next_write_ptr
add wave -noupdate -color Pink -radix unsigned /tb_data_buffer_tx/DUT/read_ptr
add wave -noupdate -color Pink /tb_data_buffer_tx/DUT/next_read_ptr
add wave -noupdate -radix unsigned /tb_data_buffer_tx/tb_buffer_occupancy
add wave -noupdate -radix unsigned /tb_data_buffer_tx/DUT/write_addr
add wave -noupdate -radix unsigned /tb_data_buffer_tx/DUT/empty
add wave -noupdate -radix unsigned /tb_data_buffer_tx/DUT/full
add wave -noupdate -radix hexadecimal -childformat {{{/tb_data_buffer_tx/DUT/mem[0]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[1]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[2]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[3]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[4]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[5]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[6]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[7]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[8]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[9]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[10]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[11]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[12]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[13]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[14]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[15]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[16]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[17]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[18]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[19]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[20]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[21]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[22]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[23]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[24]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[25]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[26]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[27]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[28]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[29]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[30]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[31]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[32]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[33]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[34]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[35]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[36]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[37]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[38]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[39]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[40]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[41]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[42]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[43]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[44]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[45]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[46]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[47]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[48]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[49]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[50]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[51]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[52]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[53]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[54]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[55]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[56]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[57]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[58]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[59]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[60]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[61]} -radix hexadecimal} {{/tb_data_buffer_tx/DUT/mem[62]} -radix hexadecimal}} -expand -subitemconfig {{/tb_data_buffer_tx/DUT/mem[0]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[1]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[2]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[3]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[4]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[5]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[6]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[7]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[8]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[9]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[10]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[11]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[12]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[13]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[14]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[15]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[16]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[17]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[18]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[19]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[20]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[21]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[22]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[23]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[24]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[25]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[26]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[27]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[28]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[29]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[30]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[31]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[32]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[33]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[34]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[35]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[36]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[37]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[38]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[39]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[40]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[41]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[42]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[43]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[44]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[45]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[46]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[47]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[48]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[49]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[50]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[51]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[52]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[53]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[54]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[55]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[56]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[57]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[58]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[59]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[60]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[61]} {-height 16 -radix hexadecimal} {/tb_data_buffer_tx/DUT/mem[62]} {-height 16 -radix hexadecimal}} /tb_data_buffer_tx/DUT/mem
add wave -noupdate -radix binary /tb_data_buffer_tx/CLK_PERIOD
add wave -noupdate -radix binary /tb_data_buffer_tx/PACKET_SIZE
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_get_rx_data
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_clear
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_store_rx_packet_data
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_flush
add wave -noupdate -radix binary /tb_data_buffer_tx/expected_tb_rx_data
add wave -noupdate -radix binary /tb_data_buffer_tx/expected_tb_tx_packet_data
add wave -noupdate -radix binary /tb_data_buffer_tx/expected_tb_buffer_occupancy
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_mismatch
add wave -noupdate -radix binary /tb_data_buffer_tx/tb_check
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/tx_data
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/rx_packet_data
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/rx_data
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/tx_packet_data
add wave -noupdate /tb_data_buffer_tx/DUT/buffer_occupancy
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/buffer_occupancy
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/get_rx_data
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/store_tx_data
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/clear
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/get_tx_packet_data
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/store_rx_packet_data
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/flush
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/clk
add wave -noupdate -radix binary /tb_data_buffer_tx/DUT/n_rst
add wave -noupdate /tb_data_buffer_tx/DUT/get_rx_data
add wave -noupdate /tb_data_buffer_tx/DUT/store_tx_data
add wave -noupdate /tb_data_buffer_tx/DUT/clear
add wave -noupdate /tb_data_buffer_tx/DUT/get_tx_packet_data
add wave -noupdate /tb_data_buffer_tx/DUT/store_rx_packet_data
add wave -noupdate /tb_data_buffer_tx/DUT/flush
add wave -noupdate /tb_data_buffer_tx/DUT/clk
add wave -noupdate /tb_data_buffer_tx/DUT/n_rst
add wave -noupdate /tb_data_buffer_tx/DUT/tx_data
add wave -noupdate /tb_data_buffer_tx/DUT/rx_packet_data
add wave -noupdate /tb_data_buffer_tx/DUT/rx_data
add wave -noupdate /tb_data_buffer_tx/DUT/tx_packet_data
add wave -noupdate /tb_data_buffer_tx/DUT/mem
add wave -noupdate /tb_data_buffer_tx/DUT/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99331 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 173
configure wave -valuecolwidth 161
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
WaveRestoreZoom {0 ps} {372750 ps}
