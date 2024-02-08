onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_mealy/tb_test_case
add wave -noupdate /tb_mealy/tb_test_num
add wave -noupdate /tb_mealy/tb_clk
add wave -noupdate /tb_mealy/tb_i
add wave -noupdate /tb_mealy/tb_o
add wave -noupdate /tb_mealy/tb_expected_output
add wave -noupdate /tb_mealy/tb_n_rst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 191
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
WaveRestoreZoom {0 ps} {306 ps}
