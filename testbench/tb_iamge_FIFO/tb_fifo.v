
`define CLK_PERIORD_50M		20		//clock periord set as 20nsï¼?50MHzï¼?	
`define CLK_PERIORD_25M		40		//clock periord set as 40nsï¼?25MHz
module tb_fifo ();


reg rst;
reg wr_clk;
reg rd_clk;
reg [7:0]din;
wire valid;
wire [7:0]dout;
reg wr_en;
reg rd_en;
wire prog_full;

fifo_generator_0 tb_fifo_generator_0 (
  .rst(~rst),              // input wire rst
  .wr_clk(wr_clk),        // input wire wr_clk
  .rd_clk(rd_clk),        // input wire rd_clk
  .din(din),              // input wire [7 : 0] din
  .wr_en(wr_en),          // input wire wr_en
  .rd_en(rd_en),          // input wire rd_en
  .dout(dout),            // output wire [7 : 0] dout
  .full(),            // output wire full
  .empty(),          // output wire empty
  .valid(valid),          // output wire valid
  .prog_full(prog_full)  // output wire prog_full
);

always # (`CLK_PERIORD_25M/2) wr_clk = ~wr_clk;
always # (`CLK_PERIORD_50M/2) rd_clk = ~rd_clk;

initial begin
    wr_clk <= 0;
    rd_clk <= 0;
    rst <= 0;

    #1000;
    rst <= 1;
end

initial begin //produce the test initial signal
    wr_en <= 0;
    rd_en <= 0;
    din <= 'b0;
    @(posedge rst);
    #500;
    @(posedge wr_clk);
    repeat(640)begin // first data
        wr_en <= 1;
        din <= {$random}%256;
        @(posedge wr_clk);
    end
    wr_en <= 0;

    #1000;
    repeat (640)begin
        rd_en <= 1;
        @(posedge rd_clk);
    end
    rd_en <= 0;

    #1000;
    repeat(640)begin // second data
        wr_en <= 1;
        din <= {$random}%256;
        @(posedge wr_clk);
    end
    wr_en <= 0;

    #1000;
    repeat (640)begin
        rd_en <= 1;
        @(posedge rd_clk);
    end

    rd_en <= 0;

    #1000;
    $stop;

end
//FIFO write data and read data are stored in separate text files for comparison results
integer rfile,wfile;
initial begin
    rfile = $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_iamge_FIFO/output/rfile.txt","w");
    wfile = $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_iamge_FIFO/output/wfile.txt","w");
end
always @(posedge wr_clk) begin
    if(wr_en) $fwrite(wfile,"%x\n",din);
end
always @(posedge rd_clk) begin
    if(valid) $fwrite(rfile,"%x\n",dout);
end
endmodule