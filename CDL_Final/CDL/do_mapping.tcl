# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {usb_tx_data_buffer.sv data_buffer_rx.sv usb_tx.sv ahb_lite_slave.sv controller_tx.sv data_buffer_tx.sv timer_tx.sv timer2_tx.sv timer3_tx.sv timer4_tx.sv flex_counter.sv shift_register_tx.sv flex_pts_sr.sv encoder.sv decoder.sv edge_detector.sv eop_detector.sv flex_stp_sr.sv rcu.sv rx_data_buffer.sv shift_register.sv sync_high.sv sync_low.sv timer.sv usb_receiver.sv top.sv}
elaborate top -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW
 create_clock "clk" -name "clk" -period 10

# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/top.rep
report_area >> reports/top.rep
report_power -hier >> reports/top.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/top.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
