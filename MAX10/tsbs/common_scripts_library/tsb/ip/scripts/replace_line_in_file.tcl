
proc url_decode str {
    # rewrite "+" back to space
    # protect \ from quoting another '\'
    set str [string map [list + { } "\\" "\\\\"] $str]

    # prepare to process all %-escapes
    regsub -all -- {%([A-Fa-f0-9][A-Fa-f0-9])} $str {\\u00\1} str

    # process \u unicode mapped chars
    return [subst -novar -nocommand $str]
}

puts "argv = $argv"
set filename [lindex $argv 0]
set line_to_replace [lindex $argv 1]
set replacement_line [lindex $argv 2]

puts "filename = ($filename)"
puts "line_to_replace = ($line_to_replace)"
puts "replacement_line = ($replacement_line)"

set actual_replacement_line [url_decode $replacement_line]
puts "actual_replacement_line = ($actual_replacement_line)"



set temp ""

#saves each line to an arg in a temp list
set file [open $filename]
foreach {current_line} [split [read $file] \n] {
    lappend temp $current_line
}
close $file

#rewrites your file
set file [open $filename w]
set counter 1
foreach {current_line} $temp {
    puts "current_line = $current_line"
    if { $counter == $line_to_replace } {
	   puts "Replacing: $actual_replacement_line"
	   puts $file $actual_replacement_line
	} else {	
	   puts "Rewriting: $current_line"
       puts $file $current_line
	}	
	incr counter;
}

close $file