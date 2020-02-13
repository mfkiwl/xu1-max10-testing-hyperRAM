module test_generate_multi_parallel_powered_matrix_mults_comb
#(
parameter MATRIX_NUMROWS = 3,
parameter NUM_OUTPUT_BITS = 29,
parameter N_PER_STAGE = MATRIX_NUMROWS,
parameter ROUND_DOWN_NUM_MATRICES =  NUM_OUTPUT_BITS/MATRIX_NUMROWS,
parameter NUM_MATRICES = (ROUND_DOWN_NUM_MATRICES*MATRIX_NUMROWS >= NUM_OUTPUT_BITS) ? ROUND_DOWN_NUM_MATRICES : (ROUND_DOWN_NUM_MATRICES+1)
)
(
output  reg [MATRIX_NUMROWS-1:0] in_vector = 1,
output  logic [MATRIX_NUMROWS-1:0] the_matrix[MATRIX_NUMROWS],
output  logic [MATRIX_NUMROWS-1:0] exact_out_matrix[MATRIX_NUMROWS],
output  logic [MATRIX_NUMROWS-1:0] out_vectors[NUM_MATRICES],
output  logic [MATRIX_NUMROWS-1:0] the_matrix_to_desired_power[NUM_MATRICES][MATRIX_NUMROWS],
output  logic [NUM_OUTPUT_BITS-1:0] out_data,
output  logic [NUM_MATRICES*MATRIX_NUMROWS-1:0] raw_out_data,
input do_not_transpose_output_data,
output logic [MATRIX_NUMROWS-1:0] next_in_vector,
output  logic [2:0] feedback_taps3,
input clk,
input reset
);
/*
assign the_matrix = '{
                     3'b101,
                     3'b100,
                     3'b010
                     };					 
*/
assign feedback_taps3 = 3'b010;

make_lfsr_transition_matrix_comb
#(
.N(3)
)
make_matrix3
(
  .the_matrix(the_matrix),
  .feedback_taps(feedback_taps3)
);

                      
always_ff @(posedge clk or posedge reset)
begin
       if (reset)
       in_vector = 1;
       else
       in_vector <=  (in_vector == 0) ? 1 : next_in_vector;
end


//assign in_vector = 1;

generate_multi_parallel_powered_matrix_mults_comb
#(
.MATRIX_NUMROWS(MATRIX_NUMROWS),
.NUM_OUTPUT_BITS(NUM_OUTPUT_BITS)
)
generate_multi_parallel_powered_matrix_mults_comb_inst
(
.*
);

endmodule