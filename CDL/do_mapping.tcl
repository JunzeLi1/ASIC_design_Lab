# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {controller_tx.sv encoder.sv flex_counter.sv flex_pts_sr.sv shift_register_tx.sv timer_tx.sv timer2_tx.sv timer3_tx.sv timer4_tx.sv data_buffer_tx.sv data_buffer_rx.sv usb_tx.sv usb_tx_data_buffer.sv}
elaborate usb_tx_data_buffer -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/usb_tx_data_buffer.rep
report_area >> reports/usb_tx_data_buffer.rep
report_power -hier >> reports/usb_tx_data_buffer.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/usb_tx_data_buffer.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
