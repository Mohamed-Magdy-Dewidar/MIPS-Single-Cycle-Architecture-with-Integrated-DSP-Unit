`timescale 1ns / 1ps

module control_unit(
    input wire [5:0] opcode,
    input wire [5:0] funct,
    input wire [4:0] dsp,
    input zero,
    output wire memtoreg,
    output wire memwrite,
    output wire pcsrc,
    output wire alusrc,
    output wire regdst,
    output wire regwrite,
    output wire jump,
    output wire [2:0] alucontrol,
    output wire [2:0] dspcontrol,
    output wire dsporalu
    );
    wire [1:0] op;
    wire branch;
    main_decoder md(
        opcode, 
        memtoreg, 
        memwrite, 
        branch,
        dsporalu,
        alusrc,
        regdst, 
        regwrite, 
        jump, 
        op
    );
    secondary_decoder sd(
        funct,
        dsp,
        op, 
        alucontrol,
        dspcontrol
    );
    assign pcsrc = branch & zero;
endmodule
