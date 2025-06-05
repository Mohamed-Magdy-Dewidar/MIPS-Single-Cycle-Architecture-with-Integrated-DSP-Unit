//`timescale 1ns / 1ps

//module dsp (
//    input wire clk, reset,
//    (* dont_touch = "yes" *) input wire [2:0] dspcontrol,
//    input wire [15:0] sample_in,
//    output reg [15:0] sample_out
//);
//    // coefficients definition
//    // Moving Average Filter, 3rd order
//    // four coefficients; 1/(order+1) = 1/4 = 0.25 
//    // 0.25 x 128(scaling factor) = 32 = 6'b100000
//    wire [5:0] b0 = 6'b100000; 
//    wire [5:0] b1 = 6'b100000; 
//    wire [5:0] b2 = 6'b100000; 
//    wire [5:0] b3 = 6'b100000;
//    wire [15:0] x1, x2, x3; 

//    // Create delays i.e x[n-1], x[n-2], .. x[n-N]
//    // Instantiate D Flip Flops
//    DFF DFF0(clk, reset, sample_in, x1); // x[n-1]
//    DFF DFF1(clk, reset, x1, x2);      // x[x[n-2]]
//    DFF DFF2(clk, reset, x2, x3);      // x[n-3] 

//    // Multiplication
//    wire [15:0] Mul0, Mul1, Mul2, Mul3;  
//    assign Mul0 = sample_in * b0; 
//    assign Mul1 = x1 * b1;  
//    assign Mul2 = x2 * b2;  
//    assign Mul3 = x3 * b3;  

//    // Addition operation
//    wire [15:0] Add_final; 
//    assign Add_final = Mul0 + Mul1 + Mul2 + Mul3;

//    // Final calculation to output 
//    always @(posedge clk or posedge reset)
//    begin
//        if (reset || (dspcontrol == 3'b010))
//            sample_out <= 16'b0; // Reset sample_out
//        else
//            sample_out <= Add_final; 
//    end
//endmodule

//module DFF (
//    input clk, reset,
//    input [15:0] data_in,
//    output reg [15:0] data_delayed
//);
//    always @(posedge clk, posedge reset)
//    begin
//        if (reset)
//            data_delayed <= 0;
//        else
//            data_delayed <= data_in; 
//    end
//endmodule



`timescale 1ns / 1ps

module dsp (
    input wire clk, 
    input wire reset,
    (* dont_touch = "yes" *) input wire [2:0] dspcontrol,
    input wire signed [15:0] sample_in,
    output reg signed [15:0] sample_out
);
    // Moving Average Filter, 3rd order (4 taps)
    // Coefficients: each = 0.25 scaled by 128 => 32
    // Sum of coefficients = 128, so we shift result right by 7 (divide by 128)

    // Coefficients (6-bit unsigned) promoted to 16-bit signed for safety
    localparam signed [15:0] b0 = 16'sd32;
    localparam signed [15:0] b1 = 16'sd32;
    localparam signed [15:0] b2 = 16'sd32;
    localparam signed [15:0] b3 = 16'sd32;

    // Delayed samples (shift register)
    wire signed [15:0] x1, x2, x3;

    DFF DFF0(.clk(clk), .reset(reset), .data_in(sample_in), .data_delayed(x1)); // x[n-1]
    DFF DFF1(.clk(clk), .reset(reset), .data_in(x1), .data_delayed(x2));       // x[n-2]
    DFF DFF2(.clk(clk), .reset(reset), .data_in(x2), .data_delayed(x3));       // x[n-3]

    // Multiply samples by coefficients (signed multiplication)
    wire signed [31:0] Mul0 = sample_in * b0;
    wire signed [31:0] Mul1 = x1 * b1;
    wire signed [31:0] Mul2 = x2 * b2;
    wire signed [31:0] Mul3 = x3 * b3;

    // Sum all multiplication results (32-bit to prevent overflow)
    wire signed [31:0] Add_final = Mul0 + Mul1 + Mul2 + Mul3;

    // Output with normalization: divide by 128 by shifting right 7 bits
    // Arithmetic shift (>>>) preserves sign
    always @(posedge clk or posedge reset) begin
        if (reset || (dspcontrol == 3'b010)) 
            sample_out <= 16'sd0;
        else
            sample_out <= Add_final[22:7];  
            // Explanation:
            // Add_final is 32-bit signed. 
            // Shifting right by 7 bits (divide by 128).
            // We take bits [22:7] to keep 16 bits sign-extended properly.
            // Alternatively, use:
            // sample_out <= Add_final >>> 7;
            // but slice is safer for fixed output width.
    end

endmodule


module DFF (
    input wire clk,
    input wire reset,
    input wire signed [15:0] data_in,
    output reg signed [15:0] data_delayed
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            data_delayed <= 16'sd0;
        else
            data_delayed <= data_in;
    end
endmodule
