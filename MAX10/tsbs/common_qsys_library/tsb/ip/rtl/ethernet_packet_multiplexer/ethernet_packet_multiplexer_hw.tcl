# +-----------------------------------
# | module ethernet_packet_multiplexer
# | 
set_module_property DESCRIPTION "5 to 1 packet multiplexor"
set_module_property NAME ethernet_packet_multiplexer
set_module_property VERSION 1.0
set_module_property GROUP "Packet Processing"
set_module_property AUTHOR RSF
set_module_property DISPLAY_NAME ethernet_packet_multiplexer
set_module_property TOP_LEVEL_HDL_FILE ethernet_packet_multiplexer.v
set_module_property TOP_LEVEL_HDL_MODULE ethernet_packet_multiplexer
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
add_file ethernet_packet_multiplexer.v {SYNTHESIS SIMULATION}
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
add_interface_port clock csi_clock_reset_n reset_n Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point in0
# | 
add_interface in0 avalon_streaming end
set_interface_property in0 maxChannel 0
set_interface_property in0 errorDescriptor ""
set_interface_property in0 readyLatency 0
set_interface_property in0 dataBitsPerSymbol 8
set_interface_property in0 symbolsPerBeat 4

set_interface_property in0 ASSOCIATED_CLOCK clock

add_interface_port in0 asi_in0_valid valid Input 1
add_interface_port in0 asi_in0_ready ready Output 1
add_interface_port in0 asi_in0_data data Input 32
add_interface_port in0 asi_in0_startofpacket startofpacket Input 1
add_interface_port in0 asi_in0_endofpacket endofpacket Input 1
add_interface_port in0 asi_in0_empty empty Input 2
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point in1
# | 
add_interface in1 avalon_streaming end
set_interface_property in1 maxChannel 0
set_interface_property in1 errorDescriptor ""
set_interface_property in1 readyLatency 0
set_interface_property in1 dataBitsPerSymbol 8
set_interface_property in1 symbolsPerBeat 4

set_interface_property in1 ASSOCIATED_CLOCK clock

add_interface_port in1 asi_in1_valid valid Input 1
add_interface_port in1 asi_in1_ready ready Output 1
add_interface_port in1 asi_in1_data data Input 32
add_interface_port in1 asi_in1_startofpacket startofpacket Input 1
add_interface_port in1 asi_in1_endofpacket endofpacket Input 1
add_interface_port in1 asi_in1_empty empty Input 2
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point in2
# | 
add_interface in2 avalon_streaming end
set_interface_property in2 maxChannel 0
set_interface_property in2 errorDescriptor ""
set_interface_property in2 readyLatency 0
set_interface_property in2 dataBitsPerSymbol 8
set_interface_property in2 symbolsPerBeat 4

set_interface_property in2 ASSOCIATED_CLOCK clock

add_interface_port in2 asi_in2_valid valid Input 1
add_interface_port in2 asi_in2_ready ready Output 1
add_interface_port in2 asi_in2_data data Input 32
add_interface_port in2 asi_in2_startofpacket startofpacket Input 1
add_interface_port in2 asi_in2_endofpacket endofpacket Input 1
add_interface_port in2 asi_in2_empty empty Input 2
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point in3
# | 
add_interface in3 avalon_streaming end
set_interface_property in3 maxChannel 0
set_interface_property in3 errorDescriptor ""
set_interface_property in3 readyLatency 0
set_interface_property in3 dataBitsPerSymbol 8
set_interface_property in3 symbolsPerBeat 4

set_interface_property in3 ASSOCIATED_CLOCK clock

add_interface_port in3 asi_in3_valid valid Input 1
add_interface_port in3 asi_in3_ready ready Output 1
add_interface_port in3 asi_in3_data data Input 32
add_interface_port in3 asi_in3_startofpacket startofpacket Input 1
add_interface_port in3 asi_in3_endofpacket endofpacket Input 1
add_interface_port in3 asi_in3_empty empty Input 2
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point in4
# | 
add_interface in4 avalon_streaming end
set_interface_property in4 maxChannel 0
set_interface_property in4 errorDescriptor ""
set_interface_property in4 readyLatency 0
set_interface_property in4 dataBitsPerSymbol 8
set_interface_property in4 symbolsPerBeat 4

set_interface_property in4 ASSOCIATED_CLOCK clock

add_interface_port in4 asi_in4_valid valid Input 1
add_interface_port in4 asi_in4_ready ready Output 1
add_interface_port in4 asi_in4_data data Input 32
add_interface_port in4 asi_in4_startofpacket startofpacket Input 1
add_interface_port in4 asi_in4_endofpacket endofpacket Input 1
add_interface_port in4 asi_in4_empty empty Input 2
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point out
# | 
add_interface out avalon_streaming start
set_interface_property out maxChannel 0
set_interface_property out errorDescriptor ""
set_interface_property out readyLatency 0
set_interface_property out dataBitsPerSymbol 8
set_interface_property out symbolsPerBeat 4

set_interface_property out ASSOCIATED_CLOCK clock

add_interface_port out aso_out_valid valid Output 1
add_interface_port out aso_out_ready ready Input 1
add_interface_port out aso_out_data data Output 32
add_interface_port out aso_out_startofpacket startofpacket Output 1
add_interface_port out aso_out_endofpacket endofpacket Output 1
add_interface_port out aso_out_empty empty Output 2
# | 
# +-----------------------------------
