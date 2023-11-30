`timescale 1ns / 1ps
module Fwd_mult_A(
    input [31:0] qa,
    input [31:0] r,
    input [31:0] mr,
    input [31:0] mdo,
    input [1:0] fwda,
    output reg [31:0] fwdao);
    always @(*) begin 
        case (fwda)
            2'b00:
            begin
                fwdao = qa;
            end
            2'b01:
            begin
                fwdao = r;
            end
            2'b10:
            begin
                fwdao = mr;
            end
            2'b11:
            begin
                fwdao = mdo;
            end
        endcase
    end
endmodule
