create_driver prbs_packet_checker_driver

set_sw_property hw_class_name prbs_packet_checker

set_sw_property version 1.0

set_sw_property min_compatible_hw_version 1.0

set_sw_property auto_initialize false

set_sw_property bsp_subdirectory drivers

add_sw_property c_source HAL/src/prbs_packet_checker.c

add_sw_property include_source HAL/inc/prbs_packet_checker.h
add_sw_property include_source inc/prbs_packet_checker_regs.h

add_sw_property supported_bsp_type HAL
add_sw_property supported_bsp_type UCOSII