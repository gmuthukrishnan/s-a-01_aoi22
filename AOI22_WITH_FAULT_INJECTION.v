`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2020 01:58:20 AM
// Design Name: 
// Module Name: AOI22_WITH_FAULT_INJECTION
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

//THIS MODULE IS TO DESCRIBE THE AOI22 FUNCTION WITH 2-TO-1 FAULT INDUCING MUX AT EVERY NETS TO
//INJECT STUCK AT FAULTS
module AOI22_with_fault_capability(Out,A,B,C,D);
input A,B,C,D;
output Out;
parameter fault_inject=1'b0;
//fault_inject is used to inject either a 0 or 1 as stuck at fault at a NET
parameter Sel1=1'b0,Sel2=1'b0,Sel3=1'b0,Sel4=1'b0,Sel5=1'b0,Sel6=1'b0,Sel7=1'b0,Sel0=1'b0;
//Select line for each input is required because in one instantiation of this module
//only one s-a fault is assumed to be present
//to uniquely represent that one fault, only one particular mux has to select 1 to inject fault
//while all other select lines should remain LOW
//the above are set as paramaters so that they can be overridden to inject faults
//Sn represents
//while calling them using the other module
wire Net1,Net2,Net3,Net4,Net5,Net6,Net7;
wire AND_1_out,AND_2_out,OR_out,INV_out;
//----------------------------------------------------------------------------
mux2to1 m1(Net1,Sel1,A,fault_inject);
mux2to1 m2(Net2,Sel2,B,fault_inject);
assign AND_1_out = Net1 & Net2;
//----------------------------------------------------------------------------
mux2to1 m3(Net3,Sel3,C,fault_inject);
mux2to1 m4(Net4,Sel4,D,fault_inject);
assign AND_2_out = Net3 & Net4;
//---------------------------------------------------------------------------
mux2to1 m5(Net5,Sel5,AND_1_out,fault_inject);
mux2to1 m6(Net6,Sel6,AND_2_out,fault_inject);
//----------------------------------------------------------------------------
assign OR_out = Net5 | Net6;
mux2to1 m7(Net7,Sel7,OR_out,fault_inject);
//----------------------------------------------------------------------------
assign INV_out = ~Net7;
mux2to1 m8(Out,Sel0,INV_out,fault_inject);
//----------------------------------------------------------------------------
endmodule