`default_nettype none
module test_multi_channel_generic_reframer_w_8b10b_decode
#(
parameter numchannels = 2,
parameter lock_wait_counter_bits = 9,
parameter num_bits_in_raw_frame = 8,
parameter num_bits_in_coded_frame = num_bits_in_raw_frame+2,
parameter output_data_parallelization_ratio = 4,
parameter valid_output_word_counter_bits = 32,
parameter control_code_counter_numbits = 16,
parameter insert_control_code_every = 9
)
(
   frame_clk,
   reset,
   frame_select,
   data_in,
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
   encoder_data_out,
   encoder_disparity,
   encoder_is_control_code,
   encoder_coded_8b_10b_data_fragment,
   intermediate_2x_coded_bit_data,
   intermediate_frame_select,
   selected_encoder_data_out,
   clear_scan_counter_8b_10b,
   inc_scan_counterm_8b_10b,
   parallelizer_current_byte_enable,
   parallelizer_output_regs,
   parallelizer_total_output_reg,
   valid_data_word_count,
   current_control_character,
   delay_data_out_for_lane_alignment,
   fixed_delay_data_out_prior_to_lane_alignment,
   fixed_delay_decoder_control_character_detected
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
  output  [num_bits_in_raw_frame-1:0]     data_in[numchannels];
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
  output [valid_output_word_counter_bits-1:0] valid_data_word_count[numchannels];
  input logic [numchannels-1:0] delay_data_out_for_lane_alignment;
  output logic [num_bits_in_raw_frame-1:0] fixed_delay_data_out_prior_to_lane_alignment[numchannels];
  output logic [num_bits_in_raw_frame-1:0] current_control_character[numchannels];
  output logic [numchannels-1:0] fixed_delay_decoder_control_character_detected;

  output [num_bits_in_coded_frame-1:0] encoder_data_out[numchannels];
  output encoder_disparity[numchannels];
  output reg encoder_is_control_code = 0;
  output [9:0] encoder_coded_8b_10b_data_fragment[numchannels];
  output reg [2*num_bits_in_coded_frame-1:0] intermediate_2x_coded_bit_data[numchannels];
  input  [num_selection_bits-1:0]            intermediate_frame_select[numchannels];
  output [num_bits_in_coded_frame-1:0]       selected_encoder_data_out[numchannels];
 


reg [control_code_counter_numbits-1:0] control_code_insert_counter = 0;

always_ff @(posedge frame_clk)
begin
      if (control_code_insert_counter >= insert_control_code_every-1)
      begin
           control_code_insert_counter <= 0;
           encoder_is_control_code <= 1;
      end else
      begin
           control_code_insert_counter <= control_code_insert_counter+1;
           encoder_is_control_code <= 0;
      end
end

genvar i;

generate
		for (i = 0; i < numchannels; i = i + 1)
		begin : generate_encoded_data
					Serial_Markov_Sequence_Generator_w_reset
					#(
					  .LFSR_LENGTH(15),
					  .lfsr_init_val(i > 0 ? 32'habcdef12 : 32'ha7f52749)
					)
					Markov_PN15_Serial_gen_inst
					(
					  .LFSR_Transition_Matrix(225'b100000000000001100000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010000000000000001000000000000000100000000000000010),
					  .clk(frame_clk),
					  .lfsr(data_in[i]),
					  .reset(reset),
					  .serial_output(),
					  .reverse_serial_output()
					);

                   assign current_control_character[i] = (i > 0) ? 8'b10111100 /* K28.5 */ : 8'b11111100 /* K28.7 */; 

					encode_lower_bits_of_frame_with_8b_10b_generic 
					#(
					.input_frame_length(num_bits_in_raw_frame)
					)
					encode_lower_bits_of_frame_with_8b_10b_generic_inst
					(
					.reset(reset),
					.data_in(encoder_is_control_code ? current_control_character[i] : data_in[i]),
					.data_out(encoder_data_out[i]),
					.clk(frame_clk),
					.disparity(encoder_disparity[i]),
					.is_control_code(encoder_is_control_code),
					.coded_8b_10b_data_fragment(encoder_coded_8b_10b_data_fragment[i])
					);


					always @(posedge frame_clk)
					begin
						 intermediate_2x_coded_bit_data[i] <= {intermediate_2x_coded_bit_data[i],encoder_data_out[i]};
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
											  /* output */                               .fixed_delay_decoder_control_character_detected       (fixed_delay_decoder_control_character_detected)              

);


endmodule
`default_nettype wire

