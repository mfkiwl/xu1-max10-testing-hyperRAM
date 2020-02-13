#run with tclsh

for {set master 1} { $master <= 6} {incr master} {
		for {set slave 1} { $slave <= 8} {incr slave} {
           puts "//\n// Number of masters = $master Number of slaves = $slave\n//\n\n";
		   puts "  `define NUM_MASTERS_$master "                                                                                           
           puts "  `define NUM_SLAVES_$slave   "                                                                                            
           set  wb_bridge_name_suffix "_$master\_masters_$slave\_slaves"                                                                  
           puts "  `define current_wb_bridge_top_module_name            wishbone_bridge$wb_bridge_name_suffix                             "
           puts "  `define current_wb_b3_switch_slave_sel_name          wb_b3_switch_slave_sel$wb_bridge_name_suffix                      "
           puts "  `define current_wb_b3_switch_master_detect_slave_sel wb_b3_switch_master_detect_slave_sel$wb_bridge_name_suffix        "
           puts "  `define current_wb_b3_switch_slave_out_mux           wb_b3_switch_slave_out_mux$wb_bridge_name_suffix                  "
           puts "  `define current_wb_b3_switch_master_out_mux          wb_b3_switch_master_out_mux$wb_bridge_name_suffix                 "
              
           puts "\n  `include \"generic_define_parametrizeable_master_slave_wb_bridge.v\"\n"

		   puts "  `undef NUM_MASTERS_$master"                                                                                           
           puts "  `undef NUM_SLAVES_$slave   \n"                                                                                                       
		}
}


