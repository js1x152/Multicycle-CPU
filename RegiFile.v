`timescale 1ns / 1ps
module RegiFile(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] wdestReg,
    input [31:0] wbData,
    input wwreg,
    input clk,
    output reg [31:0] qa,
    output reg [31:0] qb);
    reg [31:0] registers [0:31];
    integer i;
    initial
    begin
        for(i = 0; i < 32; i = i+1)
        begin
            registers[i] = 32'b0;
        end
    end
    always @(negedge clk) begin
        if( wwreg == 1'b1)
            registers[wdestReg] = wbData;
    end
    always @(*) begin
        qa = registers[rs]; //rs
        qb = registers[rt]; //rt
    end   
endmodule
