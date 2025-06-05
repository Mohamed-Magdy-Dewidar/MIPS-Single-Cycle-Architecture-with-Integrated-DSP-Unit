`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2024 17:05:44
// Design Name: 
// Module Name: mux_32
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


module mux_32(
    input wire [31:0] a,
    input wire [31:0] b,
    input wire select,
    output wire [31:0] out
    );
    assign out = select? b : a;
endmodule
