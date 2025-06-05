`timescale 1ns / 1ps

//module top(
//    input wire clk, 
//    input wire reset
//    );
    
//    wire [31:0] pc, instr, dataadr, writedata, readdata;
//    wire memwrite;
//    mips mips(
//        clk, 
//        reset, 
//        pc, 
//        instr, 
//        memwrite, 
//        dataadr, 
//        writedata, 
//        readdata
//    );
//    instr_mem imem(
//        pc[9:2], 
//        instr
//    );
//    data_memory dmem(
//        clk, 
//        memwrite, 
//        dataadr, 
//        writedata, 
//        readdata
//    );
//endmodule



// this module was commented cause it have signals for simulations purpouse only
module top(
    input wire clk, 
    input wire reset,
    output wire [31:0] pc,
    output wire [31:0] instr,
    output wire memwrite,
    output wire [31:0] dataadr,
    output wire [31:0] writedata
    );

    mips mips(
        clk, 
        reset, 
        pc, 
        instr, 
        memwrite, 
        dataadr, 
        writedata, 
        readdata
    );

    instr_mem imem(
        pc[9:2], 
        instr
    );

    data_memory dmem(
        clk, 
        memwrite, 
        dataadr, 
        writedata, 
        readdata
    );
endmodule




//module top(
//    input wire clk,
//    input wire reset,
//    output wire [31:0] reg2, reg3, reg4, reg5, reg7,
//    output wire [31:0] mem_out_80,
//    output wire [31:0] mem_out_84
//);

//    wire [31:0] pc, instr, dataadr, writedata, readdata;
//    wire memwrite;
//    wire [31:0] mem_80, mem_84;

//    mips mips(
//        clk,
//        reset,
//        pc,
//        instr,
//        memwrite,
//        dataadr,
//        writedata,
//        readdata,
//        reg2, reg3, reg4, reg5, reg7
//    );

//    instr_mem imem(
//        pc[9:2],
//        instr
//    );

//    data_memory dmem(
//        clk,
//        memwrite,
//        dataadr,
//        writedata,
//        readdata,
//        mem_80,
//        mem_84
//    );

//    assign mem_out_80 = mem_80;
//    assign mem_out_84 = mem_84;

//endmodule

