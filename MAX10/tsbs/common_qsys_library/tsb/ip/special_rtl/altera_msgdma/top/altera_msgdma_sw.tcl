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


#
# altera_msgdma_sw.tcl
#

# Create a new driver
create_driver altera_msgdma_driver

# Associate it with some hardware known as "modular_sgdma_dispatcher"
set_sw_property hw_class_name altera_msgdma 
# The version of this driver
set_sw_property version 14.1

# This driver may be incompatible with versions of hardware less
# than specified below. Updates to hardware and device drivers
# rendering the driver incompatible with older versions of
# hardware are noted with this property assignment.
set_sw_property min_compatible_hw_version 14.1

# Initialize the driver in alt_sys_init()
set_sw_property auto_initialize true

set_sw_property csr_interfaces "csr,descriptor_slave,response;csr,descriptor_slave"

# Location in generated BSP that above sources will be copied into
set_sw_property bsp_subdirectory drivers

# Interrupt properties: This driver supports enhanced
# interrupt APIs, as well as ISR preemption.
set_sw_property isr_preemption_supported true
set_sw_property supported_interrupt_apis "enhanced_interrupt_api"

#
# Source file listings...
#

# C/C++ source files
add_sw_property c_source HAL/src/altera_msgdma.c

# Include files
add_sw_property include_source HAL/inc/altera_msgdma.h
add_sw_property include_source inc/altera_msgdma_csr_regs.h
add_sw_property include_source inc/altera_msgdma_descriptor_regs.h
add_sw_property include_source inc/altera_msgdma_response_regs.h

# This driver supports HAL & UCOSII BSP (OS) types
add_sw_property supported_bsp_type HAL
add_sw_property supported_bsp_type UCOSII

# End of file
