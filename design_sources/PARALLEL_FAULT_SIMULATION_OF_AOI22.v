`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2020 03:24:27 AM
// Design Name: 
// Module Name: PARALLEL_FAULT_SIMULATION_OF_AOI22
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module PARALLEL_SIMULATION_OF_AOI22
(
A,
B,
C,
D,
DETECT_SA0,
DETECT_SA1,
OUTPUT_FAULT_FREE,
OUTPUT_WITH_SA0,
OUTPUT_WITH_SA1
);
input A,B,C,D;
output [0:7]DETECT_SA0; //TO DETECT FAULTS AT 7 NETS 3 BITS ARE REQUIRED
output [0:7]DETECT_SA1;
output OUTPUT_FAULT_FREE;
output [0:7]OUTPUT_WITH_SA0;
output [0:7]OUTPUT_WITH_SA1;

//By default, fault_inject is defined as 0, so it is modified only when s-a-1 is to be injected
//for s-a-0, fault_inject need not be overridden; Only fault_injected line need to be selected

//FAULT FREE MODULE
AOI22_with_fault_capability FAULT_FREE(Out_ffree,A,B,C,D);
//--------------------------------------------------------------------

//Net 0 s-a-0
defparam Net_0_Out_SA0.Sel0=1'b1;
AOI22_with_fault_capability Net_0_Out_SA0(Out_0_SA0,A,B,C,D);
assign DETECT_SA0[0] = Out_ffree^Out_0_SA0;

//Net 0 s-a-1
defparam Net_0_Out_SA1.fault_inject=1'b1, Net_0_Out_SA1.Sel0=1'b1;
AOI22_with_fault_capability Net_0_Out_SA1(Out_0_SA1,A,B,C,D);
assign DETECT_SA1[0] = Out_ffree^Out_0_SA1;

//Net 1 s-a-0
defparam Net_1A_SA0.Sel1=1'b1;
AOI22_with_fault_capability Net_1A_SA0(Out_1A_SA0,A,B,C,D);
assign DETECT_SA0[1] = Out_ffree^Out_1A_SA0; 

//Net 1 s-a-1
defparam Net_1A_SA1.fault_inject=1'b1,Net_1A_SA1.Sel1=1'b1;
AOI22_with_fault_capability Net_1A_SA1(Out_1A_SA1,A,B,C,D);
assign DETECT_SA1[1] = Out_ffree^Out_1A_SA1; 

//Net 2 s-a-0
defparam Net_2B_SA0.Sel2=1'b1;
AOI22_with_fault_capability Net_2B_SA0(Out_2B_SA0,A,B,C,D);
assign DETECT_SA0[2] = Out_ffree^Out_2B_SA0;

//Net 2 s-a-1
defparam Net_2B_SA1.fault_inject=1'b1,Net_2B_SA1.Sel2=1'b1;
AOI22_with_fault_capability Net_2B_SA1(Out_2B_SA1,A,B,C,D);
assign DETECT_SA1[2] = Out_ffree^Out_2B_SA1;

//Net 3 s-a-0
defparam Net_3C_SA0.Sel3=1'b1;
AOI22_with_fault_capability Net_3C_SA0(Out_3C_SA0,A,B,C,D);
assign DETECT_SA0[3] = Out_ffree^Out_3C_SA0;

//Net 3 s-a-1
defparam Net_3C_SA1.fault_inject=1'b1,Net_3C_SA1.Sel3=1'b1;
AOI22_with_fault_capability Net_3C_SA1(Out_3C_SA1,A,B,C,D);
assign DETECT_SA1[3] = Out_ffree^Out_3C_SA1;

//Net 4 s-a-0
defparam Net_4D_SA0.Sel4=1'b1;
AOI22_with_fault_capability Net_4D_SA0(Out_4D_SA0,A,B,C,D);
assign DETECT_SA0[4] = Out_ffree^Out_4D_SA0;

//Net 4 s-a-1
defparam Net_4D_SA1.fault_inject=1'b1,Net_4D_SA1.Sel4=1'b1;
AOI22_with_fault_capability Net_4D_SA1(Out_4D_SA1,A,B,C,D);
assign DETECT_SA1[4] = Out_ffree^Out_4D_SA1;

//Net 5 s-a-0
defparam Net_5_SA0.Sel5=1'b1;
AOI22_with_fault_capability Net_5_SA0(Out_5_SA0,A,B,C,D);
assign DETECT_SA0[5] = Out_ffree^Out_5_SA0;

//Net 5 s-a-1
defparam Net_5_SA1.fault_inject=1'b1,Net_5_SA1.Sel5=1'b1;
AOI22_with_fault_capability Net_5_SA1(Out_5_SA1,A,B,C,D);
assign DETECT_SA1[5] = Out_ffree^Out_5_SA1;

//Net 6 s-a-0
defparam Net_6_SA0.Sel6=1'b1;
AOI22_with_fault_capability Net_6_SA0(Out_6_SA0,A,B,C,D);
assign DETECT_SA0[6] = Out_ffree^Out_6_SA0;
//Net 6 s-a-1
defparam Net_6_SA1.fault_inject=1'b1,Net_6_SA1.Sel6=1'b1;
AOI22_with_fault_capability Net_6_SA1(Out_6_SA1,A,B,C,D);
assign DETECT_SA1[6] = Out_ffree^Out_6_SA1;

//Net 7 s-a-0
defparam Net_7_SA0.Sel7=1'b1;
AOI22_with_fault_capability Net_7_SA0(Out_7_SA0,A,B,C,D);
assign DETECT_SA0[7] = Out_ffree^Out_7_SA0;

//Net 7 s-a-1
defparam Net_7_SA1.fault_inject=1'b1,Net_7_SA1.Sel7=1'b1;
AOI22_with_fault_capability Net_7_SA1(Out_7_SA1,A,B,C,D);
assign DETECT_SA1[7] = Out_ffree^Out_7_SA1;

assign OUTPUT_FAULT_FREE = Out_ffree;
assign OUTPUT_WITH_SA0[0] = Out_0_SA0;
assign OUTPUT_WITH_SA0[1] = Out_1A_SA0;
assign OUTPUT_WITH_SA0[2] = Out_2B_SA0;
assign OUTPUT_WITH_SA0[3] = Out_3C_SA0;
assign OUTPUT_WITH_SA0[4] = Out_4D_SA0;
assign OUTPUT_WITH_SA0[5] = Out_5_SA0;
assign OUTPUT_WITH_SA0[6] = Out_6_SA0;
assign OUTPUT_WITH_SA0[7] = Out_7_SA0;
            
assign OUTPUT_WITH_SA1[0] = Out_0_SA1;
assign OUTPUT_WITH_SA1[1] = Out_1A_SA1;
assign OUTPUT_WITH_SA1[2] = Out_2B_SA1;
assign OUTPUT_WITH_SA1[3] = Out_3C_SA1;
assign OUTPUT_WITH_SA1[4] = Out_4D_SA1;
assign OUTPUT_WITH_SA1[5] = Out_5_SA1;
assign OUTPUT_WITH_SA1[6] = Out_6_SA1;
assign OUTPUT_WITH_SA1[7] = Out_7_SA1;

endmodule
