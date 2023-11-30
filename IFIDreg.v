`timescale 1ns / 1ps
module IFIDreg(
    input [31:0] instOut,
    input clk,
    output reg [31:0] dinstOut);
    always @ (posedge clk) 
    begin 
        dinstOut = instOut;
    end
endmodule
