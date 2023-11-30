`timescale 1ns / 1ps
module Datapath(
    input clk,
    output [4:0] rs,
    output [4:0] rt,
    output [31:0] wbData,
    output [31:0] qa,
    output [31:0] qb,
    output wwreg,
    output wm2reg,
    output [4:0] wdestReg,
    output [31:0] wr,
    output [31:0] wdo
    );
    //wire declaration
    wire [31:0] nextpc, instOut;                        //IF
    wire [31:0] fwdao,dinstOut,fwdbo,imm32;               //ID dinstOut
    wire wreg,m2reg,wmem,aluimm,regert;
    wire [3:0] aluc;
    wire [1:0] fwdb,fwda;
    wire [4:0] rn;                  
    wire ewreg,em2reg,ewmem,ealuimm;                      //E
    wire [3:0] ealuc;
    wire [31:0] eimm32,eqb,b,eqa,r;
    wire [4:0] ern;
    wire mwreg,mm2reg,mwmem;                              //M 
    wire [31:0] mqb,mr,mdo;
    wire [4:0] mrn;
    // Modules 
    wire[31:0] pc;
    PC pcm(nextpc, clk, pc);                         
    InstructionMem IMEM(pc, instOut);
    PC_Adder pca(pc, nextpc);
    IFIDreg idifbus(instOut, clk, dinstOut);
    wire[5:0] op = dinstOut[31:26];
    assign rs = dinstOut[25:21];
    assign rt = dinstOut[20:16];
    wire[4:0] rd = dinstOut[15:11];
    wire[5:0] funct = dinstOut[5:0];
    wire[15:0] imm = dinstOut[15:0];
    ControlUnit cu (op,funct,rs,rt,mrn,mm2reg,mwreg,ern,em2reg,ewreg,wreg,m2reg,wmem,aluc,aluimm,regrt,fwda,fwdb);  //id
    RegRtmp mulrt(rt,rd,regrt,rn);
    Fwd_mult_A fwdA(qa, r, mr, mdo, fwda, fwdao);
    Fwd_mult_B fwdB(qb, r, mr, mdo, fwdb, fwdbo);
    ImmExt Iext(imm,imm32);
    IDEXE iebus(wreg,m2reg,wmem,aluc,aluimm,rn,fwdao,fwdbo,imm32,clk,ewreg,em2reg,ewmem,ealuc,ealuimm,ern,eqa,eqb,eimm32);
    ALU_mult multalu(eqb,eimm32,ealuimm,b);                                                                       //e
    ALU alu(eqa,b,ealuc,r);
    EXE_MEM_reg embus(ewreg,em2reg,ewmem,ern,r,eqb,clk,mwreg,mm2reg,mwmem,mrn,mr,mqb);
    Data_Memory dm(mr,mqb,mwmem,clk,mdo);                                                                         //m
    MEM_WB_reg mwbus(mwreg,mm2reg,mrn,mr,mdo,clk,wwreg,wm2reg,wdestReg,wr,wdo);
    WB_multiplexer wbmult(wr,wdo,wm2reg,wbData);                                                                  //w
    RegiFile rf(rs,rt,wdestReg,wbData,wwreg,~clk,qa,qb);                                                                   
    

    
endmodule
