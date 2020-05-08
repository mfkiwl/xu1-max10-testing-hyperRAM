#onerror {resume}
if {[file isdirectory work]} { vdel -all -lib work }
vlib work
vmap work work

vcom -work work -93 -explicit ./ham_hammingSEC-DED_64_pkg.vhd
vcom -work work -93 -explicit ./ham_hammingSEC-DED_64_tb.vhd

vsim work.tb_hamming

do wave-SEC-DED.do

run -all
