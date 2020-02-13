# Create a new driver - this name must be different than the 
# hardware component name
create_driver checksum_driver

# Associate it with some hardware known as "checksum_accelerator"
set_sw_property hw_class_name controller

# The version of this driver is "8.0"
set_sw_property version 8.0

# This driver is proclaimed to be compatible with altera_avalon_checksum
# as old as version "1.0". The component hardware version is set in the 
# _hw.tcl file - If the hardware component  version number is not equal 
# or greater than the min_compatable_hw_version number, the driver 
# source files will not be copied over to the BSP driver directory
set_sw_property min_compatible_hw_version 1.0

# Initialize the driver in alt_sys_init()
set_sw_property auto_initialize false

# Location in generated BSP that sources will be copied into
set_sw_property bsp_subdirectory drivers

#
# Source file listings...
#

# C/C++ source files
add_sw_property c_source HAL/src/checksum_controller_routines.c

# Include files
add_sw_property include_source HAL/inc/checksum_controller_routines.h
add_sw_property include_source inc/checksum_controller_regs.h


# This driver supports HAL type
add_sw_property supported_bsp_type HAL

# End of file
