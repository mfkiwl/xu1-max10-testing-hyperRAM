
set CFI_FLASH_SECTOR_SIZE                     131072.0; # from datasheet of PC28F512M29EW
set LARGE_DATA_DIRECT_MEMORY_WRITE_CHUNK_SIZE [expr 2*$::CFI_FLASH_SECTOR_SIZE]; # this must be same or bigger than the CFI sector size. Margin of 2x to protect against funny business

proc get_max_addr_from_flash_map_file {  filename row_heading } {
      set f [open $filename r]
	  set i 0;
	  set max_addr 0;
	  while { 1 } {
	      incr i;
	      set s [gets $f]
		  puts "line ($i): $s"
		  set linelist [regexp -all -inline {\S+} $s]
		  puts "linelist: $linelist";
		  if {[string equal -nocase [lindex $linelist 0] $row_heading]} {
		  	  set max_addr [expr [lindex $linelist 2]];
		      puts "found requested line in $filename!, max_addr = $max_addr"
		      break;
		  }
		  
		   if {[eof $f]} {
				break
			}
	  
	  }
	  
	  close $f;	  
      return $max_addr;
}


proc write_cropped_rbf_file { file_to_program outfilename relevant_filesize} {
	  	 	  
			  
     set actual_relevant_filesize [expr {int(ceil(double($relevant_filesize)/$::LARGE_DATA_DIRECT_MEMORY_WRITE_CHUNK_SIZE)*$::LARGE_DATA_DIRECT_MEMORY_WRITE_CHUNK_SIZE)}];
	 puts "Relevant Size of file: $relevant_filesize Chunk size: $::LARGE_DATA_DIRECT_MEMORY_WRITE_CHUNK_SIZE Actual Relevant Size of file: $actual_relevant_filesize";
	 set f [open $file_to_program r]
     fconfigure $f \
         -translation binary \
         -encoding binary
		 
	 set cropped_data [read $f $actual_relevant_filesize];
	 close $f
	 set outfile [open $outfilename w]
	  fconfigure $outfile \
         -translation binary \
         -encoding binary 
	  
     puts -nonewline $outfile $cropped_data
	 close $outfile     

}

puts "gen_cropped_stratix_rbf.tcl argv = $argv"
set map_filename [lindex $argv 0]
set in_rbf_filename [lindex $argv 1]
set out_rbf_filename [lindex $argv 2]
set row_heading [lindex $argv 3]

puts "Looking for $row_heading in $map_filename, input file $in_rbf_filename outputting to: $out_rbf_filename";
set relevant_filesize [get_max_addr_from_flash_map_file $map_filename $row_heading];
write_cropped_rbf_file $in_rbf_filename $out_rbf_filename $relevant_filesize
