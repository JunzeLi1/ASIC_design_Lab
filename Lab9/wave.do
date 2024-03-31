onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_enqueue_transaction
add wave -noupdate /tb_ahb_lite_fir_filter/tb_transaction_write
add wave -noupdate /tb_ahb_lite_fir_filter/tb_transaction_fake
add wave -noupdate /tb_ahb_lite_fir_filter/tb_transaction_addr
add wave -noupdate -radix unsigned /tb_ahb_lite_fir_filter/tb_transaction_data
add wave -noupdate /tb_ahb_lite_fir_filter/tb_transaction_error
add wave -noupdate /tb_ahb_lite_fir_filter/tb_transaction_size
add wave -noupdate /tb_ahb_lite_fir_filter/tb_enable_transactions
add wave -noupdate /tb_ahb_lite_fir_filter/tb_current_transaction_num
add wave -noupdate /tb_ahb_lite_fir_filter/tb_current_transaction_error
add wave -noupdate /tb_ahb_lite_fir_filter/tb_model_reset
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_case
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_case_num
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_data
add wave -noupdate /tb_ahb_lite_fir_filter/tb_check_tag
add wave -noupdate /tb_ahb_lite_fir_filter/tb_mismatch
add wave -noupdate /tb_ahb_lite_fir_filter/tb_check
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clear
add wave -noupdate /tb_ahb_lite_fir_filter/tb_fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/tb_modwait
add wave -noupdate /tb_ahb_lite_fir_filter/tb_err
add wave -noupdate /tb_ahb_lite_fir_filter/tb_coeff_num
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_data_ready
add wave -noupdate -divider filter
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_sample
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_hresp
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/clk
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/n_reset
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/load_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/one_k_samples
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/err
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/dr
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/lc
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/cnt_up
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/clear
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/op
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/src1
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/src2
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/dest
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/overflow
add wave -noupdate -divider ahb
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/coefficient_num
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/outreg_data
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/clk
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/err
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/hsel
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/hsize
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/htrans
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/fir_out
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/hwdata
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/new_coefficient_set
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/hresp
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/clear_new_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/haddr
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_haddr
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_sample_data
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/f0_coefficient
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/f1_coefficient
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/f2_coefficient
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/f3_coefficient
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_f0_coefficient
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_f1_coefficient
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_f2_coefficient
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_f3_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_new_coefficient_set
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_next_data_ready
add wave -noupdate -color Magenta /tb_ahb_lite_fir_filter/all/AHB_SLAVE/hwrite
add wave -noupdate -color Magenta /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_hwrite
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_hsize
add wave -noupdate /tb_ahb_lite_fir_filter/all/AHB_SLAVE/next_hsel
add wave -noupdate -divider ctr
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/clk
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/dr
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/lc
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/overflow
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/cnt_up
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/clear
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/err
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/op
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/src1
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/src2
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/dest
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/curr_state
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/next_state
add wave -noupdate /tb_ahb_lite_fir_filter/all/FIR/control_unit/next_modwait
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {573042 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 150
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
WaveRestoreZoom {486842 ps} {685534 ps}
