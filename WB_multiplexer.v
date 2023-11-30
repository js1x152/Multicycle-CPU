`timescale 1ns / 1ps
module WB_multiplexer(
    input [31:0] wr,
    input [31:0] wdo,
    input wm2reg,
    output reg [31:0] wbData
    );
    always @(*) begin
        if(wm2reg == 1'b0) 
            wbData = wr;
        else
            wbData = wdo;
    end
endmodule
