connect -url tcp:127.0.0.1:3121
source C:/Xilinx/SDK/2018.3/scripts/sdk/util/zynqmp_utils.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 000015e0f34f01"} -index 1
rst -system
after 3000
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 000015e0f34f01"} -index 1
reset_apu
targets -set -filter {jtag_cable_name =~ "Platform Cable USB II 000015e0f34f01" && level==0} -index 0
fpga -file C:/payne/test_mxu1/mercury_xu1_pmt/XU1/workspace/hw_platform_0/system_top.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 000015e0f34f01"} -index 1
loadhw -hw C:/payne/test_mxu1/mercury_xu1_pmt/XU1/workspace/hw_platform_0/system.hdf -mem-ranges [list {0x80000000 0xbfffffff} {0x400000000 0x5ffffffff} {0x1000000000 0x7fffffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Platform Cable USB II 000015e0f34f01"} -index 1
source C:/payne/test_mxu1/mercury_xu1_pmt/XU1/workspace/hw_platform_0/psu_init.tcl
psu_init
source C:/Xilinx/SDK/2018.3/scripts/sdk/util/fsbl.tcl
catch {XFsbl_DdrEccInit}
after 1000
psu_ps_pl_isolation_removal
after 1000
psu_ps_pl_reset_config
catch {psu_protection}
targets -set -nocase -filter {name =~"*A53*0" && jtag_cable_name =~ "Platform Cable USB II 000015e0f34f01"} -index 1
rst -processor
dow C:/payne/test_mxu1/mercury_xu1_pmt/XU1/workspace/HelloWorld/Debug/HelloWorld.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~"*A53*0" && jtag_cable_name =~ "Platform Cable USB II 000015e0f34f01"} -index 1
con
