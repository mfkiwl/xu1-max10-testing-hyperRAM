#run with tclsh


proc slave_connection { slave } {

set retstr \
 "  
                    //Slave $slave
                    .wbs$slave\_adr_i(  wbs$slave\_adr_i        ),   
	                .wbs$slave\_bte_i(  wbs$slave\_bte_i        ),   
	                .wbs$slave\_cti_i(  wbs$slave\_cti_i        ),   
	                .wbs$slave\_cyc_i(  wbs$slave\_cyc_i        ),   
	                .wbs$slave\_dat_i(  wbs$slave\_dat_i        ),   
	                .wbs$slave\_sel_i(  wbs$slave\_sel_i        ),   
                    .wbs$slave\_stb_i(  wbs$slave\_stb_i        ),   
	                .wbs$slave\_we_i (  wbs$slave\_we_i         ),   
	                .wbs$slave\_ack_o(  wbs$slave\_ack_o        ),   
	                .wbs$slave\_err_o(  wbs$slave\_err_o        ),   
	                .wbs$slave\_rty_o(  wbs$slave\_rty_o        ),   
	                .wbs$slave\_dat_o(  wbs$slave\_dat_o        ),"

	return $retstr;
} 

proc master_connection { master } {
set retstr \
   " 
                    //Master $master
                    .wbm$master\_adr_o(        WbAdr$master\_o         ), 
	                .wbm$master\_bte_o(                        ), 
	                .wbm$master\_cti_o(                        ), 
	                .wbm$master\_cyc_o(        WbCyc$master\_o         ), 
	                .wbm$master\_dat_o(        WbDat$master\_o         ), 
	                .wbm$master\_sel_o(        WbSel$master\_o         ),
                    .wbm$master\_stb_o(        WbStb$master\_o         ), 
	                .wbm$master\_we_o (         WbWe$master\_o          ), 
	                .wbm$master\_ack_i(        WbAck$master\_i         ), 
	                .wbm$master\_err_i(        WbErr$master\_i         ), 
	                .wbm$master\_rty_i(        WbRty$master\_i         ), 
	                .wbm$master\_dat_i(        WbDat$master\_i         ), "
	
    return $retstr;

} 
for {set master 1} { $master <= 6} {incr master} {
		for {set slave 1} { $slave <= 8} {incr slave} {
	
           puts "//\n// Number of masters = $master Number of slaves = $slave\n//\n\n";
		   puts "  generate "                                                                                           
           puts "       if (NUM_MASTERS == $master) begin   "                                                                                            
           puts "          if (NUM_SLAVES == $slave) begin   "                                                                                            
           puts "             
		          wishbone_bridge_$master\_masters_$slave\_slaves #("
		             
		   puts " 
		            // Base Address of Registers (32-bit Address not 8-bit... ie. 2 LSB dropped from VME_A)
					.slave0_sel_addr ( SLAVE0_SEL_ADDRESS ),  
					.slave1_sel_addr ( SLAVE1_SEL_ADDRESS ), 
					.slave2_sel_addr ( SLAVE2_SEL_ADDRESS ),  
					.slave3_sel_addr ( SLAVE3_SEL_ADDRESS ),  
					.slave4_sel_addr ( SLAVE4_SEL_ADDRESS ),  
					.slave5_sel_addr ( SLAVE5_SEL_ADDRESS ),  
					.slave6_sel_addr ( SLAVE6_SEL_ADDRESS ),  
					.slave7_sel_addr ( SLAVE7_SEL_ADDRESS ),  
					
				    // number of MSB's in 32bit WB Address that must match (ie. bits in Register Base Address)
					.slave0_sel_width ( SLAVE0_SEL_WIDTH  ),   
					.slave1_sel_width ( SLAVE1_SEL_WIDTH  ), 
					.slave2_sel_width ( SLAVE2_SEL_WIDTH  ),   
					.slave3_sel_width ( SLAVE3_SEL_WIDTH  ),  
					.slave4_sel_width ( SLAVE4_SEL_WIDTH  ),  	
					.slave5_sel_width ( SLAVE5_SEL_WIDTH  ),  
					.slave6_sel_width ( SLAVE6_SEL_WIDTH  ),  
					.slave7_sel_width ( SLAVE7_SEL_WIDTH  ),  
					.aw(NUM_WISHBONE_ADDRESS_BITS),
					.dw(NUM_WISHBONE_DATA_BITS),
					.watchdog_timer_width(WATCHDOG_TIMER_WIDTH),
					.crop_output_addresses(crop_output_addresses)
					) 
					
					wb_switch_inst 
					
					("
		   for { set i 0} {$i < $master} {incr i} {
	          puts [master_connection $i]
		   }
		   for { set i 0} {$i < $slave} {incr i} {
	          puts [slave_connection $i]
		   }
		   
		   puts "	// Clocks, resets
						.wb_clk ( wb_clk ), 
						.wb_rst ( reset )
					   );
			    "	
		   
           puts "         end "
           puts "   end "
		   puts "endgenerate \n\n"
		                                                                                    
		}
}


