module tb_fifo_write ();
reg rst;
reg clk_50M;
reg clk_100M;
reg [15:0]din;
reg wr_en;
reg rd_en;
wire full;
wire empty;
wire [127:0]dout;
wire wr_rst_busy;
wire rd_rst_busy;
wire [8:0]rd_data_count;
`define CLK_PERIORD_50M		20		
`define CLK_PERIORD_100M	10	

always #(`CLK_PERIORD_50M /2) clk_50M = ~clk_50M;
always #(`CLK_PERIORD_100M / 2) clk_100M = ~clk_100M;

fifo_ddr3_write tb_fifo_ddr3_write (
  .rst(~rst),                      // input wire rst
  .wr_clk(clk_50M),                // input wire wr_clk
  .rd_clk(clk_100M),                // input wire rd_clk
  .din(din),                      // input wire [15 : 0] din
  .wr_en(wr_en),                  // input wire wr_en
  .rd_en(rd_en),                  // input wire rd_en
  .dout(dout),                    // output wire [127 : 0] dout
  .full(full),                    // output wire full
  .empty(empty),                  // output wire empty
  .rd_data_count(rd_data_count),  // output wire [8 : 0] rd_data_count
  .wr_rst_busy(wr_rst_busy),      // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)      // output wire rd_rst_busy
);
initial begin
    rst <= 0;
    clk_50M <= 0;
    clk_100M <= 0;
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
        repeat(256*8)begin
            wr_en <= 1;
            din <= {$random}%65536;
            @(posedge clk_50M);
        end
        wr_en <= 0;
        #1000;
        @(posedge clk_100M);
        repeat(256)begin
            rd_en <= 1;
            @(posedge clk_100M);
        end
        rd_en <= 0;
        #5000;
    end
    $stop;
end
integer wfile,rfile;
initial begin
    wfile = $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_fifo_write/output/wfile.txt","w");
    rfile = $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_fifo_write/output/rfile.txt","w");
end
always @(posedge clk_50M) begin
    if(wr_en) $fwrite(wfile,"%x\n",din);
end
localparam WIDTH = 16;
always @(posedge clk_100M) begin
    if(rd_en) begin
        $fwrite(rfile,"%x\n",dout[8*WIDTH-1 : 7*WIDTH]);
        $fwrite(rfile,"%x\n",dout[7*WIDTH-1 : 6*WIDTH]);
        $fwrite(rfile,"%x\n",dout[6*WIDTH-1 : 5*WIDTH]);
        $fwrite(rfile,"%x\n",dout[5*WIDTH-1 : 4*WIDTH]);
        $fwrite(rfile,"%x\n",dout[4*WIDTH-1 : 3*WIDTH]);
        $fwrite(rfile,"%x\n",dout[3*WIDTH-1 : 2*WIDTH]);
        $fwrite(rfile,"%x\n",dout[2*WIDTH-1 : 1*WIDTH]);
        $fwrite(rfile,"%x\n",dout[1*WIDTH-1 : 0*WIDTH]);
    end
end
endmodule