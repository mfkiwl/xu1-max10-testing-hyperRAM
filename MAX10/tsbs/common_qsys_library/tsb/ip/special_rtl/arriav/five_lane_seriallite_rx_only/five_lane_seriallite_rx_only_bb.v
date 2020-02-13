// Generated by SerialLite II 14.1 [Altera, IP Toolbench 1.3.0 Build 190]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2015 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.

module five_lane_seriallite_rx_only (
	rx_parallel_data_out,
	rx_coreclk,
	rx_ctrldetect,
	stat_rr_pattdet,
	err_rr_disp,
	mreset_n,
	flip_polarity,
	rrefclk,
	stat_rr_link,
	err_rr_8berrdet,
	rxrdp_ena,
	rxrdp_dat);

	input	[31:0]	rx_parallel_data_out;
	input		rx_coreclk;
	input	[3:0]	rx_ctrldetect;
	input	[3:0]	stat_rr_pattdet;
	input	[3:0]	err_rr_disp;
	input		mreset_n;
	output		flip_polarity;
	output		rrefclk;
	output		stat_rr_link;
	output	[3:0]	err_rr_8berrdet;
	output		rxrdp_ena;
	output	[31:0]	rxrdp_dat;
endmodule