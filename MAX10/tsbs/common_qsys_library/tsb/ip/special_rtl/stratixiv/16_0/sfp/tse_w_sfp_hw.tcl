# _hw.tcl file for tse_w_sfp
package require -exact qsys 14.0

# module properties
set_module_property NAME {tse_w_sfp_export}
set_module_property DISPLAY_NAME {tse_w_sfp_export_display}

# default module properties
set_module_property VERSION {1.0}
set_module_property GROUP {default group}
set_module_property DESCRIPTION {default description}
set_module_property AUTHOR {author}

set_module_property COMPOSITION_CALLBACK compose
set_module_property opaque_address_map false

proc compose { } {
    # Instances and instance parameters
    # (disabled instances are intentionally culled)
    add_instance clk_100 clock_source 16.0
    set_instance_parameter_value clk_100 {clockFrequency} {100000000.0}
    set_instance_parameter_value clk_100 {clockFrequencyKnown} {1}
    set_instance_parameter_value clk_100 {resetSynchronousEdges} {NONE}

    add_instance clk_125_enet_base altera_clock_bridge 16.0
    set_instance_parameter_value clk_125_enet_base {EXPLICIT_CLOCK_RATE} {125000000.0}
    set_instance_parameter_value clk_125_enet_base {NUM_CLOCK_OUTPUTS} {1}

    add_instance clk_50 clock_source 16.0
    set_instance_parameter_value clk_50 {clockFrequency} {50000000.0}
    set_instance_parameter_value clk_50 {clockFrequencyKnown} {1}
    set_instance_parameter_value clk_50 {resetSynchronousEdges} {NONE}

    add_instance clock_10 altera_clock_bridge 16.0
    set_instance_parameter_value clock_10 {EXPLICIT_CLOCK_RATE} {10000000.0}
    set_instance_parameter_value clock_10 {NUM_CLOCK_OUTPUTS} {1}

    add_instance mm_bridge_0 altera_avalon_mm_bridge 16.0
    set_instance_parameter_value mm_bridge_0 {DATA_WIDTH} {32}
    set_instance_parameter_value mm_bridge_0 {SYMBOL_WIDTH} {8}
    set_instance_parameter_value mm_bridge_0 {ADDRESS_WIDTH} {19}
    set_instance_parameter_value mm_bridge_0 {USE_AUTO_ADDRESS_WIDTH} {0}
    set_instance_parameter_value mm_bridge_0 {ADDRESS_UNITS} {SYMBOLS}
    set_instance_parameter_value mm_bridge_0 {MAX_BURST_SIZE} {1}
    set_instance_parameter_value mm_bridge_0 {MAX_PENDING_RESPONSES} {4}
    set_instance_parameter_value mm_bridge_0 {LINEWRAPBURSTS} {0}
    set_instance_parameter_value mm_bridge_0 {PIPELINE_COMMAND} {1}
    set_instance_parameter_value mm_bridge_0 {PIPELINE_RESPONSE} {1}
    set_instance_parameter_value mm_bridge_0 {USE_RESPONSE} {0}

    add_instance tse tse_w_sgdma 1.0
    set_instance_parameter_value tse {VME_FIFO_SUBSYSTEM_ENABLED} {0}
    set_instance_parameter_value tse {LEGACY_ITEMS_SUSBSYTEM_ENABLED} {0}

    # connections and connection parameters
    add_connection mm_bridge_0.m0 tse.avalon_slave avalon
    set_connection_parameter_value mm_bridge_0.m0/tse.avalon_slave arbitrationPriority {1}
    set_connection_parameter_value mm_bridge_0.m0/tse.avalon_slave baseAddress {0x00040000}
    set_connection_parameter_value mm_bridge_0.m0/tse.avalon_slave defaultConnection {0}

    add_connection clk_50.clk mm_bridge_0.clk clock

    add_connection clk_100.clk tse.clk_100 clock

    add_connection clk_50.clk tse.clk_50 clock

    add_connection clock_10.out_clk tse.clk_10 clock

    add_connection clk_125_enet_base.out_clk tse.tse_mac_pcs_ref_clk_clock_connection clock

    add_connection clk_50.clk_reset mm_bridge_0.reset reset

    add_connection clk_100.clk_reset tse.reset_100 reset

    add_connection clk_50.clk_reset tse.reset_50 reset

    # exported interfaces
    add_interface clk_10 clock sink
    set_interface_property clk_10 EXPORT_OF clock_10.in_clk
    add_interface clk_100 clock sink
    set_interface_property clk_100 EXPORT_OF clk_100.clk_in
    add_interface clk_125_enet_base_in_clk clock sink
    set_interface_property clk_125_enet_base_in_clk EXPORT_OF clk_125_enet_base.in_clk
    add_interface clk_50 clock sink
    set_interface_property clk_50 EXPORT_OF clk_50.clk_in
    add_interface mm_bridge_0_s0 avalon slave
    set_interface_property mm_bridge_0_s0 EXPORT_OF mm_bridge_0.s0
    add_interface reset_100 reset sink
    set_interface_property reset_100 EXPORT_OF clk_100.clk_in_reset
    add_interface reset_50 reset sink
    set_interface_property reset_50 EXPORT_OF clk_50.clk_in_reset
    add_interface tse_sgdma_rx_csr_irq interrupt sender
    set_interface_property tse_sgdma_rx_csr_irq EXPORT_OF tse.sgdma_rx_csr_irq
    add_interface tse_sgdma_rx_m_write avalon master
    set_interface_property tse_sgdma_rx_m_write EXPORT_OF tse.sgdma_rx_m_write
    add_interface tse_sgdma_tx_csr_irq interrupt sender
    set_interface_property tse_sgdma_tx_csr_irq EXPORT_OF tse.sgdma_tx_csr_irq
    add_interface tse_sgdma_tx_m_read avalon master
    set_interface_property tse_sgdma_tx_m_read EXPORT_OF tse.sgdma_tx_m_read
    add_interface tse_sgdma_tx_out avalon_streaming source
    set_interface_property tse_sgdma_tx_out EXPORT_OF tse.sgdma_tx_out
    add_interface tse_tse_mac_mac_mdio_connection conduit end
    set_interface_property tse_tse_mac_mac_mdio_connection EXPORT_OF tse.tse_mac_mac_mdio_connection
    add_interface tse_tse_mac_mac_misc_connection conduit end
    set_interface_property tse_tse_mac_mac_misc_connection EXPORT_OF tse.tse_mac_mac_misc_connection
    add_interface tse_tse_mac_serdes_control_connection conduit end
    set_interface_property tse_tse_mac_serdes_control_connection EXPORT_OF tse.tse_mac_serdes_control_connection
    add_interface tse_tse_mac_serial_connection conduit end
    set_interface_property tse_tse_mac_serial_connection EXPORT_OF tse.tse_mac_serial_connection
    add_interface tse_tse_mac_status_led_connection conduit end
    set_interface_property tse_tse_mac_status_led_connection EXPORT_OF tse.tse_mac_status_led_connection
    add_interface tse_tse_mac_transmit avalon_streaming sink
    set_interface_property tse_tse_mac_transmit EXPORT_OF tse.tse_mac_transmit

    # interconnect requirements
    set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
    set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}
    set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}
}
