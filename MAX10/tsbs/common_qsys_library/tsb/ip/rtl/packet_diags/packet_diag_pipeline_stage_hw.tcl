# (C) 2001-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# $File: //acds/rel/14.1/ip/avalon_st/packet_diag_pipeline_stage/packet_diag_pipeline_stage_hw.tcl $
# $Revision: #1 $
# $Date: 2014/10/06 $
# $Author: swbranch $
#------------------------------------------------------------------------------

# +-----------------------------------
# | request TCL package from ACDS 9.1
# | 
package require -exact qsys 12.1
# | 
# +-----------------------------------

# +-----------------------------------
# | module packet_diag_pipeline_stage
# | 
set_module_property NAME packet_diag_pipeline_stage
set_module_property VERSION 14.1
set_module_property INTERNAL false
set_module_property GROUP "Basic Functions/Bridges and Adaptors/Streaming"
set_module_property DISPLAY_NAME "Packet_Diagnostics"
set_module_property DESCRIPTION "Inserts a single pipeline (register) stage in the Avalon-ST command and response datapaths. Receives data on its Avalon-ST sink interfaces and drives it unchanged on its Avalon-ST source interface."
set_module_property AUTHOR "Altera Corporation"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property ELABORATION_CALLBACK elaborate
set_module_property VALIDATION_CALLBACK validate
set_module_property ANALYZE_HDL false
set_module_property HIDE_FROM_QUARTUS true
set_module_property DATASHEET_URL http://www.altera.com/literature/hb/qts/qsys_interconnect.pdf
# | 
# +-----------------------------------

# Utility routines
proc _get_packet_width {} {
  set use_packets [ get_parameter_value USE_PACKETS ]
  set packet_width 0
  if {$use_packets} {
    set packet_width 2
  }
  return $packet_width
}

proc _get_empty_width {} {
  set use_empty [ get_parameter_value USE_EMPTY ]
  set empty_width 0
  if {$use_empty} {
    set symbols_per_beat [ get_parameter_value SYMBOLS_PER_BEAT ]
    set empty_width [ expr int(ceil(log($symbols_per_beat) / log(2))) ]
  }
  return $empty_width
}

# | Callbacks
# | 

proc validate {} {
  set use_empty [ get_parameter_value USE_EMPTY ]
  set use_packets [ get_parameter_value USE_PACKETS ]
  if {![string compare $use_empty true] && ![string compare $use_packets false]} {
    send_message error "empty is not available without use_packets"
  }

  set symbols_per_beat [ get_parameter_value SYMBOLS_PER_BEAT ]
  if {![string compare $use_empty true] && $symbols_per_beat == 1} {
    send_message error "empty is not available when symbols_per_beat == 1"
  }
  set bits_per_symbol [ get_parameter_value BITS_PER_SYMBOL ]

  # Compute the value of derived parameters.
  # (This is redundant with code in the HDL implementation; this supports
  # two usage models, 1) component in SOPC Builder, 2) direct HDL
  # instantiation.
  set packet_width [ _get_packet_width ] 
  set_parameter_value PACKET_WIDTH $packet_width
  set empty_width [ _get_empty_width ]
  set_parameter_value EMPTY_WIDTH $empty_width

  # Calculate the required payload data width for the packet_diag_pipeline_base
  # instance.  (The spec requires <= 2048.)
  set data_width [ expr $symbols_per_beat * $bits_per_symbol ]
  if { $data_width < 1 } {
    send_message error "Data Width less than 1 is not supported (SYMBOLS_PER_BEAT: $symbols_per_beat; BITS_PER_SYMBOL: $bits_per_symbol)"
  }
  set channel_width [ get_parameter_value CHANNEL_WIDTH ]
  set error_width [ get_parameter_value ERROR_WIDTH ]
  set payload_width [ 
    expr $data_width + $packet_width + $channel_width + $error_width + $empty_width
  ]
  if {$payload_width < 1 || $payload_width > 2048} {
    send_message error "Payload width $payload_width is not supported."
  }
}

proc elaborate {} {
  set symbols_per_beat [ get_parameter_value SYMBOLS_PER_BEAT ]
  set bits_per_symbol [ get_parameter_value BITS_PER_SYMBOL ]

  set_interface_property sink0 dataBitsPerSymbol $bits_per_symbol
  set_interface_property sink0 symbolsPerBeat $symbols_per_beat
  set_interface_property source0 dataBitsPerSymbol $bits_per_symbol
  set_interface_property source0 symbolsPerBeat $symbols_per_beat

  set data_width [ expr $symbols_per_beat * $bits_per_symbol ]

  add_interface_port sink0 in_data data Input $data_width
  set_port_property  in_data vhdl_type std_logic_vector
  add_interface_port source0 out_data data Output $data_width 
  set_port_property  out_data vhdl_type std_logic_vector

  set channel_width [ get_parameter_value CHANNEL_WIDTH ]
  if {$channel_width > 0} {
    set max [ expr (-1 + (1 << $channel_width)) ]

    add_interface_port source0 out_channel channel Output $channel_width
	set_port_property  out_channel vhdl_type std_logic_vector
    add_interface_port sink0 in_channel channel Input $channel_width
	set_port_property  in_channel vhdl_type std_logic_vector
  } else {
    add_interface_port source0 out_channel channel Output 1
    set_port_property out_channel vhdl_type std_logic_vector
    add_interface_port sink0 in_channel channel Input 1
    set_port_property in_channel vhdl_type std_logic_vector

    set_port_property out_channel TERMINATION true
    set_port_property in_channel TERMINATION true
    set_port_property in_channel TERMINATION_VALUE 0
  }

  set max [ get_parameter_value MAX_CHANNEL ]
  set_interface_property sink0 maxChannel $max
  set_interface_property source0 maxChannel $max

  set_port_property in_startofpacket WIDTH_EXPR 1
  set_port_property in_endofpacket WIDTH_EXPR 1
  set_port_property out_startofpacket WIDTH_EXPR 1
  set_port_property out_endofpacket WIDTH_EXPR 1
  if {[ get_parameter_value USE_PACKETS ]} {
  } else {
    set_port_property in_startofpacket TERMINATION true
    set_port_property in_startofpacket TERMINATION_VALUE 0
    set_port_property out_startofpacket TERMINATION true
    set_port_property in_endofpacket TERMINATION true
    set_port_property in_endofpacket TERMINATION_VALUE 0
    set_port_property out_endofpacket TERMINATION true
  }

  if {[ get_parameter_value USE_EMPTY ]} {
    set empty_width [ _get_empty_width ]
    set_port_property in_empty WIDTH_EXPR $empty_width
	set_port_property  in_empty vhdl_type std_logic_vector
    set_port_property out_empty WIDTH_EXPR $empty_width
	set_port_property  out_empty vhdl_type std_logic_vector
  } else {
    set_port_property in_empty WIDTH_EXPR 1
    set_port_property  in_empty vhdl_type std_logic_vector
    set_port_property out_empty WIDTH_EXPR 1
    set_port_property  out_empty vhdl_type std_logic_vector
    set_port_property in_empty TERMINATION true
    set_port_property in_empty TERMINATION_VALUE 0
    set_port_property out_empty TERMINATION true
  }

  set error_width [ get_parameter_value ERROR_WIDTH ]
  if {$error_width > 0} {
    set_port_property in_error WIDTH_EXPR $error_width
	set_port_property  in_error vhdl_type std_logic_vector
    set_port_property out_error WIDTH_EXPR $error_width
	set_port_property  out_error vhdl_type std_logic_vector
  } else {
    set_port_property in_error WIDTH_EXPR 1
    set_port_property  in_error vhdl_type std_logic_vector
    set_port_property out_error WIDTH_EXPR 1
    set_port_property  out_error vhdl_type std_logic_vector
    set_port_property in_error TERMINATION true
    set_port_property in_error TERMINATION_VALUE 0
    set_port_property out_error TERMINATION true
  }
  
  set num_counter_bits [ get_parameter_value NUM_OF_COUNTER_BITS ]
  set num_compared_packets [ get_parameter_value NUM_COMPARED_PACKETS ]
 
  add_interface_port snoop_interface packet_length_at_error                export Output $num_counter_bits
  add_interface_port snoop_interface num_packet_errors                     export Output $num_counter_bits
  add_interface_port snoop_interface found_valid_packet                    export Output $num_compared_packets
  add_interface_port snoop_interface found_valid_packet_pulse              export Output $num_compared_packets
  add_interface_port snoop_interface packet_length_error                   export Output 1
    
  
    add_interface_port snoop_interface sop_2_eop_reg                   export Output $num_counter_bits
    add_interface_port snoop_interface sop_2_sop_reg                   export Output $num_counter_bits
    add_interface_port snoop_interface valid_data_counter              export Output $num_counter_bits
    add_interface_port snoop_interface valid_data_counter_capture      export Output $num_counter_bits
    add_interface_port snoop_interface sop_2_eop_reg_capture           export Output $num_counter_bits
    add_interface_port snoop_interface sop_2_sop_reg_capture           export Output $num_counter_bits
    add_interface_port snoop_interface num_of_packets                  export Output $num_counter_bits
    add_interface_port snoop_interface currently_in_frame              export Output 1
    add_interface_port snoop_interface synced_control_reg              export Output 32
    add_interface_port snoop_interface reset_statistics_counters       export Output 1
    add_interface_port snoop_interface force_in_ready                  export Output 1
    add_interface_port snoop_interface in_ready_raw                    export Output 1
    add_interface_port snoop_interface one_pulse_reset                 export Output 1
  
add_interface_port snoop_interface  snoop_in_ready                 export Output   1
add_interface_port snoop_interface  snoop_in_valid                 export Output   1
add_interface_port snoop_interface  snoop_in_data                  export Output   $data_width

add_interface_port snoop_interface  snoop_in_startofpacket         export Output   1
add_interface_port snoop_interface  snoop_in_endofpacket           export Output   1
                                                                   
add_interface_port snoop_interface  snoop_out_ready                export Output   1
add_interface_port snoop_interface  snoop_out_valid                export Output   1
add_interface_port snoop_interface  snoop_out_data                 export Output   $data_width

add_interface_port snoop_interface  snoop_out_startofpacket        export Output   1
add_interface_port snoop_interface  snoop_out_endofpacket          export Output   1

 if {[ get_parameter_value USE_EMPTY ]} {
    set empty_width [ _get_empty_width ]
	add_interface_port snoop_interface  snoop_in_empty    export Output   $empty_width
    add_interface_port snoop_interface  snoop_out_empty   export Output   $empty_width
} else {
	add_interface_port snoop_interface  snoop_in_empty    export Output   1
    add_interface_port snoop_interface  snoop_out_empty   export Output   1
}


if {$error_width > 0} {
    add_interface_port snoop_interface  snoop_in_error               export Output   $error_width
    add_interface_port snoop_interface  snoop_out_error              export Output   $error_width
} else {
   add_interface_port snoop_interface  snoop_in_error                export Output   1
   add_interface_port snoop_interface  snoop_out_error               export Output   1
}
  
  
if {$channel_width > 0} {
add_interface_port snoop_interface  snoop_out_channel              export Output   $channel_width
add_interface_port snoop_interface  snoop_in_channel               export Output   $channel_width

} else {
add_interface_port snoop_interface  snoop_out_channel              export Output   1
add_interface_port snoop_interface  snoop_in_channel               export Output   1
}
  
}

# +-----------------------------------
# | files
# | 

add_fileset synthesis_fileset QUARTUS_SYNTH synth_callback_procedure
set_fileset_property synthesis_fileset TOP_LEVEL packet_diag_pipeline_stage 
add_fileset simulation_fileset SIM_VERILOG synth_callback_procedure
set_fileset_property simulation_fileset TOP_LEVEL packet_diag_pipeline_stage
add_fileset vhdl_fileset SIM_VHDL synth_callback_procedure_vhdl
set_fileset_property vhdl_fileset TOP_LEVEL packet_diag_pipeline_stage

proc synth_callback_procedure { entity_name } {
    add_fileset_file packet_diag_pipeline_stage.sv SYSTEM_VERILOG PATH "packet_diag_pipeline_stage.sv"
	add_fileset_file packet_diag_pipeline_base.v SYSTEM_VERILOG PATH "packet_diag_pipeline_base.v"
}

proc synth_callback_procedure_vhdl { entity_name } {
   if {1} {
      add_fileset_file mentor/packet_diag_pipeline_stage.sv SYSTEM_VERILOG_ENCRYPT PATH "mentor/packet_diag_pipeline_stage.sv" {MENTOR_SPECIFIC}
	  add_fileset_file mentor/packet_diag_pipeline_base.v SYSTEM_VERILOG_ENCRYPT PATH "mentor/packet_diag_pipeline_base.v" {MENTOR_SPECIFIC}
   }
   if {1} {
      add_fileset_file aldec/packet_diag_pipeline_stage.sv SYSTEM_VERILOG_ENCRYPT PATH "aldec/packet_diag_pipeline_stage.sv" {ALDEC_SPECIFIC}
	  add_fileset_file aldec/packet_diag_pipeline_base.v SYSTEM_VERILOG_ENCRYPT PATH "aldec/packet_diag_pipeline_base.v" {ALDEC_SPECIFIC}
   }
   if {0} {
      add_fileset_file cadence/packet_diag_pipeline_stage.sv SYSTEM_VERILOG_ENCRYPT PATH "cadence/packet_diag_pipeline_stage.sv" {CADENCE_SPECIFIC}
	  add_fileset_file cadence/packet_diag_pipeline_base.v SYSTEM_VERILOG_ENCRYPT PATH "cadence/packet_diag_pipeline_base.v" {CADENCE_SPECIFIC}
   }
   if {0} {
      add_fileset_file synopsys/packet_diag_pipeline_stage.sv SYSTEM_VERILOG_ENCRYPT PATH "synopsys/packet_diag_pipeline_stage.sv" {SYNOPSYS_SPECIFIC}
	  add_fileset_file synopsys/packet_diag_pipeline_base.v SYSTEM_VERILOG_ENCRYPT PATH "synopsys/packet_diag_pipeline_base.v" {SYNOPSYS_SPECIFIC}
   }    
}

# | 
# +-----------------------------------
# +-----------------------------------
# | parameters
# | 


add_parameter NUM_OF_COUNTER_BITS INTEGER 24
set_parameter_property NUM_OF_COUNTER_BITS DISPLAY_NAME "Num Counter Bits"
set_parameter_property NUM_OF_COUNTER_BITS DESCRIPTION {Num Counter Bits}
set_parameter_property NUM_OF_COUNTER_BITS UNITS None
set_parameter_property NUM_OF_COUNTER_BITS AFFECTS_GENERATION false
set_parameter_property NUM_OF_COUNTER_BITS IS_HDL_PARAMETER true
set_parameter_property NUM_OF_COUNTER_BITS ALLOWED_RANGES 1:256

add_parameter NUM_COMPARED_PACKETS INTEGER 1
set_parameter_property NUM_COMPARED_PACKETS DISPLAY_NAME "Num Compared Packets"
set_parameter_property NUM_COMPARED_PACKETS DESCRIPTION {Num Compared Packets}
set_parameter_property NUM_COMPARED_PACKETS UNITS None
set_parameter_property NUM_COMPARED_PACKETS AFFECTS_GENERATION false
set_parameter_property NUM_COMPARED_PACKETS IS_HDL_PARAMETER true
set_parameter_property NUM_COMPARED_PACKETS ALLOWED_RANGES 1:256

add_parameter DEFAULT_VALID_PACKET_LENGTH INTEGER 1024
set_parameter_property DEFAULT_VALID_PACKET_LENGTH DISPLAY_NAME "Default Valid Packet Length"
set_parameter_property DEFAULT_VALID_PACKET_LENGTH DESCRIPTION {Default Valid Packet Length}
set_parameter_property DEFAULT_VALID_PACKET_LENGTH UNITS None
set_parameter_property DEFAULT_VALID_PACKET_LENGTH AFFECTS_GENERATION false
set_parameter_property DEFAULT_VALID_PACKET_LENGTH IS_HDL_PARAMETER true

add_parameter SYMBOLS_PER_BEAT INTEGER 1
set_parameter_property SYMBOLS_PER_BEAT DISPLAY_NAME "Symbols per beat"
set_parameter_property SYMBOLS_PER_BEAT DESCRIPTION {Symbols per beat}
set_parameter_property SYMBOLS_PER_BEAT UNITS None
set_parameter_property SYMBOLS_PER_BEAT AFFECTS_GENERATION false
set_parameter_property SYMBOLS_PER_BEAT IS_HDL_PARAMETER true
set_parameter_property SYMBOLS_PER_BEAT ALLOWED_RANGES 1:256
add_parameter BITS_PER_SYMBOL INTEGER 8
set_parameter_property BITS_PER_SYMBOL DISPLAY_NAME "Bits per symbol"
set_parameter_property BITS_PER_SYMBOL DESCRIPTION {Bits per symbol}
set_parameter_property BITS_PER_SYMBOL UNITS None
set_parameter_property BITS_PER_SYMBOL AFFECTS_GENERATION false
set_parameter_property BITS_PER_SYMBOL IS_HDL_PARAMETER true
set_parameter_property BITS_PER_SYMBOL ALLOWED_RANGES 1:2048

add_parameter          ENABLE_PACKET_STATISTICS INTEGER 1 "If enabled, include packet statistics; otherwise, this is only a pipeline stage"
set_parameter_property ENABLE_PACKET_STATISTICS DISPLAY_NAME "Enable Packet Statistics Gathering"
set_parameter_property ENABLE_PACKET_STATISTICS DISPLAY_HINT boolean
set_parameter_property ENABLE_PACKET_STATISTICS UNITS None
set_parameter_property ENABLE_PACKET_STATISTICS AFFECTS_GENERATION false
set_parameter_property ENABLE_PACKET_STATISTICS AFFECTS_ELABORATION true
set_parameter_property ENABLE_PACKET_STATISTICS GROUP "Packet options"
set_parameter_property ENABLE_PACKET_STATISTICS IS_HDL_PARAMETER true



add_parameter USE_PACKETS INTEGER 0 "If enabled, include optional startofpacket and endofpacket signals"
set_parameter_property USE_PACKETS DISPLAY_NAME "Use packets"
set_parameter_property USE_PACKETS DISPLAY_HINT boolean
set_parameter_property USE_PACKETS UNITS None
set_parameter_property USE_PACKETS AFFECTS_GENERATION false
set_parameter_property USE_PACKETS AFFECTS_ELABORATION true
set_parameter_property USE_PACKETS GROUP "Packet options"
set_parameter_property USE_PACKETS IS_HDL_PARAMETER true
add_parameter USE_EMPTY INTEGER 0 "If enabled, include optional empty signal"
set_parameter_property USE_EMPTY DISPLAY_NAME "Use empty"
set_parameter_property USE_EMPTY UNITS None
set_parameter_property USE_EMPTY DISPLAY_HINT boolean
set_parameter_property USE_EMPTY AFFECTS_GENERATION false
set_parameter_property USE_EMPTY AFFECTS_ELABORATION true
set_parameter_property USE_EMPTY GROUP "Packet options"
set_parameter_property USE_EMPTY IS_HDL_PARAMETER true
add_parameter EMPTY_WIDTH INTEGER 0
set_parameter_property EMPTY_WIDTH DISPLAY_NAME "Empty width"
set_parameter_property EMPTY_WIDTH DESCRIPTION {Displays the automatically calculated width of the Avalon-ST empty signal for the pipeline stage.}
set_parameter_property EMPTY_WIDTH UNITS None
set_parameter_property EMPTY_WIDTH AFFECTS_GENERATION false
set_parameter_property EMPTY_WIDTH AFFECTS_ELABORATION true
set_parameter_property EMPTY_WIDTH IS_HDL_PARAMETER true
set_parameter_property EMPTY_WIDTH DERIVED true
set_parameter_property EMPTY_WIDTH GROUP "Derived parameters"
add_parameter CHANNEL_WIDTH INTEGER 0 "If non-zero, include optional channel signal"
set_parameter_property CHANNEL_WIDTH DISPLAY_NAME "Channel width"
set_parameter_property CHANNEL_WIDTH UNITS None
set_parameter_property CHANNEL_WIDTH AFFECTS_GENERATION false
set_parameter_property CHANNEL_WIDTH AFFECTS_ELABORATION true
set_parameter_property CHANNEL_WIDTH IS_HDL_PARAMETER true
set_parameter_property CHANNEL_WIDTH ALLOWED_RANGES 0:31

add_parameter MAX_CHANNEL INTEGER 0 "Sets the maximum channel value on the source and sink interfaces"
set_parameter_property MAX_CHANNEL DISPLAY_NAME "Maximum channel value"
set_parameter_property MAX_CHANNEL AFFECTS_ELABORATION true
set_parameter_property MAX_CHANNEL AFFECTS_GENERATION false
set_parameter_property MAX_CHANNEL IS_HDL_PARAMETER false
set_parameter_property MAX_CHANNEL ALLOWED_RANGES 0:2147483647

add_parameter PACKET_WIDTH INTEGER 0
set_parameter_property PACKET_WIDTH DISPLAY_NAME "Packet width"
set_parameter_property PACKET_WIDTH DESCRIPTION {Display the automatically calculated width of the Avalon-ST packet signals for the pipeline stage (sop + eop + empty_width).}
set_parameter_property PACKET_WIDTH UNITS None
set_parameter_property PACKET_WIDTH AFFECTS_GENERATION false
set_parameter_property PACKET_WIDTH AFFECTS_ELABORATION true
set_parameter_property PACKET_WIDTH IS_HDL_PARAMETER true
set_parameter_property PACKET_WIDTH DERIVED true
set_parameter_property PACKET_WIDTH GROUP "Derived parameters"
add_parameter ERROR_WIDTH INTEGER 0 "If non-zero, include optional error signal"
set_parameter_property ERROR_WIDTH DISPLAY_NAME "Error width"
set_parameter_property ERROR_WIDTH UNITS None
set_parameter_property ERROR_WIDTH AFFECTS_GENERATION false
set_parameter_property ERROR_WIDTH AFFECTS_ELABORATION true
set_parameter_property ERROR_WIDTH IS_HDL_PARAMETER true
set_parameter_property ERROR_WIDTH ALLOWED_RANGES 0:255
add_parameter PIPELINE_READY INTEGER 1 "If cleared, instantiate single stage pipeline"
set_parameter_property PIPELINE_READY DISPLAY_NAME "Pipeline ready signal"
set_parameter_property PIPELINE_READY DISPLAY_HINT boolean
set_parameter_property PIPELINE_READY UNITS None
set_parameter_property PIPELINE_READY AFFECTS_GENERATION false
set_parameter_property PIPELINE_READY AFFECTS_ELABORATION true
set_parameter_property PIPELINE_READY IS_HDL_PARAMETER true
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point cr0
# | 
add_interface cr0 clock end
set_interface_property cr0 ptfSchematicName ""

set_interface_property cr0 ENABLED true
set_interface_property cr0 EXPORT_OF true

add_interface_port cr0 clk clk Input 1
add_interface_port cr0 reset reset Input 1
# | 
# +-----------------------------------


# +-----------------------------------
# | connection point sink0
# | 
add_interface sink0 avalon_streaming end
set_interface_property sink0 dataBitsPerSymbol 1
set_interface_property sink0 errorDescriptor ""
set_interface_property sink0 readyLatency 0
set_interface_property sink0 symbolsPerBeat 1

set_interface_property sink0 ASSOCIATED_CLOCK cr0
set_interface_property sink0 ENABLED true
set_interface_property sink0 EXPORT_OF true

# | 
# +-----------------------------------

# +-----------------------------------
# | connection point source0
# | 
add_interface source0 avalon_streaming start
set_interface_property source0 dataBitsPerSymbol 1
set_interface_property source0 errorDescriptor ""
set_interface_property source0 readyLatency 0
set_interface_property source0 symbolsPerBeat 1

set_interface_property source0 ASSOCIATED_CLOCK cr0
set_interface_property source0 ENABLED true
set_interface_property source0 EXPORT_OF true

# | 
# +-----------------------------------


# Add always-present ports ready, valid, data.
add_interface_port sink0 in_ready ready Output 1
add_interface_port sink0 in_valid valid Input 1
add_interface_port sink0 in_data data Input 1
add_interface_port source0 out_ready ready Input 1
add_interface_port source0 out_valid valid Output 1
add_interface_port source0 out_data data Output 1


# For all optional ports: add and terminate, supplying termination value for
# inputs.  If an optional port turns out to exist, the elaboration callback
# will 1) unterminate the port, 2) set its width.
# Add and terminate channel ports

# Add and terminate sop, eop ports.
add_interface_port sink0 in_startofpacket startofpacket Input 1
add_interface_port sink0 in_endofpacket endofpacket Input 1
add_interface_port source0 out_startofpacket startofpacket Output 1
add_interface_port source0 out_endofpacket endofpacket Output 1

# Add and terminate empty ports.
add_interface_port sink0 in_empty empty Input 1
add_interface_port source0 out_empty empty Output 1

# Add and terminate error ports.
add_interface_port source0 out_error error Output 1
add_interface_port sink0 in_error error Input 1


        # +-----------------------------------
		# | connection point avalon_mm_slave
		# | 
		add_interface avalon_mm_slave avalon end
		set_interface_property avalon_mm_slave addressAlignment DYNAMIC
		set_interface_property avalon_mm_slave associatedClock avalon_mm_clk
		set_interface_property avalon_mm_slave associatedReset avalon_mm_reset
		set_interface_property avalon_mm_slave bridgesToMaster ""
		set_interface_property avalon_mm_slave burstOnBurstBoundariesOnly false
		#set_interface_property avalon_mm_slave explicitAddressSpan 64
		set_interface_property avalon_mm_slave holdTime 0
		set_interface_property avalon_mm_slave isBigEndian  false
		set_interface_property avalon_mm_slave isFlash false
		set_interface_property avalon_mm_slave isMemoryDevice false
		set_interface_property avalon_mm_slave isNonVolatileStorage false
		set_interface_property avalon_mm_slave linewrapBursts false
		set_interface_property avalon_mm_slave maximumPendingReadTransactions 0
		set_interface_property avalon_mm_slave minimumUninterruptedRunLength 1
		set_interface_property avalon_mm_slave printableDevice false
		set_interface_property avalon_mm_slave readLatency 1
		set_interface_property avalon_mm_slave readWaitTime 0
		set_interface_property avalon_mm_slave setupTime 0
		set_interface_property avalon_mm_slave timingUnits cycles
		set_interface_property avalon_mm_slave writeWaitTime 0

		add_interface_port avalon_mm_slave address address Input 6
		add_interface_port avalon_mm_slave byteenable byteenable Input 4
		add_interface_port avalon_mm_slave read read Input 1
		add_interface_port avalon_mm_slave write write Input 1
		add_interface_port avalon_mm_slave writedata writedata Input 32
		add_interface_port avalon_mm_slave readdata readdata Output 32

		
		
# +-----------------------------------
# | connection point avalon_mm clk
# | 
add_interface avalon_mm_clk clock end
set_interface_property avalon_mm_clk enabled true

add_interface_port avalon_mm_clk avalon_mm_clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# | 
add_interface avalon_mm_reset reset end
set_interface_property avalon_mm_reset associatedClock avalon_mm_clk
set_interface_property avalon_mm_reset enabled true
set_interface_property avalon_mm_reset synchronousEdges DEASSERT

add_interface_port avalon_mm_reset avalon_mm_reset reset Input 1
# | 
# +-----------------------------------

	add_interface snoop_interface conduit end
	set_interface_property snoop_interface associatedReset reset
	set_interface_property snoop_interface ENABLED true
