`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module mux2to1(y,sel,I0,I1);
output y;
input sel,I0,I1;
assign y = I0 & ~sel | I1 & sel;
endmodule
