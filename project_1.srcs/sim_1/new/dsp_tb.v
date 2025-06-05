//`timescale 1ns / 1ps

//module dsp_tb;

//  reg clk, reset;
//  reg [15:0] sample_in;
//  wire [15:0] sample_out;
//  wire [2:0] dspcontrol;
//  // Instantiate the FIR_Filter
//  dsp uut (
//    .clk(clk),
//    .reset(reset),
//    .dspcontrol(dspcontrol),
//    .sample_in(sample_in),
//    .sample_out(sample_out)
//  );

//  // Clock generation
//  initial
//  begin
//    clk = 0;
//    forever #5 clk = ~clk; // 100MHz clock
//  end

//  // Testbench stimulus
//  initial
//  begin
//    // Initialize inputs
//    reset = 1;
//    sample_in = 16'b0;

//    // Apply reset
//    #10;
////    #40;

//    reset = 0;

//    // Apply input samples
////    #10 sample_in = 16'b0000000000000010; 
////    #10 sample_in = 16'b0000000000011010; 
////    #10 sample_in = 16'b0000000000111011; 
////    #10 sample_in = 16'b0000000001000111; 
////    #10 sample_in = 16'b0000000001011110; 
////    #10 sample_in = 16'b0000000001110100; 
////    #10 sample_in = 16'b0000000001111101; 
////    #10 sample_in = 16'b0000000010000000; 
////    #10 sample_in = 16'b0000000001111101; 
////    #10 sample_in = 16'b0000000001111001; 
////    #10 sample_in = 16'b0000000001111011; 
////    #10 sample_in = 16'b0000000001100101; 
////    #10 sample_in = 16'b0000000001010100; 
////    #10 sample_in = 16'b0000000001000110; 
////    #10 sample_in = 16'b0000000000101100; 
////    #10 sample_in = 16'b0000000000011100; 
////    #10 sample_in = 16'b0000000000000000; 
////    #10 sample_in = 16'b1111111111100001; 
////    #10 sample_in = 16'b1111111111001100; 
////    #10 sample_in = 16'b1111111110110101; 
////    #10 sample_in = 16'b1111111110100110; 
////    #10 sample_in = 16'b1111111110100000; 
////    #10 sample_in = 16'b1111111110001100; 
////    #10 sample_in = 16'b1111111110000101; 
////    #10 sample_in = 16'b1111111110001000; 
////    #10 sample_in = 16'b1111111110001100; 
////    #10 sample_in = 16'b1111111110010101; 
////    #10 sample_in = 16'b1111111110101000; 
////    #10 sample_in = 16'b1111111110110110; 
////    #10 sample_in = 16'b1111111111010001; 
////    #10 sample_in = 16'b1111111111100001; 
////    #10 sample_in = 16'b0000000000000010; 
//    // Apply input samples (sine wave + noise)
//    #10 sample_in = 16'sd0;
//    #10 sample_in = 16'sd2950;
//    #10 sample_in = 16'sd5776;
//    #10 sample_in = 16'sd8601;
//    #10 sample_in = 16'sd11499;
//    #10 sample_in = 16'sd14255;
//    #10 sample_in = 16'sd16845;
//    #10 sample_in = 16'sd19342;
//    #10 sample_in = 16'sd21569;
//    #10 sample_in = 16'sd23690;
//    #10 sample_in = 16'sd25504;
//    #10 sample_in = 16'sd26988;
//    #10 sample_in = 16'sd28264;
//    #10 sample_in = 16'sd29234;
//    #10 sample_in = 16'sd29917;
//    #10 sample_in = 16'sd30313;
//    #10 sample_in = 16'sd30394;
//    #10 sample_in = 16'sd30179;
//    #10 sample_in = 16'sd29620;
//    #10 sample_in = 16'sd28803;
//    #10 sample_in = 16'sd27641;
//    #10 sample_in = 16'sd26202;
//    #10 sample_in = 16'sd24510;
//    #10 sample_in = 16'sd22634;
//    #10 sample_in = 16'sd20543;
//    #10 sample_in = 16'sd18256;
//    #10 sample_in = 16'sd15823;
//    #10 sample_in = 16'sd13248;
//    #10 sample_in = 16'sd10592;
//    #10 sample_in = 16'sd7844;
//    #10 sample_in = 16'sd5022;
//    #10 sample_in = 16'sd2226;
//    #10 sample_in = 16'sd595;
//    #10 sample_in = 16'sd3437;
//    #10 sample_in = 16'sd6182;
//    #10 sample_in = 16'sd8876;
//    #10 sample_in = 16'sd11440;
//    #10 sample_in = 16'sd13838;
//    #10 sample_in = 16'sd16066;
//    #10 sample_in = 16'sd18144;
//    #10 sample_in = 16'sd19955;
//    #10 sample_in = 16'sd21554;
//    #10 sample_in = 16'sd22929;
//    #10 sample_in = 16'sd24041;
//    #10 sample_in = 16'sd24937;
//    #10 sample_in = 16'sd25571;
//    #10 sample_in = 16'sd25930;
//    #10 sample_in = 16'sd25994;
//    #10 sample_in = 16'sd5800;
//    #10 sample_in = 16'sd25326;
//    #10 sample_in = 16'sd24526;
//    #10 sample_in = 16'sd23493;
//    #10 sample_in = 16'sd22149;
//    #10 sample_in = 16'sd20570;
//    #10 sample_in = 16'sd18781;
//    #10 sample_in = 16'sd16812;
//    #10 sample_in = 16'sd14621;
//    #10 sample_in = 16'sd12307;
//    #10 sample_in = 16'sd9879;
//    #10 sample_in = 16'sd7304;
//    #10 sample_in = 16'sd4674;
//    #10 sample_in = 16'sd2033;


//    // Finish simulation
//    #100;
//    $stop;
//  end

//endmodule




`timescale 1ns / 1ps

module dsp_tb;

  reg clk, reset;
  reg [15:0] sample_in;
  wire [15:0] sample_out;
  wire [2:0] dspcontrol;
  // Instantiate the FIR_Filter
  dsp uut (
    .clk(clk),
    .reset(reset),
    .dspcontrol(dspcontrol),
    .sample_in(sample_in),
    .sample_out(sample_out)
  );

  // Clock generation
  initial
  begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

   integer i;
reg signed [15:0] base_samples [0:63];  // Original sine base values
reg signed [15:0] noisy_sample;

initial begin
    // Initialize base sine wave + trend
    base_samples[ 0] = 0;       base_samples[ 1] = 2950;
    base_samples[ 2] = 5776;    base_samples[ 3] = 8601;
    base_samples[ 4] = 11499;   base_samples[ 5] = 14255;
    base_samples[ 6] = 16845;   base_samples[ 7] = 19342;
    base_samples[ 8] = 21569;   base_samples[ 9] = 23690;
    base_samples[10] = 25504;   base_samples[11] = 26988;
    base_samples[12] = 28264;   base_samples[13] = 29234;
    base_samples[14] = 29917;   base_samples[15] = 30313;
    base_samples[16] = 30394;   base_samples[17] = 30179;
    base_samples[18] = 29620;   base_samples[19] = 28803;
    base_samples[20] = 27641;   base_samples[21] = 26202;
    base_samples[22] = 24510;   base_samples[23] = 22634;
    base_samples[24] = 20543;   base_samples[25] = 18256;
    base_samples[26] = 15823;   base_samples[27] = 13248;
    base_samples[28] = 10592;   base_samples[29] = 7844;
    base_samples[30] = 5022;    base_samples[31] = 2226;
    base_samples[32] = 595;     base_samples[33] = 3437;
    base_samples[34] = 6182;    base_samples[35] = 8876;
    base_samples[36] = 11440;   base_samples[37] = 13838;
    base_samples[38] = 16066;   base_samples[39] = 18144;
    base_samples[40] = 19955;   base_samples[41] = 21554;
    base_samples[42] = 22929;   base_samples[43] = 24041;
    base_samples[44] = 24937;   base_samples[45] = 25571;
    base_samples[46] = 25930;   base_samples[47] = 25994;
    base_samples[48] = 5800;    base_samples[49] = 25326;
    base_samples[50] = 24526;   base_samples[51] = 23493;
    base_samples[52] = 22149;   base_samples[53] = 20570;
    base_samples[54] = 18781;   base_samples[55] = 16812;
    base_samples[56] = 14621;   base_samples[57] = 12307;
    base_samples[58] = 9879;    base_samples[59] = 7304;
    base_samples[60] = 4674;    base_samples[61] = 2033;
    base_samples[62] = 0;       base_samples[63] = -1000;  // Optional end values

    // Apply reset
    reset = 1;
    sample_in = 0;
    #10 reset = 0;

    for (i = 0; i < 64; i = i + 1) begin
        noisy_sample = base_samples[i] + $random % 1000; // Add noise: ±1000
        sample_in = noisy_sample;
        #10;
    end

    #100;
    $stop;
    
    
end

  
endmodule


//`timescale 1ns / 1ps

//module dsp_tb;

//  reg clk, reset;
//  reg signed [15:0] sample_in;
//  wire [15:0] sample_out;
//  wire [2:0] dspcontrol;
//  integer i;
//  integer noise;

//  // Instantiate the dsp module (your DUT)
//  dsp uut (
//    .clk(clk),
//    .reset(reset),
//    .dspcontrol(dspcontrol),
//    .sample_in(sample_in),
//    .sample_out(sample_out)
//  );

//  // Clock generation: 100 MHz clock (period = 10 ns)
//  initial begin
//    clk = 0;
//    forever #5 clk = ~clk;
//  end

//  // Base input samples (your sine wave)
//  reg signed [15:0] base_samples [0:49];

//  initial begin
//    base_samples[0]  = 16'sd0;
//    base_samples[1]  = 16'sd2950;
//    base_samples[2]  = 16'sd5776;
//    base_samples[3]  = 16'sd8601;
//    base_samples[4]  = 16'sd11499;
//    base_samples[5]  = 16'sd14255;
//    base_samples[6]  = 16'sd16845;
//    base_samples[7]  = 16'sd19342;
//    base_samples[8]  = 16'sd21569;
//    base_samples[9]  = 16'sd23690;
//    base_samples[10] = 16'sd25504;
//    base_samples[11] = 16'sd26988;
//    base_samples[12] = 16'sd28264;
//    base_samples[13] = 16'sd29234;
//    base_samples[14] = 16'sd29917;
//    base_samples[15] = 16'sd30313;
//    base_samples[16] = 16'sd30394;
//    base_samples[17] = 16'sd30179;
//    base_samples[18] = 16'sd29620;
//    base_samples[19] = 16'sd28803;
//    base_samples[20] = 16'sd27641;
//    base_samples[21] = 16'sd26202;
//    base_samples[22] = 16'sd24510;
//    base_samples[23] = 16'sd22634;
//    base_samples[24] = 16'sd20543;
//    base_samples[25] = 16'sd18256;
//    base_samples[26] = 16'sd15823;
//    base_samples[27] = 16'sd13248;
//    base_samples[28] = 16'sd10592;
//    base_samples[29] = 16'sd7844;
//    base_samples[30] = 16'sd5022;
//    base_samples[31] = 16'sd2226;
//    base_samples[32] = 16'sd595;
//    base_samples[33] = 16'sd3437;
//    base_samples[34] = 16'sd6182;
//    base_samples[35] = 16'sd8876;
//    base_samples[36] = 16'sd11440;
//    base_samples[37] = 16'sd13838;
//    base_samples[38] = 16'sd16066;
//    base_samples[39] = 16'sd18144;
//    base_samples[40] = 16'sd19955;
//    base_samples[41] = 16'sd21554;
//    base_samples[42] = 16'sd22929;
//    base_samples[43] = 16'sd24041;
//    base_samples[44] = 16'sd24937;
//    base_samples[45] = 16'sd25571;
//    base_samples[46] = 16'sd25930;
//    base_samples[47] = 16'sd25994;
//    base_samples[48] = 16'sd5800;
//    base_samples[49] = 16'sd25326;
//  end

//  // Testbench stimulus with noise added
//  initial begin
//    reset = 1;
//    sample_in = 16'sd0;

//    #10;
//    reset = 0;

//    for (i = 0; i < 50; i = i + 1) begin
//      #10;
//      noise = $random % 205 - 150;  // noise range: -100 to +100
//      sample_in = base_samples[i] + noise;
//    end

//    #100;
//    $stop;
//  end

//endmodule



//`timescale 1ns / 1ps

//module dsp_tb;

//  reg clk, reset;
//  reg [15:0] sample_in;
//  reg [2:0] dspcontrol; // FIXED: changed from wire to reg
//  wire [15:0] sample_out;

//  // Instantiate the DSP FIR Filter
//  dsp uut (
//    .clk(clk),
//    .reset(reset),
//    .dspcontrol(dspcontrol),
//    .sample_in(sample_in),
//    .sample_out(sample_out)
//  );

//  // Clock generation
//  initial begin
//    clk = 0;
//    forever #5 clk = ~clk; // 100 MHz clock (10ns period)
//  end

//  // Test stimulus
//  initial begin
//    reset = 1;
//    dspcontrol = 3'b000; // Mode for FIR filtering or DSP operation
//    sample_in = 16'b0;
//    #10 reset = 0;

//    // Apply 32 input samples (sine + noise)
//    #10 sample_in = 16'b0000000000000010; 
//    #10 sample_in = 16'b0000000000011010; 
//    #10 sample_in = 16'b0000000000111011; 
//    #10 sample_in = 16'b0000000001000111; 
//    #10 sample_in = 16'b0000000001011110; 
//    #10 sample_in = 16'b0000000001110100; 
//    #10 sample_in = 16'b0000000001111101; 
//    #10 sample_in = 16'b0000000010000000; 
//    #10 sample_in = 16'b0000000001111101; 
//    #10 sample_in = 16'b0000000001111001; 
//    #10 sample_in = 16'b0000000001111011; 
//    #10 sample_in = 16'b0000000001100101; 
//    #10 sample_in = 16'b0000000001010100; 
//    #10 sample_in = 16'b0000000001000110; 
//    #10 sample_in = 16'b0000000000101100; 
//    #10 sample_in = 16'b0000000000011100; 
//    #10 sample_in = 16'b0000000000000000; 
//    #10 sample_in = 16'b1111111111100001; 
//    #10 sample_in = 16'b1111111111001100; 
//    #10 sample_in = 16'b1111111110110101; 
//    #10 sample_in = 16'b1111111110100110; 
//    #10 sample_in = 16'b1111111110100000; 
//    #10 sample_in = 16'b1111111110001100; 
//    #10 sample_in = 16'b1111111110000101; 
//    #10 sample_in = 16'b1111111110001000; 
//    #10 sample_in = 16'b1111111110001100; 
//    #10 sample_in = 16'b1111111110010101; 
//    #10 sample_in = 16'b1111111110101000; 
//    #10 sample_in = 16'b1111111110110110; 
//    #10 sample_in = 16'b1111111111010001; 
//    #10 sample_in = 16'b1111111111100001; 
//    #10 sample_in = 16'b0000000000000010; 

//    // Wait to observe output
//    #100;
//    $finish;
//  end

//endmodule


