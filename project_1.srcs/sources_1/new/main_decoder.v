`timescale 1ns / 1ps


module main_decoder(
    input wire [5:0] opcode,
    output wire memtoreg,
    output wire memwrite,
    output wire branch,
    output wire dsporalu,
    output wire alusrc,
    output wire regdst,
    output wire regwrite,
    output wire jump,
    output wire [1:0] op
    );
    reg [9:0] controls;

    assign {regwrite, regdst, alusrc, branch, dsporalu, memwrite, memtoreg, op, jump} = controls;

    always @*
        case(opcode)
            6'b000000: controls <= 10'b1100000100; // RTYPE
            6'b100011: controls <= 10'b1010001000; // LW
            6'b101011: controls <= 10'b0010010000; // SW
            6'b000100: controls <= 10'b0001000010; // BEQ
            6'b001000: controls <= 10'b1010000000; // ADDI
            6'b000010: controls <= 10'b0000000001; // J
            6'b000001: begin
                controls <= 10'b1100100110; // DSP
                // DSP Instruction Detected
                $display("DSP Instruction Detected (opcode = %b)", opcode);
            end
            default: controls <= 10'bxxxxxxxxxx;
        endcase
endmodule
