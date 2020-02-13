# TCL File Generated by Component Editor 10.0
# Fri Jun 18 21:46:58 MYT 2010
# DO NOT MODIFY


# +-----------------------------------
# | 
# | controller "checksum_controller" v1.0
# | null 2010.06.18.21:46:58
# | 
# | 
# | /data/ywgan/checksum_neek/ip/controller.v
# | 
# |    ./controller.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 10.0
# | 
package require -exact sopc 10.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module controller
# | 
set_module_property NAME controller
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property GROUP "Microcore Checksum Accelerator"
set_module_property DISPLAY_NAME "Checksum Controller"
set_module_property TOP_LEVEL_HDL_FILE controller.v
set_module_property TOP_LEVEL_HDL_MODULE controller
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL TRUE
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file controller.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock_reset
# | 
add_interface clock_reset clock end

set_interface_property clock_reset ENABLED true

add_interface_port clock_reset clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock_reset_reset
# | 
add_interface clock_reset_reset reset end
set_interface_property clock_reset_reset associatedClock clock_reset
set_interface_property clock_reset_reset synchronousEdges DEASSERT

set_interface_property clock_reset_reset ASSOCIATED_CLOCK clock_reset
set_interface_property clock_reset_reset ENABLED true

add_interface_port clock_reset_reset reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point avalon_slave
# | 
add_interface avalon_slave avalon end
set_interface_property avalon_slave addressAlignment DYNAMIC
set_interface_property avalon_slave associatedClock clock_reset
set_interface_property avalon_slave associatedReset clock_reset_reset
set_interface_property avalon_slave burstOnBurstBoundariesOnly false
set_interface_property avalon_slave explicitAddressSpan 0
set_interface_property avalon_slave holdTime 0
set_interface_property avalon_slave isMemoryDevice false
set_interface_property avalon_slave isNonVolatileStorage false
set_interface_property avalon_slave linewrapBursts false
set_interface_property avalon_slave maximumPendingReadTransactions 0
set_interface_property avalon_slave printableDevice false
set_interface_property avalon_slave readLatency 1
set_interface_property avalon_slave readWaitTime 1
set_interface_property avalon_slave setupTime 0
set_interface_property avalon_slave timingUnits Cycles
set_interface_property avalon_slave writeWaitTime 0

set_interface_property avalon_slave ASSOCIATED_CLOCK clock_reset
set_interface_property avalon_slave ENABLED true

add_interface_port avalon_slave avs_address address Input 3
add_interface_port avalon_slave avs_read read Input 1
add_interface_port avalon_slave avs_readdata readdata Output 32
add_interface_port avalon_slave avs_write write Input 1
add_interface_port avalon_slave avs_writedata writedata Input 32
add_interface_port avalon_slave avs_byteenable byteenable Input 4
add_interface_port avalon_slave avs_waitrequest waitrequest Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point cmd_src
# | 
add_interface cmd_src avalon_streaming start
set_interface_property cmd_src associatedClock clock_reset
set_interface_property cmd_src associatedReset clock_reset_reset
set_interface_property cmd_src dataBitsPerSymbol 256
set_interface_property cmd_src errorDescriptor ""
set_interface_property cmd_src maxChannel 0
set_interface_property cmd_src readyLatency 0

set_interface_property cmd_src ASSOCIATED_CLOCK clock_reset
set_interface_property cmd_src ENABLED true

add_interface_port cmd_src src_cmd_data data Output 256
add_interface_port cmd_src src_cmd_valid valid Output 1
add_interface_port cmd_src src_cmd_ready ready Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point response_snk
# | 
add_interface response_snk avalon_streaming end
set_interface_property response_snk associatedClock clock_reset
set_interface_property response_snk associatedReset clock_reset_reset
set_interface_property response_snk dataBitsPerSymbol 256
set_interface_property response_snk errorDescriptor ""
set_interface_property response_snk maxChannel 0
set_interface_property response_snk readyLatency 0

set_interface_property response_snk ASSOCIATED_CLOCK clock_reset
set_interface_property response_snk ENABLED true

add_interface_port response_snk snk_response_data data Input 256
add_interface_port response_snk snk_response_valid valid Input 1
add_interface_port response_snk snk_response_ready ready Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point interrupt_sender
# | 
add_interface interrupt_sender interrupt end
set_interface_property interrupt_sender associatedAddressablePoint avalon_slave
set_interface_property interrupt_sender associatedClock clock_reset
set_interface_property interrupt_sender associatedReset clock_reset_reset

set_interface_property interrupt_sender ASSOCIATED_CLOCK clock_reset
set_interface_property interrupt_sender ENABLED true

add_interface_port interrupt_sender irq irq Output 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point result_snk
# | 
add_interface result_snk avalon_streaming end
set_interface_property result_snk associatedClock clock_reset
set_interface_property result_snk associatedReset clock_reset_reset
set_interface_property result_snk dataBitsPerSymbol 8
set_interface_property result_snk errorDescriptor ""
set_interface_property result_snk maxChannel 0
set_interface_property result_snk readyLatency 0

set_interface_property result_snk ASSOCIATED_CLOCK clock_reset
set_interface_property result_snk ENABLED true

add_interface_port result_snk snk_result_data data Input 16
add_interface_port result_snk snk_result_valid valid Input 1
add_interface_port result_snk snk_result_ready ready Output 1
# | 
# +-----------------------------------