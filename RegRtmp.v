`timescale 1ns / 1ps
module RegRtmp(
    input [4:0] rt,
    input [4:0] rd,
    input regrt,
    output reg [4:0] destReg);
    always @(*) begin 
        if (regrt == 1'b0)
            destReg = rd;
        else
            destReg = rt;
    end
endmodule
