`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2024 17:11:41
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(
    input wire [31:0] srca,
    input wire [31:0] srcb,
    input wire [2:0] alucontrol,
    output reg [31:0] aluresult,
    output reg zero
    );
    always @* begin
        case (alucontrol)
            3'b010: aluresult <= srca + srcb;
            3'b110: aluresult <= srca - srcb;
            3'b000: aluresult <= srca & srcb;
            3'b001: aluresult <= srca | srcb;
            3'b111: aluresult <= (srca < srcb)? 1 : 0;
         endcase
         zero = (aluresult == 0)? 1: 0;
    end
endmodule
