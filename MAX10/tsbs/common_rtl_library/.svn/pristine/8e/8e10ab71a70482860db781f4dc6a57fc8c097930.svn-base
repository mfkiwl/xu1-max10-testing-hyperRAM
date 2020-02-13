`default_nettype none
module test_simple_8b10b_link
#(
parameter numchannels = 2,
parameter lock_wait_counter_bits = 9,
parameter num_bits_in_raw_frame = 8,
parameter num_bits_in_coded_frame = num_bits_in_raw_frame+2,
parameter output_data_parallelization_ratio = 4,
parameter valid_output_word_counter_bits = 32,
parameter control_code_counter_numbits = 16,
parameter insert_control_code_every = 9,

 parameter device_family = "Cylcone III", 
 parameter num_data_output_fifo_locations = 32,
 parameter input_to_output_bitwidth_ratio = 4,
 parameter input_data_bits_per_channel = 32,
 parameter out_data_bits_per_channel = input_data_bits_per_channel/input_to_output_bitwidth_ratio,
 parameter control_chars_width = 8,
 parameter control_char_fifo_depth = 64
)
(
   frame_clk,
   control_fifo_aclr,
   data_fifo_aclr,
   reset,
   frame_select,
   data_out,
   raw_2x_coded_bit_data,
   transpose_2x_coded_bit_data_bits,
   transpose_channel_data_halves,
   decoder_control_character_detected,
   coding_err,
   disparity,
   disparity_err,  
   ignore_disparity_err,
   ignore_coding_err,
   lock_wait,
   is_locked_8b_10b,
   lock_wait_counter,
   lock_wait_machine_state_num,
   enable_8b_10b_lock_scan,
   frame_region_8b_10b,
   decoded_8b_10b_data_fragment,
   selected_data_out,
   raw_raw_2x_coded_bit_data,
   decoder_pipeline_delay_of_uncoded_bits,
   intermediate_2x_coded_bit_data,
   intermediate_frame_select,
   selected_encoder_data_out,
   clear_scan_counter_8b_10b,
   inc_scan_counterm_8b_10b,
   parallelizer_current_byte_enable,
   parallelizer_output_regs,
   parallelizer_total_output_reg,
   valid_data_word_count,
   delay_data_out_for_lane_alignment,
   fixed_delay_data_out_prior_to_lane_alignment,
   fixed_delay_decoder_control_character_detected,
     
     
     
padding_char,
 wrclk_fifo_xcvr,
 wrreq_fifo_xcvr,
 data_fifo_xcvr,
 
	fsm_state,
	busy,
	enable_data_out,
	tbi_encoder,
	fifo_read_xcvr_sig,
	fifo_empty_xcvr_sig,
	data_fifo_xcvr_sig,
	data_fifo_xcvr_fifo_q,
	data_fifo_character_queue_out,
	fifo_read_character_queue_sig,
	fifo_empty_character_queue_sig,
	is_control_char,
	is_padding_char,
	from_FSM2_8b10,
	actual_uncoded_8b10b_out,
	actual_is_padding_char,
	actual_is_control_char,
    data_fifo_xcvr_flattened,
	full_fifo_xcvr,			
	wrclk_fifo_character_queue,
	wrreq_fifo_character_queue,
	data_fifo_character_queue,			
	full_fifo_character_queue,
	fsm_clk,
	resynced_parallelizer_total_output_reg,
	raw_resynced_parallelized_data_out,
    pll_generated_20x_of_data_out_parallel_clock,
    enable_clocking_of_output_data,
    new_data_word_ready_now,
    enable_auto_data_fifo_aclr,
	rd_full_fifo_xcvr,
	auto_data_fifo_aclr,
	fifo_xcvr_wrusedw,
	intermediate_clk,
    intermediate_data,
    actual_ce_conv_up,  
    actual_ce_conv_down	
);


	function automatic int log2 (input int n);
						int original_n;
						original_n = n;
						if (n <=1) return 1; // abort function
						log2 = 0;
						while (n > 1) begin
						    n = n/2;
						    log2++;
						end
						
						if (2**log2 != original_n)
						begin
						     log2 = log2 + 1;
						end
						
						endfunction

			
localparam num_selection_bits = log2(num_bits_in_coded_frame);


  input                                      frame_clk;
  input                                      reset;
  output  [num_selection_bits-1:0]        frame_select[numchannels];
  output  [num_bits_in_raw_frame-1:0]     data_out[numchannels];
  output  [2*num_bits_in_coded_frame-1:0] raw_2x_coded_bit_data[numchannels];
  input                                   transpose_2x_coded_bit_data_bits;
  input                                   transpose_channel_data_halves;
  output [numchannels-1:0]                   decoder_control_character_detected;
  output [numchannels-1:0]                   coding_err;
  output [numchannels-1:0]                   disparity;
  output [numchannels-1:0]                   disparity_err;  
  input  [numchannels-1:0]                   ignore_disparity_err;
  input  [numchannels-1:0]                   ignore_coding_err;
  input  [lock_wait_counter_bits-1:0]        lock_wait;
  output                                     is_locked_8b_10b[numchannels];
  output [lock_wait_counter_bits-1:0]        lock_wait_counter[numchannels];
  output [3:0] lock_wait_machine_state_num[numchannels];
  input  [numchannels-1:0] enable_8b_10b_lock_scan;
  output [9:0] frame_region_8b_10b[numchannels];
  output [7:0] decoded_8b_10b_data_fragment[numchannels];
  output [num_bits_in_coded_frame-1:0] selected_data_out[numchannels];
  output [2*num_bits_in_coded_frame-1:0] raw_raw_2x_coded_bit_data[numchannels];
  output [num_bits_in_coded_frame-1:0] decoder_pipeline_delay_of_uncoded_bits[numchannels];
  output [numchannels-1:0] clear_scan_counter_8b_10b;
  output [numchannels-1:0] inc_scan_counterm_8b_10b;
  output [output_data_parallelization_ratio-1:0] parallelizer_current_byte_enable[numchannels];
  output [num_bits_in_raw_frame-1:0] parallelizer_output_regs[numchannels][output_data_parallelization_ratio-1];
  output [output_data_parallelization_ratio*num_bits_in_raw_frame-1:0] parallelizer_total_output_reg[numchannels];
    output [output_data_parallelization_ratio*num_bits_in_raw_frame-1:0] resynced_parallelizer_total_output_reg[numchannels];

  output [valid_output_word_counter_bits-1:0] valid_data_word_count[numchannels];
  input logic [numchannels-1:0] delay_data_out_for_lane_alignment;
  output logic [num_bits_in_raw_frame-1:0] fixed_delay_data_out_prior_to_lane_alignment[numchannels];
  output logic [numchannels-1:0] fixed_delay_decoder_control_character_detected;

  output reg [2*num_bits_in_coded_frame-1:0] intermediate_2x_coded_bit_data[numchannels];
  input  [num_selection_bits-1:0]            intermediate_frame_select[numchannels];
  output [num_bits_in_coded_frame-1:0]       selected_encoder_data_out[numchannels];
  
 input [control_chars_width-1:0] padding_char[numchannels];
 input wrclk_fifo_xcvr;
 input wrreq_fifo_xcvr;
 input [input_data_bits_per_channel-1:0] data_fifo_xcvr[numchannels];
 			input logic enable_auto_data_fifo_aclr;
			output logic rd_full_fifo_xcvr;
			output logic auto_data_fifo_aclr;

 
 
			output [15:0] fsm_state;
			output busy;
			output enable_data_out;
			output [9:0]tbi_encoder[numchannels];

			//debug output
			output logic fifo_read_xcvr_sig;
			output logic fifo_empty_xcvr_sig;
			output logic [out_data_bits_per_channel*numchannels-1:0]  data_fifo_xcvr_sig;
			output logic [out_data_bits_per_channel-1:0] data_fifo_xcvr_fifo_q[numchannels];

			output logic  [control_chars_width-1:0] data_fifo_character_queue_out[numchannels];
			output logic fifo_read_character_queue_sig[numchannels];
			output logic fifo_empty_character_queue_sig[numchannels];
			output logic is_control_char;
			output logic is_padding_char[numchannels];
			output logic [7:0] from_FSM2_8b10[numchannels];
			output reg    [7:0] actual_uncoded_8b10b_out[numchannels];
			output reg   actual_is_padding_char[numchannels];
			output reg   actual_is_control_char;
            output [input_data_bits_per_channel*numchannels-1:0] data_fifo_xcvr_flattened;
			output full_fifo_xcvr;
			
			input wrclk_fifo_character_queue[numchannels];
			input wrreq_fifo_character_queue[numchannels];
			input [control_chars_width-1:0] data_fifo_character_queue[numchannels];			
			output full_fifo_character_queue[numchannels];
						output [31:0] fifo_xcvr_wrusedw;

			
			input fsm_clk;
			input control_fifo_aclr;
			input data_fifo_aclr;


  output [output_data_parallelization_ratio*num_bits_in_raw_frame-1:0] raw_resynced_parallelized_data_out[numchannels];
  input pll_generated_20x_of_data_out_parallel_clock;
  output logic enable_clocking_of_output_data[numchannels];
  output logic new_data_word_ready_now[numchannels];
  input intermediate_clk;
  output logic [output_data_parallelization_ratio*num_bits_in_raw_frame-1:0] intermediate_data[numchannels];
  output logic actual_ce_conv_up  [numchannels];
  output logic actual_ce_conv_down[numchannels];

multi_channel_simple_8b10b_tx
#( 
 .device_family(device_family),
 .numchannels(numchannels),
 .num_data_output_fifo_locations(num_data_output_fifo_locations),
 .input_to_output_bitwidth_ratio(input_to_output_bitwidth_ratio),
 .input_data_bits_per_channel(input_data_bits_per_channel),
 .control_chars_width(control_chars_width),
 .control_char_fifo_depth (control_char_fifo_depth)
) 
multi_channel_simple_8b10b_tx_inst
(
             .data_output_clk(frame_clk),
			.*
);		


genvar i;

generate
		for (i = 0; i < numchannels; i = i + 1)
		begin : generate_encoded_data
					always @(posedge frame_clk)
					begin
						 intermediate_2x_coded_bit_data[i] <= {intermediate_2x_coded_bit_data[i],tbi_encoder[i]};
					end
                    
                   	data_chooser_according_to_frame_position 
					#(
					   .numbits_dataout(num_bits_in_coded_frame)
					 )
					data_chooser_according_to_frame_position_inst 
					(
					 .data_reg_contents(intermediate_2x_coded_bit_data[i]),
					 .selection_value(intermediate_frame_select[i]),
					 .selected_data_reg_contents(selected_encoder_data_out[i]),
					 .clk(frame_clk)
					);
		end
endgenerate
					

multi_channel_8b10b_rx_w_parallelizer
#(
.numchannels(numchannels),
.lock_wait_counter_bits(lock_wait_counter_bits),
.num_bits_in_raw_frame(num_bits_in_raw_frame),
.num_bits_in_coded_frame(num_bits_in_coded_frame),
.output_data_parallelization_ratio(output_data_parallelization_ratio),
.valid_output_word_counter_bits(valid_output_word_counter_bits)
)
multi_channel_8b10b_rx_w_parallelizer_inst
(
   /* input logic                                                                   */ .frame_clk                                              (frame_clk                                     ),
   /* input logic                                                                    */ .reset                                                 (reset                                         ),
   /* input logic [num_bits_in_coded_frame-1:0]                                      */ .data_in                                               (selected_encoder_data_out                     ),
   /* input logic                                                                    */ .transpose_2x_coded_bit_data_bits                      (transpose_2x_coded_bit_data_bits              ),
   /* input logic                                                                    */ .transpose_channel_data_halves                         (transpose_channel_data_halves                 ),
   /* input logic                                                                    */ .ignore_disparity_err                                  (ignore_disparity_err                          ),
   /* input logic                                                                    */ .ignore_coding_err                                     (ignore_coding_err                             ),
   /* input logic [lock_wait_counter_bits-1:0]                                       */ .lock_wait                                             (lock_wait                                     ),
   /* input */                                                                          .delay_data_out_for_lane_alignment                     (delay_data_out_for_lane_alignment             ), 																												
 																						.resynced_parallelized_data_out                        (resynced_parallelizer_total_output_reg        ),						 
   /* output logic [output_data_parallelization_ratio*num_bits_in_raw_frame-1:0]     */ .parallelizer_total_output_reg                         (parallelizer_total_output_reg                 ),
   /* output logic [valid_output_word_counter_bits-1:0]                              */ .valid_data_word_count                                 (valid_data_word_count                         ),
   /* output logic                                                                   */ .decoder_control_character_detected                    (decoder_control_character_detected            ),
   /* output logic [num_bits_in_raw_frame-1:0]                                       */ .data_out                                              (data_out                                      ),
   /* output logic                                                                   */ .coding_err                                            (coding_err                                    ),
   /* output logic                                                                   */ .disparity                                             (disparity                                     ),
   /* output logic                                                                   */ .disparity_err                                         (disparity_err                                 ),
 																																			   
   /* output logic [num_selection_bits-1:0]                                          */  .frame_select                                         (frame_select                                  ),
   /* output logic [2*num_bits_in_coded_frame-1:0]                                   */  .raw_2x_coded_bit_data                                (raw_2x_coded_bit_data                         ),
   /* output logic                                                                   */  .is_locked_8b_10b                                     (is_locked_8b_10b                              ),
   /* output logic [lock_wait_counter_bits-1:0]                                      */  .lock_wait_counter                                    (lock_wait_counter                             ),
   /* output logic [3:0]                                                             */  .lock_wait_machine_state_num                          (lock_wait_machine_state_num                   ),
   /* input  logic                                                                   */  .enable_8b_10b_lock_scan                              (enable_8b_10b_lock_scan                       ),
   /* output logic [9:0]                                                             */  .frame_region_8b_10b                                  (frame_region_8b_10b                           ),
   /* output logic [7:0]                                                             */  .decoded_8b_10b_data_fragment                         (decoded_8b_10b_data_fragment                  ),
   /* output logic [num_bits_in_coded_frame-1:0]                                     */  .selected_data_out                                    (selected_data_out                             ),
   /* output logic [2*num_bits_in_coded_frame-1:0]                                   */  .raw_raw_2x_coded_bit_data                            (raw_raw_2x_coded_bit_data                     ),
   /* output logic [num_bits_in_coded_frame-1:0]                                     */  .decoder_pipeline_delay_of_uncoded_bits               (decoder_pipeline_delay_of_uncoded_bits        ),
   /* output logic                                                                   */  .clear_scan_counter_8b_10b                            (clear_scan_counter_8b_10b                     ),
   /* output logic                                                                   */  .inc_scan_counterm_8b_10b                             (inc_scan_counterm_8b_10b                      ),
   /* output logic [output_data_parallelization_ratio-1:0]                           */  .parallelizer_current_byte_enable                     (parallelizer_current_byte_enable              ),
   /* output logic [num_bits_in_raw_frame-1:0] x[output_data_parallelization_ratio-1]*/  .parallelizer_output_regs                             (parallelizer_output_regs                      ),
   /* output logic [numbits_dataout-1:0] */                                              .fixed_delay_data_out_prior_to_lane_alignment         (fixed_delay_data_out_prior_to_lane_alignment  ),                                                                                       
											  /* output */                               .fixed_delay_decoder_control_character_detected       (fixed_delay_decoder_control_character_detected),              
											                                             .data_out_parallel_clock                              (wrclk_fifo_xcvr                               ),
											                                             .raw_resynced_parallelized_data_out,
																						 .pll_generated_20x_of_data_out_parallel_clock,
																						 .enable_clocking_of_output_data,
																						 .new_data_word_ready_now,   
											                                             .intermediate_clk,
																						 .intermediate_data,
																						 .actual_ce_conv_up,  
																						 .actual_ce_conv_down
											                                             
											                                             

);


endmodule
`default_nettype wire

