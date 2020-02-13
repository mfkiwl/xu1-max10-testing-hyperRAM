`default_nettype none
module test_split_image_into_udp_packets  #(
    parameter DATA_WIDTH=32
)
(
	input clk,
	input enable,
	input reset_n,
	input extend_short_frames,
    output logic got_in_eop,
    
	output out_sop,
	output out_eop,
	output out_valid,
	output reg [DATA_WIDTH-1:0] out_data,	
	input  out_ready,
	
	output in_sop,
	output in_eop,
	output in_valid,
	output reg [DATA_WIDTH-1:0] in_data,
	output reg [DATA_WIDTH-1:0] delayed_indata,

	output logic in_ready,
	output logic [23:0] in_packet_count,
	output logic [23:0] in_packet_word_counter,
	output logic [23:0] in_total_word_counter,

    output logic  [7:0] num_of_packets_per_width,
    output logic [7:0] index_of_packet_in_width,
	output logic [23:0] packet_count,
    output logic [23:0] packet_word_counter,
	input   [23:0] packet_words_before_new_packet,
	input   [3:0] CLOG2_NUM_OF_PACKETS_PER_IMAGE_WIDTH,
	output  [15:0] packet_data_length_in_pixels,
	input  [15:0] image_width_in_pixels,
    input  [15:0] image_height_in_pixels,
	output logic [4:0 ] packet_word_index,
	output  logic [23:0] state,
	output  logic [15:0] data_word_counter,
	output  logic [15:0] x1,    
    output  logic [15:0] y1,
	output  logic [31:0] frameID,
	output logic   [13:0] split_packet_length_in_words,
	input   [13:0] input_packet_length_in_words,

	output logic found_in_sop,

	output logic [DATA_WIDTH-1:0] out_data_raw,
	output logic out_valid_raw,
	output logic out_eop_raw,
    output logic out_sop_raw,  
    output logic allow_in_ready  
);


generic_avalon_st_packet_emulator_w_ready
generic_avalon_st_packet_emulator_w_ready_inst
(
.clk,
.outdata(in_data),
.packet_count(in_packet_count),
.packet_word_counter(in_packet_word_counter),
.total_word_counter(in_total_word_counter),
.packet_words_before_new_packet,
.packet_length_in_words(input_packet_length_in_words),
.ready(in_ready),
.sop(in_sop),
.eop(in_eop),
.valid(in_valid)
);

split_image_into_udp_packets 
#(
.DATA_WIDTH(DATA_WIDTH)
)
split_image_into_udp_packets_inst
(
	  .clk,
	  .enable,
	  .reset_n,
	  .extend_short_frames,
	  .got_in_eop,
	 .out_sop,
	 .out_eop,
	 .out_valid,
	 .out_data,
	  .out_ready,
	
	 .in_sop,
	 .in_eop,
	 .in_valid,
	 .in_data,
	 .in_ready,
	 .delayed_indata,

	.packet_count,
    .packet_word_counter,
	.num_of_packets_per_width,
    .index_of_packet_in_width,
	.CLOG2_NUM_OF_PACKETS_PER_IMAGE_WIDTH,
	.packet_data_length_in_pixels,
	.image_width_in_pixels,
    .image_height_in_pixels,
	.packet_word_index,
	.state,
	.data_word_counter,
	.x1,    
    .y1,
	.frameID,
	.packet_length_in_words(split_packet_length_in_words),

	.out_data_raw,
	.out_valid_raw,
	.out_eop_raw,
    .out_sop_raw,  
    .allow_in_ready  
);

endmodule
`default_nettype wire