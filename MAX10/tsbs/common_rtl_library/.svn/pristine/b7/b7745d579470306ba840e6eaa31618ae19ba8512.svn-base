`default_nettype none
module test_avsoc_maxv_parallel_flash_read_controller
#(
parameter wait_counter_bits = 5
)
(
input  wire clk,
input  reset,
output wire start_delay_counter,
output logic  [15:0] state,
input  [wait_counter_bits-1:0] wait_for_flash,
output wait_counter_finished,
output   delay_reset_n,

output dir,

input [29:0] flash_addr_request,
input async_start,
output sync_start,

output [2:0] addr_out,
output latch_now,

output [5:0] data_out,
output  [7:0] data_in,

output reg [15:0] flash_read_result = 0,
output latch_result_now,
output finish,
output reg result_ready = 0,
output [29:0] flash_addr_to_chip,
input [15:0] received_data_from_flash,
output [7:0] current_returned_data_byte,    
output [2:0]  current_register_index,
output [5:0]  data_from_arria_v,
output logic [5:0] address_reg [8] //locations 5, 6, 7 are minimized
);

avsoc_maxv_parallel_flash_read_controller
#(
.wait_counter_bits(wait_counter_bits)
)
avsoc_maxv_parallel_flash_read_controller_inst
(
 .*
);

assign current_register_index = addr_out;
assign data_from_arria_v = data_out;
assign data_in = current_returned_data_byte;
 
avsoc_maxv_command_receiver
avsoc_maxv_command_receiver_inst
(
.*,
.flash_addr_request(flash_addr_to_chip)
);

 
endmodule
`default_nettype wire
