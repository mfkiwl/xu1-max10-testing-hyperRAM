
# /*
# *******************************************************************************
#
# MODULE_NAME = five_lane_seriallite_constraints.tcl
# COMPANY     = Altera Corporation, Altera Ottawa Technology Center
# WEB         = www.altera.com
#
# FUNCTIONAL_DESCRIPTION :
#    SLITE-II Constraint file. Used by Quartus II.
#    To use this constraint file (assuming the name of this file is five_lane_seriallite_constraints.tcl ):
#       -create a Quartus II project
#       - copy this constraint file into the project directory
#       - open the project
#       - run this constraint file
#           in the TCL Console:  >source five_lane_seriallite_constraints.tcl
#           or,
#           select Tools / TCL Scripts / five_lane_seriallite_constraints.tcl
#       - compile the project as usual
#
# END_FUNCTIONAL_DESCRIPTION
#
# LEGAL :
#   Copyright (C) 2005 Altera Corporation. All rights reserved.  This source code
#   to a MegaCore logic function is highly confidential and proprietary
#   information of Altera and is being provided in accordance with and
#   subject to the applicable MegaCore Logic Function License Agreement
#   which governs its use and disclosure.  Altera products and services
#   are protected under numerous U.S. and foreign patents, maskwork rights,
#   copyrights and other intellectual property laws.
# END_LEGAL
# *******************************************************************************
# */

  package require ::quartus::flow
  #package require ::quartus::project
  package require ::quartus::report
  package require ::quartus::misc


  ### defaults ###
  set constraint_applied 0
  set done_with_errors 0
  set i 0
  set my_proj_rev ""
  set qpf ""
  
  ############################################
  # Set Clock Names
  ############################################
   set trefclk_name "trefclk"


  ############################################
  # Extract project revision from the qpf file
  # If multiple qpf found, open the newest
  ############################################

  set max_time 0
  foreach file_list [glob -nocomplain *] {
    if {([string equal [file extension $file_list] .qpf]) } {
      set qpf $file_list
      set mod_time [ file mtime $qpf ]
      if { $mod_time > $max_time } { 
          set max_time $mod_time 
          set new_qpf $qpf
      }
      set i [expr $i + 1]
    }
  }
  if {($qpf=="")} {
    error "ERROR: No project (qpf file) found. Create a Quartus II project and rerun this script."
  }
  if { $i > 1 } {
    # found multiple qpfs, open the newest
    set qpf $new_qpf
    puts "WARNING: Found multiple projects! Assuming that the project is $qpf (newest)"
  }

  if [catch {open $qpf r} qpf_id] {
     error "ERROR: Cannot open file $qpf "
  }
  while { [gets $qpf_id line] >= 0 } {
     if [regexp "PROJECT_REVISION" $line] {
         set line_list [split $line =]
         set my_proj_rev [lindex $line_list 1]
         regsub -all "\"" $my_proj_rev "" my_proj_rev
         regsub -all " " $my_proj_rev "" my_proj_rev
     }
  }
  close $qpf_id

  if {($my_proj_rev=="")} {
    error "ERROR: $qpf doesn't look like a valid qpf file (project revision is missing)"
  }

  puts "INFO: Project name = $my_proj_rev"
  puts "INFO: Note - If you are upgrading this project from a previous version of SerialLite-II,"
  puts "INFO: you will have to remove the old 0PPM assignments as they have changed"
  puts "INFO: in this version. Use Assignment Editor (Ctrl->Shift->A) to remove the old 0PPM"
  puts "INFO: assignments after running this script!"

  ######################################
  # Open the project if not already open
  ######################################

  if { [is_project_open ] == 0 } {
    project_open  $my_proj_rev
    set project_was_open 0
  } else {
    set project_was_open 1
  }



  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # Hierarchy Independent Constrains START Here
  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  puts "INFO: Applying Global Timing Assignments."

  set_global_assignment -name IGNORE_CLOCK_SETTINGS OFF
  set_global_assignment -name INCLUDE_EXTERNAL_PIN_DELAYS_IN_FMAX_CALCULATIONS OFF
  set_global_assignment -name FMAX_REQUIREMENT "125 MHz"

# Analysis & Synthesis Assignments
# ================================
        set_global_assignment -name DEVICE_FILTER_SPEED_GRADE FASTEST
        set_global_assignment -name FITTER_EFFORT "STANDARD FIT"
        set_global_assignment -name PLACEMENT_EFFORT_MULTIPLIER 4.0
        set_global_assignment -name OPTIMIZE_FAST_CORNER_TIMING ON
        set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS"
        #
        # set_global_assignment -name INNER_NUM 5
        set_global_assignment -name OPTIMIZE_FAST_CORNER_TIMING ON
        #set_global_assignment -name ENABLE_RECOVERY_REMOVAL_ANALYSIS ON
       
# Pin & Location Assignments
# ==========================
        set_instance_assignment -name VIRTUAL_PIN ON -to stat_rr_link
        set_instance_assignment -name VIRTUAL_PIN ON -to ctrl_tc_force_train
        set_instance_assignment -name VIRTUAL_PIN ON -to rxrdp_ena
        set_instance_assignment -name VIRTUAL_PIN ON -to rxrdp_dat
        set_instance_assignment -name VIRTUAL_PIN ON -to txrdp_ena
        set_instance_assignment -name VIRTUAL_PIN ON -to txrdp_dav
        set_instance_assignment -name VIRTUAL_PIN ON -to txrdp_dat
        set_instance_assignment -name VIRTUAL_PIN ON -to err_rr_dskfifo_oflw
        set_instance_assignment -name VIRTUAL_PIN ON -to stat_rr_dskw_done_bc




set using_sdc [get_global_assignment -name USE_TIMEQUEST_TIMING_ANALYZER]
set using_sdc_comp [string compare $using_sdc "ON"]
if { $using_sdc_comp == 0 } {
   puts "Using TimeQuest - Including SDC Script"
   set_global_assignment -name SDC_FILE five_lane_seriallite.sdc
}

set auto_dev [get_global_assignment -name DEVICE]
set auto_dev_comp [string compare $auto_dev "AUTO"]

# Cut the "metastable" flops.
set_instance_assignment -name CUT ON -from * -to "*five_lane_seriallite_slite2_top*meta*"
set_instance_assignment -name CUT ON -from * -to "*five_lane_seriallite_slite2_top*wr_*sync*"
set_instance_assignment -name CUT ON -from * -to "*five_lane_seriallite_slite2_top*rd_*sync*"
     #set_false_path -from [get_pins -hierarchical *link_up|clk*]
     set_instance_assignment -name CUT ON -from "*five_lane_seriallite_slite2_top*linksm_inst|link_up" -to *
     # Cut the "metastable" flops.
     set_instance_assignment -name CUT ON -from * -to "*meta*"    
#set_false_path -from [get_pins -hierarchical *reset_d[2]|clk*]
set_instance_assignment -name CUT ON -from "*five_lane_seriallite_slite2_top*reset_syncer|reset_d[2]" -to *

        
# Timing Assignments
# ==================
  
  
  #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  # Hierarchy Independent Constrains END Here
  #<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



  #########################################
  # Run Analysis & Synthesis only if needed
  #########################################

  set need_to_map 1
#  if {![catch {load_report} err_msg]} {
#      set res_panel_name "Analysis & Synthesis Resource Utilization by Entity"
#      foreach panel_name [get_report_panel_names] {
#         if { [string match "*$res_panel_name" "$panel_name"] } {
#              set need_to_map 0
#         }
#      }
#      unload_report
#  }

  if { $need_to_map == 1 } {
     puts "INFO: Running a full Analysis and Synthesis..."
     execute_module -tool map
  }
  if {[catch {load_report} err_msg]} {
     error "ERROR: Analysis and Synthesis was unsuccessful."
  }
  unload_report



  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  # Hierarchy Dependent Constrains START Here
  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


  #########################################
  # trefclk -> 156.25 MHz
  #########################################
set node_to_set_list "
   trefclk
"
foreach node_to_set_string $node_to_set_list {
   set constraint_applied 0
   set collection_of_name_ids [get_names -filter $node_to_set_string -observable_type all]
   foreach_in_collection name_id $collection_of_name_ids {
   set node_to_set $trefclk_name

      if { $node_to_set != "" } {
         puts "INFO: Setting CLOCK_SETTINGS $node_to_set"
         ###########
         set_global_assignment -name FMAX_REQUIREMENT "156.25 MHz" -section_id $node_to_set
         set_global_assignment -name INCLUDE_EXTERNAL_PIN_DELAYS_IN_FMAX_CALCULATIONS OFF -section_id $node_to_set
         set_instance_assignment -name CLOCK_SETTINGS $node_to_set -to $node_to_set
         ###########
         set constraint_applied 1
      }
   }
   if { $constraint_applied == 0 } {
      puts "ERROR: Constraint $node_to_set_string not applied."
      set done_with_errors 1
   }
}

#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# Hierarchy Dependent Constrains END Here
#<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  export_assignments

  if { $done_with_errors == 1 } {
    puts "INFO: Done with ERRORS."
  } else {
    puts "INFO: Done."
  }

  foreach i [get_all_user_option_names] {
         puts 1
  }

  if { $project_was_open == 0 } {
    # project wasn't open, need to close it
    project_close
  }

