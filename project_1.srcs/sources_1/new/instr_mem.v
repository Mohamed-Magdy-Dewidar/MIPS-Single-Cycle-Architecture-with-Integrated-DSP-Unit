`timescale 1ns / 1ps


module instr_mem(
    (* dont_touch = "yes" *) input wire [7:0] a,          // 8-bit address to support 256 instruction slots
    (* dont_touch = "yes" *) output wire [31:0] rd
    );
    (* dont_touch = "yes" *) reg [31:0] imem[255:0];      // 256 slots for 1 KB memory (256 * 4 bytes)
    initial begin
        $readmemh("D:\\University\\Vivado_Projects\\memfile.dat", imem);
        $display("Loaded mem[0] = %h", imem[0]);
    end
    assign rd = imem[a];
     

endmodule



