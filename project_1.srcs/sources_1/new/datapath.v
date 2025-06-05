`timescale 1ns / 1ps

module datapath(
    input wire clk,
    input wire reset,
    input wire memtoreg,
    input wire pcsrc,
    input wire alusrc,
    input wire regdst,
    input wire regwrite,
    input wire jump,
    input wire [2:0] alucontrol,
    input wire [2:0] dspcontrol,
    output wire zero,
    output wire [31:0] pc,
    input wire [31:0] instr,
    output wire [31:0] out,
    output wire [31:0] writedata,
    input wire [31:0] readdata,
    input wire dsporalu
    );
    
    wire [4:0] writereg;
    wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch; // Next PC
    wire [31:0] signimm, signimmsh; //signimm for i-type & signimmsh for branch
    wire [31:0] srca, srcb; //ALU inputs
    wire [31:0] result; //instruction result
    wire [31:0] aluout;
    wire [15:0] dspout;
    wire [31:0] dspoutextd;
    pc pcreg(
        clk, 
        reset,
        pcnext, 
        pc
    );
    adder pc4(
        pc, 
        32'b100, 
        pcplus4
    );
    shift_left_2 immsh2 (
        signimm, 
        signimmsh
    );
    adder brpc(
        pcplus4, 
        signimmsh, 
        pcbranch
    );
    mux_32 brpc4mux (
        pcplus4, 
        pcbranch, 
        pcsrc, 
        pcnextbr
    );
    mux_32 pcjmux (
        pcnextbr, 
        {pcplus4[31:28], 
        instr[25:0], 
        2'b00}, 
        jump, 
        pcnext
    );
    reg_file rf(
        clk, 
        regwrite, 
        instr[25:21], 
        instr[20:16], 
        writereg, 
        result, 
        srca,
        writedata
    );
    mux_5 a3(
        instr[20:16], 
        instr[15:11], 
        regdst, 
        writereg
    );
    mux_32 m2r(
        out, 
        readdata, 
        memtoreg, 
        result
    );
    sign_extd sextd(
        instr[15:0], 
        signimm
    );
    mux_32 srcbmux(
        writedata, 
        signimm, 
        alusrc, 
        srcb
    );
    alu alu(
        srca, 
        srcb, 
        alucontrol, 
        aluout, 
        zero
    );
    dsp dsp(
        clk,
        reset,
        dspcontrol,
        srca[15:0],
        dspout
    );
    
    sign_extd sextd2(
        dspout, 
        dspoutextd
    );
    mux_32 aludspresult(
        aluout, 
        dspoutextd, 
        dsporalu, 
        out
    );
endmodule



//`timescale 1ns / 1ps

//module datapath(
//    input wire clk,
//    input wire reset,
//    input wire memtoreg,
//    input wire pcsrc,
//    input wire alusrc,
//    input wire regdst,
//    input wire regwrite,
//    input wire jump,
//    input wire [2:0] alucontrol,
//    input wire [2:0] dspcontrol,
//    output wire zero,
//    output wire [31:0] pc,
//    input wire [31:0] instr,
//    output wire [31:0] out,
//    output wire [31:0] writedata,
//    input wire [31:0] readdata,
//    input wire dsporalu,

//    // ? Debug outputs from reg_file
//    output wire [31:0] reg2,
//    output wire [31:0] reg3,
//    output wire [31:0] reg4,
//    output wire [31:0] reg5,
//    output wire [31:0] reg7
//);

//    wire [4:0] writereg;
//    wire [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
//    wire [31:0] signimm, signimmsh;
//    wire [31:0] srca, srcb;
//    wire [31:0] result;
//    wire [31:0] aluout;
//    wire [15:0] dspout;
//    wire [31:0] dspoutextd;

//    // PC Register
//    pc pcreg(
//        clk, 
//        reset,
//        pcnext, 
//        pc
//    );

//    // PC + 4
//    adder pc4(
//        pc, 
//        32'b100, 
//        pcplus4
//    );

//    // Branch Target Calculation
//    shift_left_2 immsh2 (
//        signimm, 
//        signimmsh
//    );
//    adder brpc(
//        pcplus4, 
//        signimmsh, 
//        pcbranch
//    );
//    mux_32 brpc4mux (
//        pcplus4, 
//        pcbranch, 
//        pcsrc, 
//        pcnextbr
//    );
//    mux_32 pcjmux (
//        pcnextbr, 
//        {pcplus4[31:28], instr[25:0], 2'b00}, 
//        jump, 
//        pcnext
//    );

//    // Register File
//    reg_file rf(
//        clk, 
//        reset,
//        regwrite, 
//        instr[25:21], 
//        instr[20:16], 
//        writereg, 
//        result, 
//        srca,
//        writedata,
//        reg2, reg3, reg4, reg5, reg7
//    );

//    // Write Register Selection
//    mux_5 a3(
//        instr[20:16], 
//        instr[15:11], 
//        regdst, 
//        writereg
//    );

//    // Memory-to-Register Mux
//    mux_32 m2r(
//        out, 
//        readdata, 
//        memtoreg, 
//        result
//    );

//    // Sign Extend
//    sign_extd sextd(
//        instr[15:0], 
//        signimm
//    );

//    // ALU Source B
//    mux_32 srcbmux(
//        writedata, 
//        signimm, 
//        alusrc, 
//        srcb
//    );

//    // ALU
//    alu alu(
//        srca, 
//        srcb, 
//        alucontrol, 
//        aluout, 
//        zero
//    );

//    // DSP block
//    dsp dsp(
//        clk,
//        reset,
//        dspcontrol,
//        srca[15:0],
//        dspout
//    );

//    // DSP Output Extend
//    sign_extd sextd2(
//        dspout, 
//        dspoutextd
//    );

//    // DSP/ALU Result Select
//    mux_32 aludspresult(
//        aluout, 
//        dspoutextd, 
//        dsporalu, 
//        out
//    );
    

//endmodule


