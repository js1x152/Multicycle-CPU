`timescale 1ns / 1ps
module Fwd_mult_B(
    input [31:0] qb,
    input [31:0] r,
    input [31:0] mr,
    input [31:0] mdo,
    input [1:0] fwdb,
    output reg [31:0] fwdbo);
    always @(*) begin 
        case (fwdb)
            2'b00:
            begin
                fwdbo = qb;
            end
            2'b01:
            begin
                fwdbo = r;
            end
            2'b10:
            begin
                fwdbo = mr;
            end
            2'b11:
            begin
                fwdbo = mdo;
            end
        endcase
    end
endmodule
