module test_cummings_cdc
#(
parameter width = 8

)
(
input clka,
input clkb,
input new_data_a,
input [width-1:0] data_a,
output [width-1:0] data_b,
output aready,
output bvalid
);

mcp_blk 
#(
.width(width)
)
mcp_blk_inst
 (
/* output  logic */                 .aready  (aready), // ready to receive next data
/* input  logic [(width-1):0] */    .adatain (data_a),
/* input  logic */                  .asend   (new_data_a),
/* input  logic */                  .aclk    (clka),
/* input  logic */                  .arst_n  (1'b1),
/* output  logic  [(width-1):0]  */ .bdata   (data_b),
/* output  logic */                 .bvalid  (bvalid), // bdata valid (ready)
/* input  logic */                  .bload   (1'b1),
/* input  logic */                  .bclk    (clkb),
/* input  logic */                  .brst_n  (1'b1)
);

endmodule











