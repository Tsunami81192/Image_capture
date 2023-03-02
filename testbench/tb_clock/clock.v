/*
*
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// clk_out1__25.00000______0.000______50.0______288.026____155.997
// clk_out2__50.00000______0.000______50.0______249.313____155.997
// clk_out3__75.00000______0.000______50.0______228.642____155.997
// clk_out4__75.00000____180.000______50.0______228.642____155.997
// clk_out5__200.00000______0.000______50.0______185.991____155.997
*/
module tb_clock_sim();
reg reset;
reg clk_in1;
wire locked;
wire clk_out1;
wire clk_out2;
wire clk_out3;
wire clk_out4;
wire clk_out5;

`define CLK_PERIORD		20		//set the clock periord as 20nsï¼?50MHzï¼?

  clk_wiz_0 tb_clk_wiz_0 
   (
    // Clock out ports
    .clk_out1(clk_out1),     // output clk_out1
    .clk_out2(clk_out2),     // output clk_out2
    .clk_out3(clk_out3),     // output clk_out3
    .clk_out4(clk_out4),     // output clk_out4
    .clk_out5(clk_out5),     // output clk_out5
    // Status and control signals
    .reset(~reset), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(clk_in1));      // input clk_in1

initial begin
    reset <= 0;
    clk_in1 <= 0;
    #1000;
    reset <= 1;
end
always #(`CLK_PERIORD/2) clk_in1  = ~clk_in1;

initial begin
    @(posedge reset);  //wait the reset signal finished

    @(posedge clk_in1);
    repeat(300)begin
        @(posedge clk_in1);
    end
    $stop;
end

endmodule