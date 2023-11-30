`timescale 1ns / 1ps
module PC_Adder(
    input [31:0] pc,
    output reg [31:0] nextpc);
    always @(*) begin
        nextpc = pc + 32'd4; // nextpc = pc + 4 32'b00000000000000000000000000000100;
    end   
endmodule
