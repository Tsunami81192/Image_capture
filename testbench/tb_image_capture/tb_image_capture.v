module tb_image_capture ();
reg clk_50M;
reg clk_25M;
reg i_rst_n;
reg i_image_sensor_vsync;
reg i_image_sensor_href;
reg [7:0]i_image_sensor_data;
wire o_capture_image_clr;
wire [7:0]o_capture_image_data;
wire o_capture_image_vld;

parameter RAW_DATA_WIDTH	= 752;
parameter RAW_DATA_HIGHT	= 480;
parameter RAW_DATA_NUM = RAW_DATA_HIGHT * RAW_DATA_WIDTH;

`define CLK_PERIORD_50M		20		
`define CLK_PERIORD_25M		40	

M_image_capture tb_M_image_capture(
    .i_clk                  (clk_50M),
    .i_rst_n                (i_rst_n),
    //these ports from MT9V034
    .i_image_sensor_pclk    (clk_25M),
    .i_image_sensor_vsync   (i_image_sensor_vsync),
    .i_image_sensor_href    (i_image_sensor_href),
    .i_image_sensor_data    (i_image_sensor_data),
    //these ports transfrom DDR3
    .o_capture_image_vld    (o_capture_image_vld),
    .o_capture_image_clr    (o_capture_image_clr),
    .o_capture_image_data   (o_capture_image_data)
);

initial begin
    clk_25M <= 0;
    clk_50M <= 0;
    i_rst_n <= 0;
    #1000;
    i_rst_n <= 1;
end

always #(`CLK_PERIORD_25M/2) clk_25M = ~clk_25M;
always #(`CLK_PERIORD_50M/2) clk_50M = ~clk_50M;

reg [7:0]data_mem[RAW_DATA_NUM-1:0];
initial begin
    $readmemh("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_image_capture/input/image_from_matlab.txt",data_mem);
end
initial begin
    i_image_sensor_vsync <= 'b0;
    i_image_sensor_href <= 'b0;
    i_image_sensor_data <= 'b0;

    @(posedge i_rst_n);
    #10_000;
    image_data_generate();
    #10_000;
    $stop;
end

integer x,y;//Simulate the input of a frame image
task image_data_generate;
begin
    i_image_sensor_vsync <= 0;
    repeat(4000)begin @(posedge clk_25M); end
    i_image_sensor_vsync <= 1;
    repeat(200)begin
        @(posedge clk_25M);
    end
    for(y = 0; y < RAW_DATA_HIGHT; y = y+1)begin
        for(x = 0;x < RAW_DATA_WIDTH; x = x+1)begin
            @(posedge clk_25M);
            i_image_sensor_href <= 1;
            i_image_sensor_data <= data_mem[y*RAW_DATA_WIDTH + x];
        end
        @(posedge clk_25M);
        i_image_sensor_href <= 0;
        repeat(200)begin @(posedge clk_25M);end
    end
    i_image_sensor_vsync <= 0;
end
endtask

integer wfile, rfile;
integer xcnt,ycnt;
initial begin
    wfile = $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_image_capture/output/wfile.txt","w");
    rfile = $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_image_capture/output/rfile.txt","w");
    @(posedge i_rst_n);
    for(ycnt = 0;ycnt < RAW_DATA_HIGHT; ycnt = ycnt + 1)
        for(xcnt = 0;xcnt < RAW_DATA_WIDTH; xcnt = xcnt+1)begin
            if(xcnt < 640) $fwrite(wfile,"%x\n",data_mem[ycnt*RAW_DATA_WIDTH + xcnt]);
        end

end

always @(posedge clk_50M) begin
    if(o_capture_image_vld) $fwrite(rfile,"%x\n",o_capture_image_data);
end
endmodule