`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2024 14:53:48
// Design Name: 
// Module Name: flopr
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


module pc(
    input wire clk, reset,
    input wire [31:0] pc_in,
    output reg [31:0] pc_out
    );
    always @(posedge clk, posedge reset)
        if(reset) begin
            pc_out <= 0;
        end
        else begin
            pc_out <= pc_in;
        end
endmodule
