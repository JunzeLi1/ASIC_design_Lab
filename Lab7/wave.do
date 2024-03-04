onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fir_filter/tb_clk
add wave -noupdate /tb_fir_filter/tb_n_reset
add wave -noupdate /tb_fir_filter/tb_data_ready
add wave -noupdate /tb_fir_filter/tb_load_coeff
add wave -noupdate /tb_fir_filter/tb_sample
add wave -noupdate /tb_fir_filter/tb_coeff
add wave -noupdate /tb_fir_filter/tb_one_k_samples
add wave -noupdate /tb_fir_filter/tb_modwait
add wave -noupdate /tb_fir_filter/tb_err
add wave -noupdate /tb_fir_filter/tb_fir_out
add wave -noupdate /tb_fir_filter/tb_test_case_num
add wave -noupdate /tb_fir_filter/tb_test_sample_num
add wave -noupdate /tb_fir_filter/tb_std_test_case
add wave -noupdate /tb_fir_filter/tb_expected_fir_out
add wave -noupdate /tb_fir_filter/tb_expected_err
add wave -noupdate /tb_fir_filter/tb_expected_one_k_samples
add wave -noupdate -divider dd
add wave -noupdate /tb_fir_filter/DUT/control_unit/curr_state
add wave -noupdate /tb_fir_filter/DUT/control_unit/modwait
add wave -noupdate /tb_fir_filter/DUT/sync1/sync_out
add wave -noupdate /tb_fir_filter/DUT/sync/sync_out
add wave -noupdate /tb_fir_filter/DUT/control_unit/cnt_up
add wave -noupdate /tb_fir_filter/DUT/control_unit/clear
add wave -noupdate /tb_fir_filter/DUT/control_unit/err
add wave -noupdate /tb_fir_filter/DUT/control_unit/next_modwait
add wave -noupdate /tb_fir_filter/DUT/control_unit/next_state
add wave -noupdate /tb_fir_filter/DUT/control_unit/op
add wave -noupdate /tb_fir_filter/DUT/control_unit/src1
add wave -noupdate /tb_fir_filter/DUT/control_unit/src2
add wave -noupdate /tb_fir_filter/DUT/control_unit/dest
add wave -noupdate -divider au
add wave -noupdate /tb_fir_filter/DUT/DAT/outreg_data
add wave -noupdate /tb_fir_filter/DUT/DAT/overflow
add wave -noupdate /tb_fir_filter/DUT/DAT/alu_op
add wave -noupdate /tb_fir_filter/DUT/DAT/w_data_sel
add wave -noupdate /tb_fir_filter/DUT/DAT/alu_result
add wave -noupdate /tb_fir_filter/DUT/DAT/src1_data
add wave -noupdate /tb_fir_filter/DUT/DAT/src2_data
add wave -noupdate /tb_fir_filter/DUT/DAT/dest_data
add wave -noupdate /tb_fir_filter/DUT/DAT/w_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {345599 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 202
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
WaveRestoreZoom {0 ps} {192119 ps}
