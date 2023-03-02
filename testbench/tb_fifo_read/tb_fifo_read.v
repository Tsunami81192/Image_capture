module tb_fifo_read ();
reg rst;
reg clk_50M;
reg clk_100M;
reg [127:0]din;
reg wr_en;
reg rd_en;
wire full;
wire empty;
wire [15:0]dout;
wire wr_rst_busy;
wire rd_rst_busy;
wire [9:0]wr_data_count;
`define CLK_PERIORD_50M		20		
`define CLK_PERIORD_100M	10	

always #(`CLK_PERIORD_50M /2) clk_50M = ~clk_50M;
always #(`CLK_PERIORD_100M / 2) clk_100M = ~clk_100M;
fifo_ddr3_read tb_fifo_ddr3_read (
  .rst(~rst),                      // input wire rst
  .wr_clk(clk_50M),                // input wire wr_clk
  .rd_clk(clk_100M),                // input wire rd_clk
  .din(din),                      // input wire [127 : 0] din
  .wr_en(wr_en),                  // input wire wr_en
  .rd_en(rd_en),                  // input wire rd_en
  .dout(dout),                    // output wire [15 : 0] dout
  .full(full),                    // output wire full
  .empty(empty),                  // output wire empty
  .wr_data_count(wr_data_count),  // output wire [9 : 0] wr_data_count
  .wr_rst_busy(wr_rst_busy),      // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)      // output wire rd_rst_busy
);
initial begin
    clk_100M <= 0;
    clk_50M <= 0;
    rst <= 0;
    #1000;
    rst <= 1;
end

initial begin
    wr_en <= 0;
    rd_en <= 0;
    din <= 'b0;
    @(posedge rst);
    #1000;
    repeat(2)begin
        @(posedge clk_50M)
        repeat(256)begin
            wr_en <= 1;
            din <= {{$random}%65536,{$random}%65536,{$random}%65536,{$random}%65536,{$random}%65536,{$random}%65536,{$random}%65536,{$random}%65536};
            @(posedge clk_50M);
        end
        wr_en <= 0;
        #1000;
        @(posedge clk_100M);
        repeat(256*8)begin
            rd_en <= 1;
            @(posedge clk_100M);
        end
        rd_en <= 0;
        #1000;
    end
    $stop;
end
integer rfile,wfile;
initial begin
    rfile =  $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_fifo_read/output/rfile.txt","w");
    wfile =  $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_fifo_read/output/wfile.txt","w");
end
localparam WIDTH = 16;
always @(posedge clk_50M) begin
    if(wr_en)begin
        $fwrite(wfile,"%x\n",din[8*WIDTH-1 : 7*WIDTH]);
        $fwrite(wfile,"%x\n",din[7*WIDTH-1 : 6*WIDTH]);
        $fwrite(wfile,"%x\n",din[6*WIDTH-1 : 5*WIDTH]);
        $fwrite(wfile,"%x\n",din[5*WIDTH-1 : 4*WIDTH]);
        $fwrite(wfile,"%x\n",din[4*WIDTH-1 : 3*WIDTH]);
        $fwrite(wfile,"%x\n",din[3*WIDTH-1 : 2*WIDTH]);
        $fwrite(wfile,"%x\n",din[2*WIDTH-1 : 1*WIDTH]);
        $fwrite(wfile,"%x\n",din[1*WIDTH-1 : 0*WIDTH]);
    end
end
always @(posedge clk_100M) begin
    if(rd_en) $fwrite(rfile,"%x\n",dout);
end
endmodule