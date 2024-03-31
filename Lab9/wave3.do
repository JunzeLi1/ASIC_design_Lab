onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_case
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_case_num
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate -radix hexadecimal /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_test_data
add wave -noupdate /tb_ahb_lite_fir_filter/tb_check_tag
add wave -noupdate /tb_ahb_lite_fir_filter/tb_mismatch
add wave -noupdate /tb_ahb_lite_fir_filter/tb_check
add wave -noupdate /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate /tb_ahb_lite_fir_filter/tb_fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/tb_modwait
add wave -noupdate /tb_ahb_lite_fir_filter/tb_err
add wave -noupdate /tb_ahb_lite_fir_filter/tb_coeff_num
add wave -noupdate /tb_ahb_lite_fir_filter/tb_coeff_clr
add wave -noupdate /tb_ahb_lite_fir_filter/tb_data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/tb_sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/tb_new_coeff_set
add wave -noupdate /tb_ahb_lite_fir_filter/tb_fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_sample
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_fir_filter/tb_expected_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/clk
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/hsel
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/hsize
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/hwrite
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/haddr
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/htrans
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/hwdata
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/hresp
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/err
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/coefficient_num
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/new_coefficient_set
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/clear_new_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/load_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/one_k_samples
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {355691 ps} 0}
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
WaveRestoreZoom {312298 ps} {444135 ps}
