# TCL File Generated by Component Editor 14.1
# Sat Dec 27 09:08:40 PST 2014
# DO NOT MODIFY


# 
# arria_v_xcvr_reconfig "arria_v_xcvr_reconfig" v1.0
#  2014.12.27.09:08:40
# 
# 

# 
# request TCL package from ACDS 14.1
# 
package require -exact qsys 14.1


# 
# module arria_v_xcvr_reconfig
# 
set_module_property DESCRIPTION ""
set_module_property NAME arria_v_xcvr_reconfig
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME arria_v_xcvr_reconfig
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL arria_v_seriallite_ii_xcvr_reconfig
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file arria_v_seriallite_ii_xcvr_reconfig.v VERILOG PATH arria_v_seriallite_ii_xcvr_reconfig.v TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reconfig_mgmt
# 
add_interface reconfig_mgmt avalon end
set_interface_property reconfig_mgmt addressUnits WORDS
set_interface_property reconfig_mgmt associatedClock clock_sink
set_interface_property reconfig_mgmt associatedReset reset_sink
set_interface_property reconfig_mgmt bitsPerSymbol 8
set_interface_property reconfig_mgmt burstOnBurstBoundariesOnly false
set_interface_property reconfig_mgmt burstcountUnits WORDS
set_interface_property reconfig_mgmt explicitAddressSpan 0
set_interface_property reconfig_mgmt holdTime 0
set_interface_property reconfig_mgmt linewrapBursts false
set_interface_property reconfig_mgmt maximumPendingReadTransactions 0
set_interface_property reconfig_mgmt maximumPendingWriteTransactions 0
set_interface_property reconfig_mgmt readLatency 0
set_interface_property reconfig_mgmt readWaitTime 1
set_interface_property reconfig_mgmt setupTime 0
set_interface_property reconfig_mgmt timingUnits Cycles
set_interface_property reconfig_mgmt writeWaitTime 0
set_interface_property reconfig_mgmt ENABLED true
set_interface_property reconfig_mgmt EXPORT_OF ""
set_interface_property reconfig_mgmt PORT_NAME_MAP ""
set_interface_property reconfig_mgmt CMSIS_SVD_VARIABLES ""
set_interface_property reconfig_mgmt SVD_ADDRESS_GROUP ""

add_interface_port reconfig_mgmt reconfig_mgmt_address address Input 7
add_interface_port reconfig_mgmt reconfig_mgmt_read read Input 1
add_interface_port reconfig_mgmt reconfig_mgmt_readdata readdata Output 32
add_interface_port reconfig_mgmt reconfig_mgmt_waitrequest waitrequest Output 1
add_interface_port reconfig_mgmt reconfig_mgmt_write write Input 1
add_interface_port reconfig_mgmt reconfig_mgmt_writedata writedata Input 32
set_interface_assignment reconfig_mgmt embeddedsw.configuration.isFlash 0
set_interface_assignment reconfig_mgmt embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment reconfig_mgmt embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment reconfig_mgmt embeddedsw.configuration.isPrintableDevice 0


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 0
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""

add_interface_port clock_sink mgmt_clk_clk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges BOTH
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink mgmt_rst_reset reset Input 1


# 
# connection point reconfig_to_xcvr
# 
add_interface reconfig_to_xcvr conduit end
set_interface_property reconfig_to_xcvr associatedClock clock_sink
set_interface_property reconfig_to_xcvr associatedReset reset_sink
set_interface_property reconfig_to_xcvr ENABLED true
set_interface_property reconfig_to_xcvr EXPORT_OF ""
set_interface_property reconfig_to_xcvr PORT_NAME_MAP ""
set_interface_property reconfig_to_xcvr CMSIS_SVD_VARIABLES ""
set_interface_property reconfig_to_xcvr SVD_ADDRESS_GROUP ""

add_interface_port reconfig_to_xcvr reconfig_to_xcvr export Output 140


# 
# connection point reconfig_from_xcvr
# 
add_interface reconfig_from_xcvr conduit end
set_interface_property reconfig_from_xcvr associatedClock clock_sink
set_interface_property reconfig_from_xcvr associatedReset reset_sink
set_interface_property reconfig_from_xcvr ENABLED true
set_interface_property reconfig_from_xcvr EXPORT_OF ""
set_interface_property reconfig_from_xcvr PORT_NAME_MAP ""
set_interface_property reconfig_from_xcvr CMSIS_SVD_VARIABLES ""
set_interface_property reconfig_from_xcvr SVD_ADDRESS_GROUP ""

add_interface_port reconfig_from_xcvr reconfig_from_xcvr export Input 92


# 
# connection point busy
# 
add_interface busy conduit end
set_interface_property busy associatedClock clock_sink
set_interface_property busy associatedReset reset_sink
set_interface_property busy ENABLED true
set_interface_property busy EXPORT_OF ""
set_interface_property busy PORT_NAME_MAP ""
set_interface_property busy CMSIS_SVD_VARIABLES ""
set_interface_property busy SVD_ADDRESS_GROUP ""

add_interface_port busy rx_cal_busy export Output 1
