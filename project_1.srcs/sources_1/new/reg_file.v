`timescale 1ns / 1ps
module reg_file(
    input wire clk,
    input wire we,
    input wire [4:0] a1,
    input wire [4:0] a2,
    input wire [4:0] a3,
    input wire [31:0] wd,
    output wire [31:0] rd1,
    output wire [31:0] rd2
    );

    reg [31:0] rf[31:0];

    always @(posedge clk) begin
        if (we) begin
            rf[a3] <= wd;
        end
    end

    assign rd1 = (a1 != 0) ? rf[a1] : 32'h00000000;
    assign rd2 = (a2 != 0) ? rf[a2] : 32'h00000000;

endmodule



//`timescale 1ns / 1ps

//module reg_file(
//    input wire clk,
//    input wire reset,
//    input wire we,
//    input wire [4:0] a1,
//    input wire [4:0] a2,
//    input wire [4:0] a3,
//    input wire [31:0] wd,
//    output wire [31:0] rd1,
//    output wire [31:0] rd2,
//    output wire [31:0] r2, r3, r4, r5, r7
//);

//    reg [31:0] rf[31:0];

//    initial begin
//        $readmemh("D://University//Vivado_Projects//reg_init.dat", rf); // Optional: DSP init
//        $display("Loaded reg[0] = %h", rf[0]);
//    end

//    integer i;
//    always @(posedge clk or posedge reset) begin
//        if (reset) begin         
//            for (i = 0; i < 32; i = i + 1)
//                rf[i] <= 32'b0;
//        end else if (we) begin
//            rf[a3] <= wd;
//        end
//    end

//    assign rd1 = (a1 != 0) ? rf[a1] : 32'b0;
//    assign rd2 = (a2 != 0) ? rf[a2] : 32'b0;

//    assign r2 = rf[2];
//    assign r3 = rf[3];
//    assign r4 = rf[4];
//    assign r5 = rf[5];
//    assign r7 = rf[7];

//endmodule


