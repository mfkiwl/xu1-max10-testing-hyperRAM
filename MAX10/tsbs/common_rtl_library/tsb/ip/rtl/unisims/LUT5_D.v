// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/rainier/LUT5_D.v,v 1.2.156.1 2007/03/09 18:12:56 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.1i (I.13)
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  5-input Look-Up-Table with Dual Output
// /___/   /\     Filename : LUT5_D.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:54 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Replace premitive with function; Remove buf.
// End Revision

`timescale  100 ps / 10 ps


module LUT5_D (LO, O, I0, I1, I2, I3, I4);

  parameter INIT = 32'h00000000;

  input I0, I1, I2, I3, I4;

  output LO, O;

  reg O;
  reg tmp;
  wire LO;

  assign LO = O;

  always @( I4 or I3 or  I2 or  I1 or  I0 )  begin
 
    tmp =  I0 ^ I1  ^ I2 ^ I3 ^ I4;

    if ( tmp == 0 || tmp == 1)

        O = INIT[{I4, I3, I2, I1, I0}];

    else 
    
      O =  lut4_mux4 ( 
                        { lut6_mux8 ( INIT[31:24], {I2, I1, I0}),
                          lut6_mux8 ( INIT[23:16], {I2, I1, I0}),
                          lut6_mux8 ( INIT[15:8], {I2, I1, I0}),
                          lut6_mux8 ( INIT[7:0], {I2, I1, I0}) }, { I4, I3});
  end

  function lut6_mux8;
  input [7:0] d;
  input [2:0] s;
   
  begin

       if ((s[2]^s[1]^s[0] ==1) || (s[2]^s[1]^s[0] ==0))
           
           lut6_mux8 = d[s];

         else
           if ( ~(|d))
                 lut6_mux8 = 1'b0;
           else if ((&d))
                 lut6_mux8 = 1'b1;
           else if (((s[1]^s[0] ==1'b1) || (s[1]^s[0] ==1'b0)) && (d[{1'b0,s[1:0]}]===d[{1'b1,s[1:0]}]))
                 lut6_mux8 = d[{1'b0,s[1:0]}];
           else if (((s[2]^s[0] ==1) || (s[2]^s[0] ==0)) && (d[{s[2],1'b0,s[0]}]===d[{s[2],1'b1,s[0]}]))
                 lut6_mux8 = d[{s[2],1'b0,s[0]}];
           else if (((s[2]^s[1] ==1) || (s[2]^s[1] ==0)) && (d[{s[2],s[1],1'b0}]===d[{s[2],s[1],1'b1}]))
                 lut6_mux8 = d[{s[2],s[1],1'b0}];
           else if (((s[0] ==1) || (s[0] ==0)) && (d[{1'b0,1'b0,s[0]}]===d[{1'b0,1'b1,s[0]}]) &&
              (d[{1'b0,1'b0,s[0]}]===d[{1'b1,1'b0,s[0]}]) && (d[{1'b0,1'b0,s[0]}]===d[{1'b1,1'b1,s[0]}]))
                 lut6_mux8 = d[{1'b0,1'b0,s[0]}];
           else if (((s[1] ==1) || (s[1] ==0)) && (d[{1'b0,s[1],1'b0}]===d[{1'b0,s[1],1'b1}]) &&
              (d[{1'b0,s[1],1'b0}]===d[{1'b1,s[1],1'b0}]) && (d[{1'b0,s[1],1'b0}]===d[{1'b1,s[1],1'b1}]))
                 lut6_mux8 = d[{1'b0,s[1],1'b0}];
           else if (((s[2] ==1) || (s[2] ==0)) && (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b0,1'b1}]) &&
              (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b1,1'b0}]) && (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b1,1'b1}]))
                 lut6_mux8 = d[{s[2],1'b0,1'b0}];
           else
                 lut6_mux8 = 1'bx;
   end
  endfunction


  function lut4_mux4;
  input [3:0] d;
  input [1:0] s;
   
  begin

       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))

           lut4_mux4 = d[s];

         else if ((d[0] === d[1]) && (d[2] === d[3])  && (d[0] === d[2]) )
           lut4_mux4 = d[0];
         else if ((s[1] == 0) && (d[0] === d[1]))
           lut4_mux4 = d[0];
         else if ((s[1] == 1) && (d[2] === d[3]))
           lut4_mux4 = d[2];
         else if ((s[0] == 0) && (d[0] === d[2]))
           lut4_mux4 = d[0];
         else if ((s[0] == 1) && (d[1] === d[3]))
           lut4_mux4 = d[1];
         else
           lut4_mux4 = 1'bx;

   end
  endfunction

endmodule