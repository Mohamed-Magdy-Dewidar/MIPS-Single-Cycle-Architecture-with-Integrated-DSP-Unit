//`timescale 1ns / 1ps

module data_memory(
    (* dont_touch = "yes" *) input wire clk,
    (* dont_touch = "yes" *) input wire we,
    (* dont_touch = "yes" *) input wire [31:0] a,
    (* dont_touch = "yes" *) input wire [31:0] wd,
    (* dont_touch = "yes" *) output wire [31:0] rd
    );
    reg [31:0] dmem[1023:0];   
    assign rd = dmem[a[11:2]];   
    always @(posedge clk)
        if (we) begin
            dmem[a[11:2]] <= wd;
        end
endmodule



//`timescale 1ns / 1ps
//module data_memory(
//    input wire clk,
//    input wire we,
//    input wire [31:0] a,
//    input wire [31:0] wd,
//    output wire [31:0] rd,
//    output wire [31:0] mem_80,
//    output wire [31:0] mem_84
//);
//    reg [31:0] dmem[1023:0];
//    assign rd = dmem[a[11:2]];
//    assign mem_80 = dmem[20];    // address 80 / 4
//    assign mem_84 = dmem[21];    // address 84 / 4

//    always @(posedge clk)
//        if (we)
//            dmem[a[11:2]] <= wd;
//endmodule
