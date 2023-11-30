`timescale 1ns / 1ps
module Data_Memory(
    input [31:0] mr,
    input [31:0] mqb,
    input mwmem,
    input clock,
    output reg [31:0] mdo);
    reg [31:0] memory [0:63];
    initial begin
        memory[0] = {4'hA, 20'h0, 4'hA, 4'hA};
        memory[1] = {4'h1, 20'h0, 4'h1, 4'h1};
        memory[2] = {4'h2, 20'h0, 4'h2, 4'h2};
        memory[3] = {4'h3, 20'h0, 4'h3, 4'h3};
        memory[4] = {4'h4, 20'h0, 4'h4, 4'h4};
        memory[5] = {4'h5, 20'h0, 4'h5, 4'h5};
        memory[6] = {4'h6, 20'h0, 4'h6, 4'h6};
        memory[7] = {4'h7, 20'h0, 4'h7, 4'h7};
        memory[8] = {4'h8, 20'h0, 4'h8, 4'h8};
        memory[9] = {4'h9, 20'h0, 4'h9, 4'h9};  
    end
    always @(*) begin
        mdo = memory[mr[7:2]];
    end
    always @(negedge clock) begin
        if (mwmem == 1'b1)
            memory[mr[7:2]] = mqb;
    end       
endmodule
