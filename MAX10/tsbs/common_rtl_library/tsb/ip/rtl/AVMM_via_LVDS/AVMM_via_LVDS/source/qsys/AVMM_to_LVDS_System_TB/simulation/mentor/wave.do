onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /AVMM_to_LVDS_System_TB/mm_traffic_generator_0/test_complete
add wave -noupdate /AVMM_to_LVDS_System_TB/mm_traffic_generator_0/pass
add wave -noupdate /AVMM_to_LVDS_System_TB/mm_traffic_generator_0/fail
add wave -noupdate -divider {Master: Transactions to Packets}
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/avmm2lvds/local_avalon_slave_to_packets/U_A2P/*
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/avmm2lvds/local_avalon_slave_to_packets/U_A2P/avs/*
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/avmm2lvds/local_avalon_slave_to_packets/U_A2P/avst_out/*
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/avmm2lvds/local_avalon_slave_to_packets/U_A2P/avst_in/*
add wave -noupdate -divider {Master: Bytes to LVDS}
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/avmm2lvds/local_bytes_to_lvds/*
add wave -noupdate -divider {Slave: Bytes to LVDS}
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/lvds2avmm/remote_bytes_to_lvds/*
add wave -noupdate -divider {Slave: Packets to Transactions}
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/lvds2avmm/remote_packets_to_master/*
add wave -noupdate -divider {Master: Traffic Generator}
add wave -position insertpoint sim:/AVMM_to_LVDS_System_TB/mm_traffic_generator_0/traffic_generator_0/*
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
