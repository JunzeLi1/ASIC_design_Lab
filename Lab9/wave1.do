onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_case
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_case_num
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_data
add wave -noupdate /tb_ahb_lite_fir_filter/all/n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/all/hsel
add wave -noupdate /tb_ahb_lite_fir_filter/all/hsize
add wave -noupdate /tb_ahb_lite_fir_filter/all/hwrite
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/all/haddr
add wave -noupdate /tb_ahb_lite_fir_filter/all/htrans
add wave -noupdate -color {Cornflower Blue} -radix hexadecimal /tb_ahb_lite_fir_filter/all/hwdata
add wave -noupdate -color {Cornflower Blue} -radix hexadecimal /tb_ahb_lite_fir_filter/all/hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/all/hresp
add wave -noupdate /tb_ahb_lite_fir_filter/all/err
add wave -noupdate /tb_ahb_lite_fir_filter/all/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/all/coefficient_num
add wave -noupdate /tb_ahb_lite_fir_filter/all/fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/tb_check_tag
add wave -noupdate /tb_ahb_lite_fir_filter/tb_mismatch
add wave -noupdate /tb_ahb_lite_fir_filter/tb_check
add wave -noupdate /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate -radix decimal /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate -radix decimal /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clear
add wave -noupdate /tb_ahb_lite_fir_filter/tb_fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/tb_modwait
add wave -noupdate /tb_ahb_lite_fir_filter/tb_err
add wave -noupdate /tb_ahb_lite_fir_filter/tb_coeff_num
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_sample
add wave -noupdate /tb_ahb_lite_fir_filter/all/data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_hresp
add wave -noupdate /tb_ahb_lite_fir_filter/all/coefficient_num
add wave -noupdate /tb_ahb_lite_fir_filter/all/clk
add wave -noupdate /tb_ahb_lite_fir_filter/all/sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/all/fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/all/new_coefficient_set
add wave -noupdate /tb_ahb_lite_fir_filter/all/clear_new_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/all/load_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/all/one_k_samples
add wave -noupdate /tb_ahb_lite_fir_filter/tb_transaction_error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1110000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
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
WaveRestoreZoom {988136 ps} {1257157 ps}
