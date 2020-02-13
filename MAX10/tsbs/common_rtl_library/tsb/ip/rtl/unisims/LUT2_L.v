// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/LUT2_L.v,v 1.6.158.1 2007/03/09 18:13:09 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.1i (I.13)
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  2-input Look-Up-Table with Local Output
// /___/   /\     Filename : LUT2_L.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:54 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Rev 0.0.1 Replace premitive with function; Remove buf.
// End Revision

`timescale  100 ps / 10 ps


module LUT2_L (LO, I0, I1);

    parameter INIT = 4'h0;

    input I0, I1;

    output LO;

    reg  LO;
    wire [1:0] s;

    assign s = {I1, I0};

    always @(s)
       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))
           LO = INIT[s];
         else if ((INIT[0] == INIT[1]) && (INIT[2] == INIT[3]) && (INIT[0] == INIT[2])) 
           LO = INIT[0];
         else if ((s[1] == 0) && (INIT[0] == INIT[1]))
           LO = INIT[0];
         else if ((s[1] == 1) && (INIT[2] == INIT[3])) 
           LO = INIT[2];
         else if ((s[0] == 0) && (INIT[0] == INIT[2])) 
           LO = INIT[0];
         else if ((s[0] == 1) && (INIT[1] == INIT[3]))
           LO = INIT[1];
         else
           LO = 1'bx;

endmodule