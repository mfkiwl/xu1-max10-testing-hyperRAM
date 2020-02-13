module test_make_lfsr_transition_matrix_comb
(
  output logic [2:0] the_matrix3[3],
  output  logic [2:0] feedback_taps3,
  output logic [6:0] the_matrix7[7],
  output  logic [6:0] feedback_taps7
);

assign feedback_taps3 = 3'b010;
assign feedback_taps7 = 7'b0100000;

make_lfsr_transition_matrix_comb
#(
.N(3)
)
make_matrix3
(
  .the_matrix(the_matrix3),
  .feedback_taps(feedback_taps3)
);


make_lfsr_transition_matrix_comb
#(
.N(7)
)
make_matrix7
(
  .the_matrix(the_matrix7),
  .feedback_taps(feedback_taps7)
);


endmodule

