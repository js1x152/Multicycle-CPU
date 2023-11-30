`timescale 1ns / 1ps
module ControlUnit(
    input [5:0] op,
    input [5:0] func,
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] mdestReg,
    input mm2reg,
    input mwreg,
    input [4:0] edestReg,
    input em2reg,
    input ewreg,
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0] aluc,
    output reg aluimm,
    output reg regrt,
    //output reg [31:0] wpcir,
    output reg [1:0] fwda,
    output reg [1:0] fwdb);
    initial begin
        fwda = 2'b00;
        fwdb = 2'b00;
    end
    always @(*) begin
        if (rs == edestReg) fwda = 2'b01;
        if (rt == edestReg) fwdb = 2'b01;
        if (rs == mdestReg) fwda = 2'b10;
        if (rt == mdestReg) fwdb = 2'b10;
        case (op)
        6'b000000: // r-types
        begin
            case (func)
                6'b100000: // ADD instruction 
                begin
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0010;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end  
                
                6'b100010: // SUB instruction
                begin
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0110;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                
                6'b100100: // AND instruction
                begin
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0000;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                
                6'b100101: // OR instruction
                begin
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b0001;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                
                6'b100110: // XOR instruction
                begin 
                    wreg = 1'b1;
                    m2reg = 1'b0;
                    wmem = 1'b0;
                    aluc = 4'b1001;
                    aluimm = 1'b0;
                    regrt = 1'b0;
                end
                
                default:
                begin
                    wreg = 1'bx;
                    m2reg = 1'bx;
                    wmem = 1'bx;
                    aluc = 4'bxxxx;
                    aluimm = 1'bx;
                    regrt = 1'bx;
                 end
             endcase
        end
        6'b100011: // lw
        begin 
            wreg = 1'b1;
            m2reg = 1'b1;
            wmem = 1'b0;
            aluc = 4'd2; // not used in LW
            aluimm = 1'b1;
            regrt = 1'b1; 
        end 
        default:
        begin
            wreg = 1'bx;
            m2reg = 1'bx;
            wmem = 1'bx;
            aluc = 4'bxxxx;
            aluimm = 1'bx;
            regrt = 1'bx;
        end
 endcase 
 end          
            
           
            
                
        
    
endmodule
