module test_parallel_output_lfsr_with_clk_enable
#(
parameter LFSR_WIDTH = 3,
parameter NUM_OUTPUT_BITS = 10,
parameter [LFSR_WIDTH-1:0] FEEDBACK_TAPS = 3'b010,
parameter [LFSR_WIDTH-1:0] INITIAL_LFSR_VAL = 3'b001,
parameter [NUM_OUTPUT_BITS-1:0] INITIAL_OUTDATA_VAL = 0
)
(
output  reg   [LFSR_WIDTH-1:0] in_vector = INITIAL_LFSR_VAL,
output  logic [NUM_OUTPUT_BITS-1:0] out_data,
output  logic [NUM_OUTPUT_BITS-1:0] raw_out_data,
output  logic [LFSR_WIDTH-1:0] transition_matrix[LFSR_WIDTH],
output  logic [LFSR_WIDTH-1:0] exact_out_matrix[LFSR_WIDTH],
output  logic [LFSR_WIDTH-1:0] next_in_vector,
input do_not_transpose_output_data,
input clk,
input reset,
input in_vector_clock_enable,
input out_data_clock_enable
);

parallel_output_lfsr_with_clk_enable
#(
.LFSR_WIDTH         (LFSR_WIDTH         ),
.NUM_OUTPUT_BITS    (NUM_OUTPUT_BITS    ),
.FEEDBACK_TAPS      (FEEDBACK_TAPS      ),
.INITIAL_LFSR_VAL   (INITIAL_LFSR_VAL   ),
.INITIAL_OUTDATA_VAL(INITIAL_OUTDATA_VAL)
)
parallel_output_lfsr_with_clk_enable_inst
(
.*
);


endmodule