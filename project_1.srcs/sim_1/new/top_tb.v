

//`timescale 1ns / 1ps
//module testbench();
//    reg clk;
//    reg reset;
//    // instantiate device to be tested
//    top dut (clk, reset);
    
//    // initialize test
//    initial begin
//        reset = 1;
//        #22;
//        reset = 0;
//    end
    
//    // generate clock to sequence tests
//    always begin
//        clk = 1;
//        #10;
//        clk = 0;
//        #10;
//    end
//endmodule



`timescale 1ns / 1ps


module testbench();
    reg clk;
    reg reset;

    // Wires to observe internal signals from top
    wire [31:0] pc;
    wire [31:0] instr;
    wire memwrite;
    wire [31:0] dataadr;
    wire [31:0] writedata;

    // Instantiate DUT with signal bindings
    top dut (
        .clk(clk),
        .reset(reset),
        .pc(pc),
        .instr(instr),
        .memwrite(memwrite),
        .dataadr(dataadr),
        .writedata(writedata)
    );

    // Initialize test
    initial begin
        clk = 0;
        reset = 1;
        #22;
        reset = 0;
    end

    // Clock generator
    always begin
        #10 clk = ~clk;
    end

   
endmodule



//`timescale 1ns / 1ps

//module testbench;

//  reg clk;
//  reg reset;

//  wire [31:0] reg2, reg3, reg4, reg5, reg7;
//  wire [31:0] mem_out_80, mem_out_84;

//  top dut (
//    .clk(clk),
//    .reset(reset),
//    .reg2(reg2),
//    .reg3(reg3),
//    .reg4(reg4),
//    .reg5(reg5),
//    .reg7(reg7),
//    .mem_out_80(mem_out_80),
//    .mem_out_84(mem_out_84)
//  );

//  // Clock generation
//  initial begin
//    clk = 0;
//    forever #10 clk = ~clk;
//  end

//  // Stimulus
//  initial begin
//    reset = 1;
//    #22 reset = 0;

//    // Let simulation run long enough for all instructions
//    #8000; // wait for many clock cycles to complete program
    
//    $display("=== Register and Memory Results ===");
//    $display("$2 = %d", reg2);
//    $display("$3 = %d", reg3);
//    $display("$4 = %d", reg4);
//    $display("$5 = %d", reg5);
//    $display("$7 = %d", reg7);
//    $display("mem[80] = %d", mem_out_80);
//    $display("mem[84] = %d", mem_out_84);
////    $display("Filtered output in $32 = %d", dut.mips.dp.reg32); // or reg32
////    $display("Filtered output in mem[84] = %d", dut.readdata);   // if reading back

//    $finish;
//  end

//endmodule


