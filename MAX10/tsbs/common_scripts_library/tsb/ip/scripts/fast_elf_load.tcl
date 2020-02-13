  set system_console_directory_called_from  $::env(fast_load_system_console_directory_called_from);
  set elf_filename_base $::env(fast_load_system_console_elf_filename)
  set bstreams [ get_service_paths master ]
  puts "bstreams = ($bstreams)"
  set desired_master [lsearch $bstreams "*download_0*"]
  puts "desired_master = $desired_master"; 
  set ::sdr_master [lindex $bstreams $desired_master]
  puts "Set sdr_master to $::sdr_master";
  set elf_binary_filename "$system_console_directory_called_from\/../exe/$elf_filename_base\.rbf"
  puts "filename = $elf_binary_filename"
  set ddr_start_location $::env(fast_load_system_console_ddr_addr)
  set nios_instance $::env(fast_load_system_console_nios_instance)
  set USB_cable_index $::env(fast_load_system_console_usb_cable)
  set NIOS_APPLICATION_NAME nios2_
  set nios_processor_master_index [lsearch $bstreams "*$USB_cable_index\*$::NIOS_APPLICATION_NAME$::nios_instance\*"]
  set nios_processor_master [lindex $bstreams $nios_processor_master_index]
  puts "nios_processor_master = $nios_processor_master"
  
  puts "stopping nios...."
  processor_stop $nios_processor_master
  open_service master $::sdr_master
  puts "loading elf...."
  master_write_from_file $::sdr_master $elf_binary_filename $ddr_start_location
  puts "finished loading elf...."
  close_service master $::sdr_master
  puts "resetting nios...."
  processor_reset $nios_processor_master
  puts "allowing nios to run...."
  processor_run $nios_processor_master
  
