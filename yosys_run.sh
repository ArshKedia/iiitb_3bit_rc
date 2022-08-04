# read design

read_verilog iiitb_3bit_rc.v

# generic synthesis
synth -top iiitb_3bit_rc

# mapping to mycells.lib
dfflibmap -liberty /home/arsh/IIITB/asic/iiitb_3bit_rc/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
opt
abc -liberty /home/arsh/IIITB/asic/iiitb_3bit_rc/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
opt
clean
flatten
# write synthesized design
write_verilog -noattr iiitb_3bit_rc_synth.v
stat
