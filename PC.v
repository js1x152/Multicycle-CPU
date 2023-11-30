`timescale 1ns / 1ps
module PC(
    input [31:0] nextpc,
    input clk,
    output reg [31:0] pc
    );
    initial pc = 32'd100; 
    always @(posedge clk)
    begin
        pc = nextpc;
    end
endmodule
