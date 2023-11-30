`timescale 1ns / 1ps
module ALU_mult(
    input [31:0] eqb,
    input [31:0] eimm32,
    input ealuimm,
    output reg [31:0] b);
    always @(*) begin
        if (ealuimm == 1'b0)
            b = eqb;
        else
            b = eimm32;
    end
endmodule
