`timescale 1ns / 1ps


module secondary_decoder(
    input wire [5:0] funct,
    input wire [4:0] dsp,
    input wire [1:0] op,
    output reg [2:0] alucontrol,
    output reg [2:0] dspcontrol
    );
    always @*
        case(op)
            2'b00: alucontrol <= 3'b010;
            2'b01: alucontrol <= 3'b110;
            2'b10: case(funct)
                    6'b100000: alucontrol <= 3'b010; // add
                    6'b100010: alucontrol <= 3'b110; // sub
                    6'b100100: alucontrol <= 3'b000; // and
                    6'b100101: alucontrol <= 3'b001; // or
                    6'b101010: alucontrol <= 3'b111; // slt
                    default: alucontrol <= 3'b000; // ???
                endcase
            2'b11: case(dsp)
                5'b00000: dspcontrol <=3'b000; // Indicating first sample of stream.
                5'b00001: dspcontrol <=3'b001; // Indicating middle Samples.
                5'b00010: dspcontrol <=3'b010; // Indicating last sample of stream.
                default: dspcontrol <= 3'b000; // ???
            endcase
        endcase
endmodule
