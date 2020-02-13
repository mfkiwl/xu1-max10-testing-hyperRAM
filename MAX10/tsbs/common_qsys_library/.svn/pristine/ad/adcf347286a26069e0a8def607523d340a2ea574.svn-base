# +-----------------------------------
# | module udp_port_to_channel_mapper
# | 
set_module_property DESCRIPTION "This component maps incoming UDP packets onto Avalon ST channels."
set_module_property NAME udp_port_to_channel_mapper
set_module_property VERSION 1.0
set_module_property GROUP "Packet Processing"
set_module_property AUTHOR RSF
set_module_property DISPLAY_NAME udp_port_to_channel_mapper
set_module_property TOP_LEVEL_HDL_FILE udp_port_to_channel_mapper.v
set_module_property TOP_LEVEL_HDL_MODULE udp_port_to_channel_mapper
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property SIMULATION_MODEL_IN_VERILOG false
set_module_property SIMULATION_MODEL_IN_VHDL true
set_module_property SIMULATION_MODEL_HAS_TULIPS false
set_module_property SIMULATION_MODEL_IS_OBFUSCATED false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
add_file udp_port_to_channel_mapper.v {SYNTHESIS SIMULATION}
add_file up2cm_channel_fifo.v {SYNTHESIS SIMULATION}
add_file up2cm_data_fifo.v {SYNTHESIS SIMULATION}
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock
# | 
add_interface clock clock end
set_interface_property clock ptfSchematicName ""

add_interface_port clock csi_clock_clk clk Input 1
add_interface_port clock csi_clock_reset reset Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point s0
# | 
add_interface s0 avalon end
set_interface_property s0 holdTime 0
set_interface_property s0 linewrapBursts false
set_interface_property s0 minimumUninterruptedRunLength 1
set_interface_property s0 bridgesToMaster ""
set_interface_property s0 isMemoryDevice false
set_interface_property s0 burstOnBurstBoundariesOnly false
set_interface_property s0 addressSpan 32
set_interface_property s0 timingUnits Cycles
set_interface_property s0 setupTime 0
set_interface_property s0 writeWaitTime 0
set_interface_property s0 isNonVolatileStorage false
set_interface_property s0 addressAlignment DYNAMIC
set_interface_property s0 maximumPendingReadTransactions 0
set_interface_property s0 readWaitTime 1
set_interface_property s0 readLatency 0
set_interface_property s0 printableDevice false

set_interface_property s0 ASSOCIATED_CLOCK clock

add_interface_port s0 avs_s0_write write Input 1
add_interface_port s0 avs_s0_read read Input 1
add_interface_port s0 avs_s0_address address Input 3
add_interface_port s0 avs_s0_byteenable byteenable Input 4
add_interface_port s0 avs_s0_writedata writedata Input 32
add_interface_port s0 avs_s0_readdata readdata Output 32
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point src0
# | 
add_interface src0 avalon_streaming start
set_interface_property src0 maxChannel 5
set_interface_property src0 errorDescriptor ""
set_interface_property src0 readyLatency 0
set_interface_property src0 dataBitsPerSymbol 8
set_interface_property src0 symbolsPerBeat 4

set_interface_property src0 ASSOCIATED_CLOCK clock

add_interface_port src0 aso_src0_valid valid Output 1
add_interface_port src0 aso_src0_ready ready Input 1
add_interface_port src0 aso_src0_data data Output 32
add_interface_port src0 aso_src0_empty empty Output 2
add_interface_port src0 aso_src0_startofpacket startofpacket Output 1
add_interface_port src0 aso_src0_endofpacket endofpacket Output 1
add_interface_port src0 aso_src0_channel channel Output 3
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point snk0
# | 
add_interface snk0 avalon_streaming end
set_interface_property snk0 maxChannel 0
set_interface_property snk0 errorDescriptor ""
set_interface_property snk0 readyLatency 0
set_interface_property snk0 dataBitsPerSymbol 8
set_interface_property snk0 symbolsPerBeat 4

set_interface_property snk0 ASSOCIATED_CLOCK clock

add_interface_port snk0 asi_snk0_valid valid Input 1
add_interface_port snk0 asi_snk0_ready ready Output 1
add_interface_port snk0 asi_snk0_data data Input 32
add_interface_port snk0 asi_snk0_empty empty Input 2
add_interface_port snk0 asi_snk0_startofpacket startofpacket Input 1
add_interface_port snk0 asi_snk0_endofpacket endofpacket Input 1
# | 
# +-----------------------------------
