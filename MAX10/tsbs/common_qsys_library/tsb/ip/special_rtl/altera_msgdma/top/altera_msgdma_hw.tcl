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


# $Id: //acds/rel/14.1/ip/altera_msgdma/top/altera_msgdma_hw.tcl#1 $
# $Revision: #1 $
# $Date: 2014/10/06 $
# $Author: swbranch $

# +-----------------------------------
# | 
# | altera_msgdma "Modular Scatter-Gather Direct Memory Access"
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package
# |
package require -exact qsys 13.1
# |
# +-----------------------------------

# +-----------------------------------
# | module altera_msgdma
# | 
set_module_property DESCRIPTION "Modular SGDMA with configuration mode of Avalon-MM to Avalon-MM, Avalon-MM to Avalon-ST, or Avalon-ST to Avalon-MM data paths"
set_module_property NAME altera_msgdma
set_module_property VERSION 14.1
set_module_property INTERNAL false
set_module_property HIDE_FROM_QUARTUS true
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Basic Functions/DMA"
set_module_property AUTHOR "Altera Corporation"
set_module_property DISPLAY_NAME "Modular Scatter-Gather DMA"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL true
set_module_property REPORT_TO_TALKBACK false
set_module_property VALIDATION_CALLBACK do_validate
set_module_property COMPOSITION_CALLBACK do_compose
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
add_parameter MODE INTEGER 0
set_parameter_property MODE DISPLAY_NAME "DMA Mode"
set_parameter_property MODE UNITS None
set_parameter_property MODE ALLOWED_RANGES { "0:Memory-Mapped to Memory-Mapped" "1:Memory-Mapped to Streaming" "2:Streaming to Memory-Mapped" }
set_parameter_property MODE AFFECTS_ELABORATION true
set_parameter_property MODE AFFECTS_GENERATION true
set_parameter_property MODE DERIVED false
set_parameter_property MODE HDL_PARAMETER false
set_parameter_property MODE GROUP "DMA Settings"

add_parameter DATA_WIDTH INTEGER 32 "Width of the data path. This impacts both Avalon MM as well as Avalon ST"
set_parameter_property DATA_WIDTH ALLOWED_RANGES {8 16 32 64 128 256 512 1024}
set_parameter_property DATA_WIDTH DISPLAY_NAME "Data Width"
set_parameter_property DATA_WIDTH AFFECTS_GENERATION true
set_parameter_property DATA_WIDTH DERIVED false
set_parameter_property DATA_WIDTH HDL_PARAMETER false
set_parameter_property DATA_WIDTH AFFECTS_ELABORATION true
set_parameter_property DATA_WIDTH GROUP "DMA Settings"

add_parameter DATA_FIFO_DEPTH INTEGER 32 "Depth of the internal data FIFO."
set_parameter_property DATA_FIFO_DEPTH ALLOWED_RANGES {16 32 64 128 256 512 1024 2048 4096}
set_parameter_property DATA_FIFO_DEPTH DISPLAY_NAME "Data Path FIFO Depth"
set_parameter_property DATA_FIFO_DEPTH DERIVED false
set_parameter_property DATA_FIFO_DEPTH AFFECTS_GENERATION true
set_parameter_property DATA_FIFO_DEPTH HDL_PARAMETER false
set_parameter_property DATA_FIFO_DEPTH AFFECTS_ELABORATION true
set_parameter_property DATA_FIFO_DEPTH GROUP "DMA Settings"

add_parameter DESCRIPTOR_FIFO_DEPTH INTEGER 128
set_parameter_property DESCRIPTOR_FIFO_DEPTH DISPLAY_NAME "Descriptor FIFO Depth"
set_parameter_property DESCRIPTOR_FIFO_DEPTH UNITS None
set_parameter_property DESCRIPTOR_FIFO_DEPTH ALLOWED_RANGES { 8 16 32 64 128 256 512 1024 }
set_parameter_property DESCRIPTOR_FIFO_DEPTH AFFECTS_ELABORATION true
set_parameter_property DESCRIPTOR_FIFO_DEPTH AFFECTS_GENERATION true
set_parameter_property DESCRIPTOR_FIFO_DEPTH DERIVED false
set_parameter_property DESCRIPTOR_FIFO_DEPTH HDL_PARAMETER false
set_parameter_property DESCRIPTOR_FIFO_DEPTH GROUP "DMA Settings"

add_parameter RESPONSE_PORT INTEGER 2
set_parameter_property RESPONSE_PORT DISPLAY_NAME "Response Port"
set_parameter_property RESPONSE_PORT UNITS None
set_parameter_property RESPONSE_PORT AFFECTS_ELABORATION true
set_parameter_property RESPONSE_PORT AFFECTS_GENERATION true
set_parameter_property RESPONSE_PORT DERIVED false
set_parameter_property RESPONSE_PORT HDL_PARAMETER false
set_parameter_property RESPONSE_PORT ALLOWED_RANGES { "0:Memory-Mapped" "1:Streaming" "2:Disabled" }
set_parameter_property RESPONSE_PORT GROUP "DMA Settings"

add_parameter MAX_BYTE INTEGER 1024 "Maximum transfer length"
set_parameter_property MAX_BYTE UNITS {None}
set_parameter_property MAX_BYTE ALLOWED_RANGES {"1024:1KB" "2048:2KB" "4096:4KB" "8192:8KB" "16384:16KB" "32768:32KB" "65536:64KB" "131072:128KB" "262144:256KB" "524288:512KB" "1048576:1MB" "2097152:2MB" "4194304:4MB" "8388608:8MB" "16777216:16MB" "33554432:32MB" "67108864:64MB" "134217728:128MB" "368435456:256MB" "536870912:512MB" "1073741824:1GB" "2147483647:2GB"}
set_parameter_property MAX_BYTE DISPLAY_NAME "Maximum Transfer Length"
set_parameter_property MAX_BYTE AFFECTS_GENERATION true
set_parameter_property MAX_BYTE DERIVED false
set_parameter_property MAX_BYTE HDL_PARAMETER false
set_parameter_property MAX_BYTE AFFECTS_ELABORATION true
set_parameter_property MAX_BYTE GROUP "DMA Settings"

# Need to figure out how the set the 3 transfer types of read/write masters
add_parameter TRANSFER_TYPE STRING "Aligned Accesses" "Setting the access types will allow you to reduce the hardware footprint and increase the fmax when unnecessary features like unaligned accesses are not necessary for your system."
set_parameter_property TRANSFER_TYPE ALLOWED_RANGES { "Full Word Accesses Only" "Aligned Accesses" "Unaligned Accesses" }
set_parameter_property TRANSFER_TYPE DISPLAY_NAME "Transfer Type"
set_parameter_property TRANSFER_TYPE DISPLAY_HINT radio
set_parameter_property TRANSFER_TYPE AFFECTS_GENERATION true
set_parameter_property TRANSFER_TYPE DERIVED false
set_parameter_property TRANSFER_TYPE HDL_PARAMETER false
set_parameter_property TRANSFER_TYPE AFFECTS_ELABORATION true
set_parameter_property TRANSFER_TYPE GROUP "DMA Settings"

add_parameter BURST_ENABLE INTEGER 0 "Burst enable will turn on the bursting capabilities of the read master.  Bursting must not be enabled when stride is also enabled."
set_parameter_property BURST_ENABLE DISPLAY_NAME "Burst Enable"
set_parameter_property BURST_ENABLE DISPLAY_HINT boolean
set_parameter_property BURST_ENABLE AFFECTS_GENERATION true
set_parameter_property BURST_ENABLE HDL_PARAMETER false
set_parameter_property BURST_ENABLE DERIVED false
set_parameter_property BURST_ENABLE AFFECTS_ELABORATION true
set_parameter_property BURST_ENABLE GROUP "DMA Settings"

add_parameter MAX_BURST_COUNT INTEGER 2 "Maximum burst count."
set_parameter_property MAX_BURST_COUNT ALLOWED_RANGES {2 4 8 16 32 64 128 256 512 1024}
set_parameter_property MAX_BURST_COUNT DISPLAY_NAME "Maximum Burst Count"
set_parameter_property MAX_BURST_COUNT AFFECTS_GENERATION true
set_parameter_property MAX_BURST_COUNT HDL_PARAMETER false
set_parameter_property MAX_BURST_COUNT DERIVED false
set_parameter_property MAX_BURST_COUNT AFFECTS_ELABORATION true
set_parameter_property MAX_BURST_COUNT GROUP "DMA Settings"

add_parameter BURST_WRAPPING_SUPPORT INTEGER 0 "Enable to force the read master to align to the next burst boundary.  This setting must be enabled when the read master is connected to burst wrapping slave ports (SDRAM for example).  You cannot use this setting and programmable burst capabilities concurrently."
set_parameter_property BURST_WRAPPING_SUPPORT DISPLAY_NAME "Force Burst Alignment Enable"
set_parameter_property BURST_WRAPPING_SUPPORT DISPLAY_HINT boolean
set_parameter_property BURST_WRAPPING_SUPPORT AFFECTS_GENERATION true
set_parameter_property BURST_WRAPPING_SUPPORT HDL_PARAMETER false
set_parameter_property BURST_WRAPPING_SUPPORT DERIVED false
set_parameter_property BURST_WRAPPING_SUPPORT AFFECTS_ELABORATION true
set_parameter_property BURST_WRAPPING_SUPPORT GROUP "DMA Settings"

add_parameter ENHANCED_FEATURES INTEGER 0
set_parameter_property ENHANCED_FEATURES DISPLAY_NAME "Enable Extended Feature Support"
set_parameter_property ENHANCED_FEATURES UNITS None
set_parameter_property ENHANCED_FEATURES AFFECTS_ELABORATION true
set_parameter_property ENHANCED_FEATURES AFFECTS_GENERATION true
set_parameter_property ENHANCED_FEATURES HDL_PARAMETER false
set_parameter_property ENHANCED_FEATURES DERIVED false
set_parameter_property ENHANCED_FEATURES DISPLAY_HINT boolean
set_parameter_property ENHANCED_FEATURES GROUP "Extended Feature Options"

add_parameter STRIDE_ENABLE Integer 0 "Enable stride to control the address incrementing, when off the master increments the address sequentially
one word at a time.  Stride cannot be used with burst capabilities enabled."
set_parameter_property STRIDE_ENABLE DISPLAY_NAME "Stride Addressing Enable"
set_parameter_property STRIDE_ENABLE DISPLAY_HINT boolean
set_parameter_property STRIDE_ENABLE AFFECTS_GENERATION true
set_parameter_property STRIDE_ENABLE DERIVED false
set_parameter_property STRIDE_ENABLE HDL_PARAMETER false
set_parameter_property STRIDE_ENABLE AFFECTS_ELABORATION true
set_parameter_property STRIDE_ENABLE GROUP "Extended Feature Options"

add_parameter MAX_STRIDE INTEGER 1  "Set the stride words (size of data width) for whatever maximum address increment you want to use.  A stride of 0 performs fixed accesses, 1 performs sequential, 2 reads from every other word/data size, etc..."
set_parameter_property MAX_STRIDE ALLOWED_RANGES 1:32768
set_parameter_property MAX_STRIDE DISPLAY_NAME "Maximum Stride Words"
set_parameter_property MAX_STRIDE AFFECTS_GENERATION true
set_parameter_property MAX_STRIDE DERIVED false
set_parameter_property MAX_STRIDE HDL_PARAMETER false
set_parameter_property MAX_STRIDE AFFECTS_ELABORATION true
set_parameter_property MAX_STRIDE GROUP "Extended Feature Options"

add_parameter PROGRAMMABLE_BURST_ENABLE INTEGER 0 "Enable re-programming of the maximum burst count.  Burst counts can only be reprogrammed between 2-128.  Make sure the maximum burst count is set large enough for the burst counts you want to re-program.  You cannot use this setting and burst alignment support concurrently."
set_parameter_property PROGRAMMABLE_BURST_ENABLE DISPLAY_NAME "Programmable Burst Enable"
set_parameter_property PROGRAMMABLE_BURST_ENABLE DISPLAY_HINT boolean
set_parameter_property PROGRAMMABLE_BURST_ENABLE AFFECTS_GENERATION true
set_parameter_property PROGRAMMABLE_BURST_ENABLE HDL_PARAMETER false
set_parameter_property PROGRAMMABLE_BURST_ENABLE DERIVED false
set_parameter_property PROGRAMMABLE_BURST_ENABLE AFFECTS_ELABORATION true
set_parameter_property PROGRAMMABLE_BURST_ENABLE GROUP "Extended Feature Options"

add_parameter STRIDE_ENABLE_DERIVED INTEGER 0 "Derived Enable stride support for internal use."
set_parameter_property STRIDE_ENABLE_DERIVED DISPLAY_NAME "Stride Enable"
set_parameter_property STRIDE_ENABLE_DERIVED DISPLAY_HINT boolean
set_parameter_property STRIDE_ENABLE_DERIVED AFFECTS_GENERATION true
set_parameter_property STRIDE_ENABLE_DERIVED DERIVED true
set_parameter_property STRIDE_ENABLE_DERIVED HDL_PARAMETER false
set_parameter_property STRIDE_ENABLE_DERIVED AFFECTS_ELABORATION true
set_parameter_property STRIDE_ENABLE_DERIVED VISIBLE false

# following parameters are for the data streaming port of the master
add_parameter PACKET_ENABLE INTEGER 0 "Enable packet support to add packetized streaming outputs."
set_parameter_property PACKET_ENABLE DISPLAY_NAME "Packet Support Enable"
set_parameter_property PACKET_ENABLE DISPLAY_HINT boolean
set_parameter_property PACKET_ENABLE AFFECTS_GENERATION true
set_parameter_property PACKET_ENABLE DERIVED false
set_parameter_property PACKET_ENABLE HDL_PARAMETER false
set_parameter_property PACKET_ENABLE AFFECTS_ELABORATION true
set_parameter_property PACKET_ENABLE GROUP "Streaming Options"

add_parameter PACKET_ENABLE_DERIVED INTEGER 0 "Derived Enable packet support for internal use."
set_parameter_property PACKET_ENABLE_DERIVED DISPLAY_NAME "Packet Support Enable"
set_parameter_property PACKET_ENABLE_DERIVED DISPLAY_HINT boolean
set_parameter_property PACKET_ENABLE_DERIVED AFFECTS_GENERATION true
set_parameter_property PACKET_ENABLE_DERIVED DERIVED true
set_parameter_property PACKET_ENABLE_DERIVED HDL_PARAMETER false
set_parameter_property PACKET_ENABLE_DERIVED AFFECTS_ELABORATION true
set_parameter_property PACKET_ENABLE_DERIVED VISIBLE false

add_parameter ERROR_ENABLE Integer 0 "Enable error support to include a streaming error output."
set_parameter_property ERROR_ENABLE DISPLAY_NAME "Error Enable"
set_parameter_property ERROR_ENABLE DISPLAY_HINT boolean
set_parameter_property ERROR_ENABLE AFFECTS_GENERATION true
set_parameter_property ERROR_ENABLE DERIVED false
set_parameter_property ERROR_ENABLE HDL_PARAMETER false
set_parameter_property ERROR_ENABLE AFFECTS_ELABORATION true
set_parameter_property ERROR_ENABLE GROUP "Streaming Options"

add_parameter ERROR_ENABLE_DERIVED Integer 0 "Derived Enable error support for internal use."
set_parameter_property ERROR_ENABLE_DERIVED DISPLAY_NAME "Error Enable"
set_parameter_property ERROR_ENABLE_DERIVED DISPLAY_HINT boolean
set_parameter_property ERROR_ENABLE_DERIVED AFFECTS_GENERATION true
set_parameter_property ERROR_ENABLE_DERIVED DERIVED true
set_parameter_property ERROR_ENABLE_DERIVED HDL_PARAMETER false
set_parameter_property ERROR_ENABLE_DERIVED AFFECTS_ELABORATION true
set_parameter_property ERROR_ENABLE_DERIVED VISIBLE false

add_parameter ERROR_WIDTH INTEGER 8 "Set the error width according to the number of error lines connected to the data source port."
set_parameter_property ERROR_WIDTH ALLOWED_RANGES {1 2 3 4 5 6 7 8}
set_parameter_property ERROR_WIDTH DISPLAY_NAME "Error Width"
set_parameter_property ERROR_WIDTH AFFECTS_GENERATION true
set_parameter_property ERROR_WIDTH DERIVED false
set_parameter_property ERROR_WIDTH HDL_PARAMETER false
set_parameter_property ERROR_WIDTH AFFECTS_ELABORATION true
set_parameter_property ERROR_WIDTH GROUP "Streaming Options"

add_parameter CHANNEL_ENABLE INTEGER 0 "Enable channel support to include a channel output."
set_parameter_property CHANNEL_ENABLE DISPLAY_NAME "Channel Enable"
set_parameter_property CHANNEL_ENABLE DISPLAY_HINT boolean
set_parameter_property CHANNEL_ENABLE AFFECTS_GENERATION true
set_parameter_property CHANNEL_ENABLE DERIVED false
set_parameter_property CHANNEL_ENABLE HDL_PARAMETER false
set_parameter_property CHANNEL_ENABLE AFFECTS_ELABORATION true
set_parameter_property CHANNEL_ENABLE GROUP "Streaming Options"

add_parameter CHANNEL_ENABLE_DERIVED INTEGER 0 "Derived Enable channel support for internal use."
set_parameter_property CHANNEL_ENABLE_DERIVED DISPLAY_NAME "Channel Enable"
set_parameter_property CHANNEL_ENABLE_DERIVED DISPLAY_HINT boolean
set_parameter_property CHANNEL_ENABLE_DERIVED AFFECTS_GENERATION true
set_parameter_property CHANNEL_ENABLE_DERIVED DERIVED true
set_parameter_property CHANNEL_ENABLE_DERIVED HDL_PARAMETER false
set_parameter_property CHANNEL_ENABLE_DERIVED AFFECTS_ELABORATION true
set_parameter_property CHANNEL_ENABLE_DERIVED VISIBLE false

add_parameter CHANNEL_WIDTH INTEGER 8 "Set the channel width according to the number of channel lines connected to the data source port."
set_parameter_property CHANNEL_WIDTH ALLOWED_RANGES {1 2 3 4 5 6 7 8}
set_parameter_property CHANNEL_WIDTH DISPLAY_NAME "Channel Width"
set_parameter_property CHANNEL_WIDTH AFFECTS_GENERATION true
set_parameter_property CHANNEL_WIDTH DERIVED false
set_parameter_property CHANNEL_WIDTH HDL_PARAMETER false
set_parameter_property CHANNEL_WIDTH AFFECTS_ELABORATION true
set_parameter_property CHANNEL_WIDTH GROUP "Streaming Options"
# | 
# +-----------------------------------

# +-----------------------------------
# | Compose Callback procedure
# |
proc do_compose {} {

  set DMA_MODE					[ get_parameter_value MODE ]
  set DATA_WIDTH				[ get_parameter_value DATA_WIDTH ]
  set MAX_BYTE                  [ get_parameter_value MAX_BYTE ]
  set LENGTH_WIDTH				[ expr 1 + [ log2ceil $MAX_BYTE ] ]
  set DATA_FIFO_DEPTH			[ get_parameter_value DATA_FIFO_DEPTH ]
  set RESPONSE_PORT				[ get_parameter_value RESPONSE_PORT ]
  set DESCRIPTOR_FIFO_DEPTH		[ get_parameter_value DESCRIPTOR_FIFO_DEPTH ]
  set ENHANCED_FEATURES			[ get_parameter_value ENHANCED_FEATURES ]
  set STRIDE_ENABLE				[ get_parameter_value STRIDE_ENABLE ]
  set MAX_STRIDE				[ get_parameter_value MAX_STRIDE ]
  set STRIDE_WIDTH				[ log2ceil [ expr 1 + $MAX_STRIDE ] ]
  set BURST_ENABLE				[ get_parameter_value BURST_ENABLE ]
  set MAX_BURST_COUNT			[ get_parameter_value MAX_BURST_COUNT ]
  set PROGRAMMABLE_BURST_ENABLE [ get_parameter_value PROGRAMMABLE_BURST_ENABLE ]
  set BURST_WRAPPING_SUPPORT	[ get_parameter_value BURST_WRAPPING_SUPPORT ]
  set TRANSFER_TYPE				[ get_parameter_value TRANSFER_TYPE ]
  set PACKET_ENABLE				[ get_parameter_value PACKET_ENABLE ]
  set ERROR_ENABLE				[ get_parameter_value ERROR_ENABLE ]
  set ERROR_WIDTH				[ get_parameter_value ERROR_WIDTH ]
  set CHANNEL_ENABLE			[ get_parameter_value CHANNEL_ENABLE ]
  set CHANNEL_WIDTH				[ get_parameter_value CHANNEL_WIDTH ]
  set PACKET_ENABLE_DERIVED     [ get_parameter_value PACKET_ENABLE_DERIVED ]
  set ERROR_ENABLE_DERIVED      [ get_parameter_value ERROR_ENABLE_DERIVED ]
  set CHANNEL_ENABLE_DERIVED    [ get_parameter_value CHANNEL_ENABLE_DERIVED ]
  set STRIDE_ENABLE_DERIVED     [ get_parameter_value STRIDE_ENABLE_DERIVED ]
  
  # send_message info "From original max_byte: $MAX_BYTE"
  
  
# +-----------------------------------
# | Construct internal instances
# | 
  add_instance           cb_inst             altera_clock_bridge
  
  add_instance           rst_inst            altera_reset_bridge
  set_instance_parameter_value rst_inst      ACTIVE_LOW_RESET    1
  
  add_instance           dispatcher_internal modular_sgdma_dispatcher
  set_instance_parameter dispatcher_internal MODE                  $DMA_MODE
  set_instance_parameter dispatcher_internal GUI_RESPONSE_PORT     $RESPONSE_PORT
  set_instance_parameter dispatcher_internal DESCRIPTOR_FIFO_DEPTH $DESCRIPTOR_FIFO_DEPTH
  set_instance_parameter dispatcher_internal ENHANCED_FEATURES     $ENHANCED_FEATURES
  
  set_instance_parameter dispatcher_internal DATA_WIDTH            $DATA_WIDTH
  set_instance_parameter dispatcher_internal DATA_FIFO_DEPTH       $DATA_FIFO_DEPTH
  set_instance_parameter dispatcher_internal MAX_BYTE              $MAX_BYTE
  set_instance_parameter dispatcher_internal TRANSFER_TYPE         $TRANSFER_TYPE
  set_instance_parameter dispatcher_internal BURST_ENABLE          $BURST_ENABLE
  set_instance_parameter dispatcher_internal MAX_BURST_COUNT       $MAX_BURST_COUNT
  set_instance_parameter dispatcher_internal BURST_WRAPPING_SUPPORT $BURST_WRAPPING_SUPPORT
  set_instance_parameter dispatcher_internal STRIDE_ENABLE         $STRIDE_ENABLE
  set_instance_parameter dispatcher_internal MAX_STRIDE            $MAX_STRIDE
  set_instance_parameter dispatcher_internal PROGRAMMABLE_BURST_ENABLE $PROGRAMMABLE_BURST_ENABLE

  switch $DMA_MODE { 
  0 {
    add_instance           read_mstr_internal  dma_read_master
    set_instance_parameter read_mstr_internal  DATA_WIDTH                     $DATA_WIDTH
    set_instance_parameter read_mstr_internal  LENGTH_WIDTH                   $LENGTH_WIDTH
    set_instance_parameter read_mstr_internal  FIFO_DEPTH                     $DATA_FIFO_DEPTH
    set_instance_parameter read_mstr_internal  STRIDE_ENABLE                  $STRIDE_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  GUI_STRIDE_WIDTH               $STRIDE_WIDTH
    set_instance_parameter read_mstr_internal  BURST_ENABLE                   $BURST_ENABLE
    set_instance_parameter read_mstr_internal  GUI_MAX_BURST_COUNT            $MAX_BURST_COUNT
    set_instance_parameter read_mstr_internal  GUI_PROGRAMMABLE_BURST_ENABLE  $PROGRAMMABLE_BURST_ENABLE
    set_instance_parameter read_mstr_internal  GUI_BURST_WRAPPING_SUPPORT     $BURST_WRAPPING_SUPPORT
    set_instance_parameter read_mstr_internal  TRANSFER_TYPE                  $TRANSFER_TYPE
    set_instance_parameter read_mstr_internal  PACKET_ENABLE                  $PACKET_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  ERROR_ENABLE                   $ERROR_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  ERROR_WIDTH                    $ERROR_WIDTH
    set_instance_parameter read_mstr_internal  CHANNEL_ENABLE                 $CHANNEL_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  CHANNEL_WIDTH                  $CHANNEL_WIDTH
# test if CHANNEL ENABLE is true, what will be the connection between read_master and write master                                                                
																	  
    add_instance           write_mstr_internal dma_write_master               
    set_instance_parameter write_mstr_internal DATA_WIDTH                     $DATA_WIDTH
    set_instance_parameter write_mstr_internal LENGTH_WIDTH                   $LENGTH_WIDTH
    set_instance_parameter write_mstr_internal FIFO_DEPTH                     $DATA_FIFO_DEPTH
    set_instance_parameter write_mstr_internal STRIDE_ENABLE                  $STRIDE_ENABLE_DERIVED
    set_instance_parameter write_mstr_internal GUI_STRIDE_WIDTH               $STRIDE_WIDTH
    set_instance_parameter write_mstr_internal BURST_ENABLE                   $BURST_ENABLE
    set_instance_parameter write_mstr_internal GUI_MAX_BURST_COUNT            $MAX_BURST_COUNT
    set_instance_parameter write_mstr_internal GUI_PROGRAMMABLE_BURST_ENABLE  $PROGRAMMABLE_BURST_ENABLE
    set_instance_parameter write_mstr_internal GUI_BURST_WRAPPING_SUPPORT     $BURST_WRAPPING_SUPPORT
    set_instance_parameter write_mstr_internal TRANSFER_TYPE                  $TRANSFER_TYPE
    set_instance_parameter write_mstr_internal PACKET_ENABLE                  $PACKET_ENABLE_DERIVED
    set_instance_parameter write_mstr_internal ERROR_ENABLE                   $ERROR_ENABLE_DERIVED
    set_instance_parameter write_mstr_internal ERROR_WIDTH                    $ERROR_WIDTH
    }
  1 {
    add_instance           read_mstr_internal  dma_read_master
    set_instance_parameter read_mstr_internal  DATA_WIDTH                     $DATA_WIDTH
    set_instance_parameter read_mstr_internal  LENGTH_WIDTH                   $LENGTH_WIDTH
    set_instance_parameter read_mstr_internal  FIFO_DEPTH                     $DATA_FIFO_DEPTH
    set_instance_parameter read_mstr_internal  STRIDE_ENABLE                  $STRIDE_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  GUI_STRIDE_WIDTH               $STRIDE_WIDTH
    set_instance_parameter read_mstr_internal  BURST_ENABLE                   $BURST_ENABLE
    set_instance_parameter read_mstr_internal  GUI_MAX_BURST_COUNT            $MAX_BURST_COUNT
    set_instance_parameter read_mstr_internal  GUI_PROGRAMMABLE_BURST_ENABLE  $PROGRAMMABLE_BURST_ENABLE
    set_instance_parameter read_mstr_internal  GUI_BURST_WRAPPING_SUPPORT     $BURST_WRAPPING_SUPPORT
    set_instance_parameter read_mstr_internal  TRANSFER_TYPE                  $TRANSFER_TYPE
    set_instance_parameter read_mstr_internal  PACKET_ENABLE                  $PACKET_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  ERROR_ENABLE                   $ERROR_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  ERROR_WIDTH                    $ERROR_WIDTH
    set_instance_parameter read_mstr_internal  CHANNEL_ENABLE                 $CHANNEL_ENABLE_DERIVED
    set_instance_parameter read_mstr_internal  CHANNEL_WIDTH                  $CHANNEL_WIDTH
    }
  2 {
    add_instance           write_mstr_internal dma_write_master               
    set_instance_parameter write_mstr_internal DATA_WIDTH                     $DATA_WIDTH
    set_instance_parameter write_mstr_internal LENGTH_WIDTH                   $LENGTH_WIDTH
    set_instance_parameter write_mstr_internal FIFO_DEPTH                     $DATA_FIFO_DEPTH
    set_instance_parameter write_mstr_internal STRIDE_ENABLE                  $STRIDE_ENABLE_DERIVED
    set_instance_parameter write_mstr_internal GUI_STRIDE_WIDTH               $STRIDE_WIDTH
    set_instance_parameter write_mstr_internal BURST_ENABLE                   $BURST_ENABLE
    set_instance_parameter write_mstr_internal GUI_MAX_BURST_COUNT            $MAX_BURST_COUNT
    set_instance_parameter write_mstr_internal GUI_PROGRAMMABLE_BURST_ENABLE  $PROGRAMMABLE_BURST_ENABLE
    set_instance_parameter write_mstr_internal GUI_BURST_WRAPPING_SUPPORT     $BURST_WRAPPING_SUPPORT
    set_instance_parameter write_mstr_internal TRANSFER_TYPE                  $TRANSFER_TYPE
    set_instance_parameter write_mstr_internal PACKET_ENABLE                  $PACKET_ENABLE_DERIVED
    set_instance_parameter write_mstr_internal ERROR_ENABLE                   $ERROR_ENABLE_DERIVED
    set_instance_parameter write_mstr_internal ERROR_WIDTH                    $ERROR_WIDTH
    }
  }
# | 
# +----------------------------------- 
  
# +-----------------------------------
# | Export of external interfaces
# |   
  add_interface                clock         clock               end
  set_interface_property       clock         EXPORT_OF           cb_inst.in_clk
  
  add_interface                reset_n       reset               end
  set_interface_property       reset_n       EXPORT_OF           rst_inst.in_reset
  
  add_interface csr avalon end
  set_interface_property csr EXPORT_OF dispatcher_internal.CSR

  add_interface descriptor_slave avalon end
  set_interface_property descriptor_slave EXPORT_OF dispatcher_internal.Descriptor_Slave
  
  
  add_interface fifo_data_debug conduit conduit
  set_interface_property fifo_data_debug EXPORT_OF dispatcher_internal.fifo_data_debug


  switch $RESPONSE_PORT {
    0 {
      if {$DMA_MODE == 1} {
   	    send_message {info} "Response port is not avaible for MM-to-ST configuration"
      } else {
	    add_interface response avalon end
        set_interface_property response EXPORT_OF dispatcher_internal.Response_Slave
	  }
	  add_interface csr_irq interrupt end
	  set_interface_property csr_irq EXPORT_OF dispatcher_internal.csr_irq
	}
	1 {
	  if {$DMA_MODE == 1} {
	    add_interface csr_irq interrupt end
	    set_interface_property csr_irq EXPORT_OF dispatcher_internal.csr_irq
   	    send_message {info} "Response port is not avaible for MM-to-ST configuration"
      } else {
	    add_interface response avalon_streaming start
        set_interface_property response EXPORT_OF dispatcher_internal.Response_Source
	    add_interface csr_irq interrupt end
	    set_interface_property csr_irq EXPORT_OF dispatcher_internal.csr_irq
	  }
	}
    2 {
	  add_interface csr_irq interrupt end
  	  set_interface_property csr_irq EXPORT_OF dispatcher_internal.csr_irq
	  if {$DMA_MODE != 1} {
	    send_message {info} "Response information port is disabled. Enable the response port if data transfer information is required by host"
	  }
	}
  }
  
  switch $DMA_MODE {
    0 {
      add_interface mm_read avalon start
      set_interface_property mm_read EXPORT_OF read_mstr_internal.Data_Read_Master
      add_interface mm_write avalon start
      set_interface_property mm_write EXPORT_OF write_mstr_internal.Data_Write_Master
    }
    1 {
      add_interface mm_read avalon start
      set_interface_property mm_read EXPORT_OF read_mstr_internal.Data_Read_Master
      add_interface st_source avalon_streaming start
      set_interface_property st_source EXPORT_OF read_mstr_internal.Data_Source
    }
    2 {
      add_interface mm_write avalon start
      set_interface_property mm_write EXPORT_OF write_mstr_internal.Data_Write_Master
      add_interface st_sink avalon_streaming end
      set_interface_property st_sink EXPORT_OF write_mstr_internal.Data_Sink
    }
  }
# | 
# +----------------------------------- 
  
# +-----------------------------------
# | Internal Connections
# | 
  add_connection               cb_inst.out_clk                    rst_inst.clk               clock ""
  add_connection               cb_inst.out_clk                    dispatcher_internal.clock  clock ""
  add_connection               rst_inst.out_reset                 dispatcher_internal.clock_reset          

  switch $DMA_MODE {
    0 {
      add_connection               cb_inst.out_clk                    write_mstr_internal.Clock  clock ""
      add_connection               rst_inst.out_reset                 write_mstr_internal.Clock_reset          
      add_connection               cb_inst.out_clk                    read_mstr_internal.Clock  clock ""
      add_connection               rst_inst.out_reset                 read_mstr_internal.Clock_reset    
      add_connection               read_mstr_internal.Data_Source write_mstr_internal.Data_Sink
      add_connection               dispatcher_internal.Read_Command_Source read_mstr_internal.Command_Sink        
      add_connection               read_mstr_internal.Response_Source dispatcher_internal.Read_Response_Sink             
      add_connection               dispatcher_internal.Write_Command_Source write_mstr_internal.Command_Sink        
      add_connection               write_mstr_internal.Response_Source dispatcher_internal.Write_Response_Sink
    }
	1 {
	  add_connection               cb_inst.out_clk                    read_mstr_internal.Clock  clock ""
      add_connection               rst_inst.out_reset                 read_mstr_internal.Clock_reset 
	  add_connection               dispatcher_internal.Read_Command_Source read_mstr_internal.Command_Sink        
      add_connection               read_mstr_internal.Response_Source dispatcher_internal.Read_Response_Sink             
	}
	2 {
	  add_connection               cb_inst.out_clk                    write_mstr_internal.Clock  clock ""
      add_connection               rst_inst.out_reset                 write_mstr_internal.Clock_reset 
      add_connection               dispatcher_internal.Write_Command_Source write_mstr_internal.Command_Sink        
      add_connection               write_mstr_internal.Response_Source dispatcher_internal.Write_Response_Sink             	  
	}
  }
# | 
# +----------------------------------- 

}
# | 
# +----------------------------------- 

# +-----------------------------------
# | Validate Callback Procedure
# | 
proc do_validate {} {
   
  if { [get_parameter_value MODE] == 0 } {
      set_parameter_property PACKET_ENABLE ENABLED false
	  set_parameter_value PACKET_ENABLE_DERIVED 0
      set_parameter_property CHANNEL_ENABLE ENABLED false
	  set_parameter_value CHANNEL_ENABLE_DERIVED 0
      set_parameter_property ERROR_ENABLE ENABLED false
	  set_parameter_value ERROR_ENABLE_DERIVED 0
      set_parameter_property RESPONSE_PORT ENABLED true
  } elseif { [get_parameter_value MODE] == 1 } { 
      set_parameter_property PACKET_ENABLE ENABLED true
	  set_parameter_value PACKET_ENABLE_DERIVED [ get_parameter_value PACKET_ENABLE ]
      set_parameter_property ERROR_ENABLE ENABLED true
	  set_parameter_value ERROR_ENABLE_DERIVED [ get_parameter_value ERROR_ENABLE ]
      set_parameter_property CHANNEL_ENABLE ENABLED true
      set_parameter_value CHANNEL_ENABLE_DERIVED [ get_parameter_value CHANNEL_ENABLE ]
	  set_parameter_property RESPONSE_PORT ENABLED false
  } else {
	  set_parameter_property PACKET_ENABLE ENABLED true
	  set_parameter_value PACKET_ENABLE_DERIVED [ get_parameter_value PACKET_ENABLE ]
      set_parameter_property ERROR_ENABLE ENABLED true
	  set_parameter_value ERROR_ENABLE_DERIVED [ get_parameter_value ERROR_ENABLE ]
      set_parameter_property CHANNEL_ENABLE ENABLED false
      set_parameter_value CHANNEL_ENABLE_DERIVED 0
	  set_parameter_property RESPONSE_PORT ENABLED true
  }
	 
  if { [get_parameter_value ENHANCED_FEATURES] == 1 } { 
      set_parameter_property STRIDE_ENABLE ENABLED true
	  set_parameter_value STRIDE_ENABLE_DERIVED [ get_parameter_value STRIDE_ENABLE ]
  } else {
      set_parameter_property STRIDE_ENABLE ENABLED false
	  set_parameter_value STRIDE_ENABLE_DERIVED 0
  }
  
  if { [get_parameter_value BURST_ENABLE] == 1 }  {
    set_parameter_property MAX_BURST_COUNT ENABLED true
    set_parameter_property BURST_WRAPPING_SUPPORT ENABLED true
  } else {
    set_parameter_property MAX_BURST_COUNT ENABLED false
    set_parameter_property BURST_WRAPPING_SUPPORT ENABLED false
  }

  if { [get_parameter_value BURST_ENABLE] == 1 && [get_parameter_value ENHANCED_FEATURES] == 1 }  {
    set_parameter_property PROGRAMMABLE_BURST_ENABLE ENABLED true
  } else {
    set_parameter_property PROGRAMMABLE_BURST_ENABLE ENABLED false
  }
	
  if { [get_parameter_value STRIDE_ENABLE_DERIVED] == 1 }  {
    set_parameter_property MAX_STRIDE ENABLED true
  } else {
    set_parameter_property MAX_STRIDE ENABLED false
  }

  if { [get_parameter_value CHANNEL_ENABLE_DERIVED] == 1 }  {
    set_parameter_property CHANNEL_WIDTH ENABLED true
  } else {
    set_parameter_property CHANNEL_WIDTH ENABLED false
  }

  if { [get_parameter_value ERROR_ENABLE_DERIVED] == 1 }  {
    set_parameter_property ERROR_WIDTH ENABLED true
  } else {
    set_parameter_property ERROR_WIDTH ENABLED false
  }
  
  if { [get_parameter_value BURST_ENABLE] == 1 && [get_parameter_value BURST_WRAPPING_SUPPORT] == 1 }  {
    send_message {info} "Force burst alignment enable is selected. The mSGDMA will post bursts with length of 1 until the address reaches the next burst boundary"
  }

  # Add DTS paramters
  set_module_assignment embeddedsw.dts.vendor "altr"
  set_module_assignment embeddedsw.dts.group "msgdma"
  set_module_assignment embeddedsw.dts.name "msgdma"
  set_module_assignment embeddedsw.dts.compatible "altr,msgdma-1.0"

  # Add CMacro assignments
  set_module_assignment embeddedsw.CMacro.DMA_MODE                  [ get_parameter_value MODE ]
  set_module_assignment embeddedsw.CMacro.DATA_WIDTH				[ get_parameter_value DATA_WIDTH ]
  set_module_assignment embeddedsw.CMacro.MAX_BYTE                  [ get_parameter_value MAX_BYTE ]
  set_module_assignment embeddedsw.CMacro.DATA_FIFO_DEPTH			[ get_parameter_value DATA_FIFO_DEPTH ]
  set_module_assignment embeddedsw.CMacro.RESPONSE_PORT				[ get_parameter_value RESPONSE_PORT ]
  set_module_assignment embeddedsw.CMacro.DESCRIPTOR_FIFO_DEPTH		[ get_parameter_value DESCRIPTOR_FIFO_DEPTH ]
  set_module_assignment embeddedsw.CMacro.ENHANCED_FEATURES			[ get_parameter_value ENHANCED_FEATURES ]
  set_module_assignment embeddedsw.CMacro.STRIDE_ENABLE				[ get_parameter_value STRIDE_ENABLE ]
  set_module_assignment embeddedsw.CMacro.MAX_STRIDE				[ get_parameter_value MAX_STRIDE ]
  set_module_assignment embeddedsw.CMacro.BURST_ENABLE				[ get_parameter_value BURST_ENABLE ]
  set_module_assignment embeddedsw.CMacro.MAX_BURST_COUNT			[ get_parameter_value MAX_BURST_COUNT ]
  set_module_assignment embeddedsw.CMacro.PROGRAMMABLE_BURST_ENABLE [ get_parameter_value PROGRAMMABLE_BURST_ENABLE ]
  set_module_assignment embeddedsw.CMacro.BURST_WRAPPING_SUPPORT	[ get_parameter_value BURST_WRAPPING_SUPPORT ]
  set_module_assignment embeddedsw.CMacro.TRANSFER_TYPE				[ get_parameter_value TRANSFER_TYPE ]
  set_module_assignment embeddedsw.CMacro.PACKET_ENABLE				[ get_parameter_value PACKET_ENABLE ]
  set_module_assignment embeddedsw.CMacro.ERROR_ENABLE				[ get_parameter_value ERROR_ENABLE ]
  set_module_assignment embeddedsw.CMacro.ERROR_WIDTH				[ get_parameter_value ERROR_WIDTH ]
  set_module_assignment embeddedsw.CMacro.CHANNEL_ENABLE			[ get_parameter_value CHANNEL_ENABLE ]
  set_module_assignment embeddedsw.CMacro.CHANNEL_WIDTH				[ get_parameter_value CHANNEL_WIDTH ]
  set_module_assignment embeddedsw.CMacro.PACKET_ENABLE_DERIVED     [ get_parameter_value PACKET_ENABLE_DERIVED ]
  set_module_assignment embeddedsw.CMacro.ERROR_ENABLE_DERIVED      [ get_parameter_value ERROR_ENABLE_DERIVED ]
  set_module_assignment embeddedsw.CMacro.CHANNEL_ENABLE_DERIVED    [ get_parameter_value CHANNEL_ENABLE_DERIVED ]
  set_module_assignment embeddedsw.CMacro.STRIDE_ENABLE_DERIVED     [ get_parameter_value STRIDE_ENABLE_DERIVED ]
  
}
# | 
# +----------------------------------- 

# +-----------------------------------
# | Procedure being used
# | 
proc log2ceil {num} {
    set val 0
    set i 1
    while { $i < $num } {
        set val [ expr $val + 1 ]
        set i [ expr 1 << $val ]
    }
    return $val;
}
# | 
# +----------------------------------- 
