# TCL File Generated by Component Editor 12.1sp1
# Fri Oct 25 17:20:44 PDT 2013
# DO NOT MODIFY


# 
# ignore_channels_for_avalon_st "Ignore Channels for Avalon ST for Packets" v1.0
# null 2013.10.25.17:20:44
# Ignores the channel bits and discards them. Assumes packetized data.
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module ignore_channels_for_avalon_st
# 
set_module_property DESCRIPTION "Ignores the channel bits and discards them. Assumes packetized data."
set_module_property NAME ignore_channels_for_avalon_st
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property DISPLAY_NAME "Ignore Channels for Avalon ST for Packets"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL ignore_channels_for_avalon_st
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file ignore_channels_for_avalon_st.v VERILOG PATH ignore_channels_for_avalon_st.v


# 
# parameters
# 
add_parameter log2_numchannels INTEGER 4
set_parameter_property log2_numchannels DEFAULT_VALUE 4
set_parameter_property log2_numchannels DISPLAY_NAME log2_numchannels
set_parameter_property log2_numchannels TYPE INTEGER
set_parameter_property log2_numchannels UNITS None
set_parameter_property log2_numchannels ALLOWED_RANGES -2147483648:2147483647
set_parameter_property log2_numchannels HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset reset_n reset_n Input 1


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock
set_interface_property avalon_streaming_source associatedReset reset
set_interface_property avalon_streaming_source dataBitsPerSymbol 8
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 0
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true

add_interface_port avalon_streaming_source out_ready ready Input 1
add_interface_port avalon_streaming_source out_valid valid Output 1
add_interface_port avalon_streaming_source out_data data Output 32
add_interface_port avalon_streaming_source out_startofpacket startofpacket Output 1
add_interface_port avalon_streaming_source out_endofpacket endofpacket Output 1
add_interface_port avalon_streaming_source out_empty empty Output 2


# 
# connection point avalon_streaming_sink
# 
add_interface avalon_streaming_sink avalon_streaming end
set_interface_property avalon_streaming_sink associatedClock clock
set_interface_property avalon_streaming_sink associatedReset reset
set_interface_property avalon_streaming_sink dataBitsPerSymbol 8
set_interface_property avalon_streaming_sink errorDescriptor ""
set_interface_property avalon_streaming_sink firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_sink maxChannel 15
set_interface_property avalon_streaming_sink readyLatency 0
set_interface_property avalon_streaming_sink ENABLED true

add_interface_port avalon_streaming_sink in_channel channel Input log2_numchannels
add_interface_port avalon_streaming_sink in_data data Input 32
add_interface_port avalon_streaming_sink in_valid valid Input 1
add_interface_port avalon_streaming_sink in_ready ready Output 1
add_interface_port avalon_streaming_sink in_startofpacket startofpacket Input 1
add_interface_port avalon_streaming_sink in_endofpacket endofpacket Input 1
add_interface_port avalon_streaming_sink in_empty empty Input 2
