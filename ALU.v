`timescale 1ns / 1ps
module ALU(
    input [31:0] eqa,
    input [31:0] b,
    input [3:0] ealuc,
    output reg [31:0] r);
    always @(*) begin
        case(ealuc)
            4'b0010:    //add
                begin
                    r = eqa + b;
                end
            4'b0000:    //and
                begin
                    r = eqa & b;
                end
            4'b0110:    //sub
                begin
                    r = eqa - b;
                end
            4'b1001:    //xor
                begin
                    r = eqa ^ b;
                end
            4'b0001:    //or
                begin
                    r = eqa | b;
                end
            default:
            begin
                r = 32'bx;
            end
        endcase
    end
endmodule
