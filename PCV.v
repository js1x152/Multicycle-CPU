`timescale 1ns / 1ps
module PCV(
input [31:0] nextpc,
input clk,
output reg [31:0] pc);
initial pc = 32'b1100100; 
always @(posedge clk)
    begin
        pc = nextpc;
    end
endmodule