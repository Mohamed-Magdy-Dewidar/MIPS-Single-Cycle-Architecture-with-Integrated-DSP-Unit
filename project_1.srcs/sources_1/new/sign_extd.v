`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2024 14:48:32
// Design Name: 
// Module Name: sign_extd
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


module sign_extd(
    input wire [15:0] a,
    output wire [31:0] out
    );
    assign out = {{16{a[15]}}, a};
endmodule
