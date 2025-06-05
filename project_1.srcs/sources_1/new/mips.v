`timescale 1ns / 1ps
module mips(
    (* dont_touch = "yes" *) input wire clk,
    (* dont_touch = "yes" *) input wire reset,
    (* dont_touch = "yes" *) output wire [31:0] pc,
    (* dont_touch = "yes" *) input wire [31:0] instr,
    (* dont_touch = "yes" *) output wire memwrite,
    (* dont_touch = "yes" *) output wire [31:0] out,
    (* dont_touch = "yes" *) output wire [31:0] writedata,
    (* dont_touch = "yes" *) input wire [31:0] readdata
    );
    
    wire memtoreg, regdst, regwrite, jump, pcsrc, zero;
    wire alusrc, dsporalu;
    wire [2:0] alucontrol, dspcontrol;
    
    control_unit cu(
        instr[31:26], 
        instr[5:0],
        instr[10:6],
        zero, 
        memtoreg, 
        memwrite, 
        pcsrc, 
        alusrc, 
        regdst, 
        regwrite, 
        jump, 
        alucontrol,
        dspcontrol,
        dsporalu
    );
    
    datapath dp(
        clk, 
        reset, 
        memtoreg, 
        pcsrc, 
        alusrc, 
        regdst, 
        regwrite, 
        jump, 
        alucontrol, 
        dspcontrol, 
        zero, 
        pc, 
        instr, 
        out, 
        writedata, 
        readdata,
        dsporalu
    );
endmodule


//`timescale 1ns / 1ps

//module mips(
//    input wire clk,
//    input wire reset,
//    output wire [31:0] pc,
//    input wire [31:0] instr,
//    output wire memwrite,
//    output wire [31:0] out,
//    output wire [31:0] writedata,
//    input wire [31:0] readdata,

//    // Debug register outputs
//    output wire [31:0] reg2,
//    output wire [31:0] reg3,
//    output wire [31:0] reg4,
//    output wire [31:0] reg5,
//    output wire [31:0] reg7
//);

//    wire memtoreg, regdst, regwrite, jump, pcsrc, zero;
//    wire alusrc, dsporalu;
//    wire [2:0] alucontrol, dspcontrol;

//    control_unit cu(
//        instr[31:26], 
//        instr[5:0],
//        instr[10:6],
//        zero, 
//        memtoreg, 
//        memwrite, 
//        pcsrc, 
//        alusrc, 
//        regdst, 
//        regwrite, 
//        jump, 
//        alucontrol,
//        dspcontrol,
//        dsporalu
//    );

//    datapath dp(
//        clk, 
//        reset, 
//        memtoreg, 
//        pcsrc, 
//        alusrc, 
//        regdst, 
//        regwrite, 
//        jump, 
//        alucontrol, 
//        dspcontrol, 
//        zero, 
//        pc, 
//        instr, 
//        out, 
//        writedata, 
//        readdata,
//        dsporalu,

//        // Forwarded register values
//        reg2, reg3, reg4, reg5, reg7
//    );

//endmodule
