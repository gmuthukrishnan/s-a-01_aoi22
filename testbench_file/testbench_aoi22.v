`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2020 03:55:35 AM
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
module PARALLEL_FAULT_SIM_AOI22_TB();
reg A,B,C,D;
wire [0:7]DETECT_SA0;
wire [0:7]DETECT_SA1;
wire Output_ffree;
wire [0:7]Output_with_SA0;
wire [0:7]Output_with_SA1;
integer file,i,j;
reg [3:0]VECTOR;

//reg [2:0]i,j; 
//when declared as reg with required length, it is not writing to file
//may be because it is mismatching with the length of the file descriptor "file" which is 32-bit long

//-----------------------------------------------------------------------------------------------------
PARALLEL_SIMULATION_OF_AOI22 DUT1
(
.A(A),
.B(B),
.C(C),
.D(D),
.DETECT_SA0(DETECT_SA0),
.DETECT_SA1(DETECT_SA1),
.OUTPUT_FAULT_FREE(Output_ffree),
.OUTPUT_WITH_SA0(Output_with_SA0),
.OUTPUT_WITH_SA1(Output_with_SA1)
);
//-----------------------------------------------------------------------------------------------------
initial begin
    VECTOR=4'b0000;
    A=0;
    B=0;
    C=0;
    D=0;
  file = $fopen("fault_report.txt","w");
//======================================================================
    for (i = 0; i<16; i=i+1) begin
            A = VECTOR[3];
            B = VECTOR[2];
            C = VECTOR[1];
            D = VECTOR[0];
            #50;
            //delay for the UUT to execute with these a,b,c values and then return the corresponding detect_asa0 etc values      
            $display("VECTOR = %b; FAULT FREE O/P = %b; NET 0-7 S-a-0 O/P = %b; NET 0-7 S-a-1 O/P = %b",VECTOR,Output_ffree,Output_with_SA0,Output_with_SA1);
            for (j = 0; j<8; j=j+1) begin
                    if(DETECT_SA0[j])
                    $fdisplay (file,"====   TEST VECTOR     ABCD =       %b;      FAULT FOUND;        NET %0d STUCK-AT-'0'    ====\n",VECTOR,j);
                    if (DETECT_SA1[j])
                    $fdisplay (file,"****   TEST VECTOR     ABCD =       %b;      FAULT FOUND;        NET %0d STUCK-AT-'1'    ****\n",VECTOR,j);
            end //end of for loop with integer j
                    if (DETECT_SA0 == 0 && DETECT_SA1 == 0)
                    $fdisplay (file,"----   TEST VECTOR     ABCD =       %b;      NO FAULT FOUND;\n",VECTOR);
            $fdisplay (file,"---------------------------------------------------------------------------------------------\n");    
            VECTOR=VECTOR+1;
    end //end of for loop with integer i
    $fclose(file);
    $finish;
end //end of Initial block
endmodule
