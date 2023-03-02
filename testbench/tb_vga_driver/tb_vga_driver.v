module tb_vga_driver();
reg clk_75M;
reg i_rst_n;
wire o_display_image_clr;
wire o_display_image_rden;
wire [7:0]i_display_image_data;
    //vga driver
wire [4:0]o_vga_r;
wire      [5:0]o_vga_g;
wire      [4:0]o_vga_b;
wire      o_vga_hsy;
wire      o_vga_vsy;
wire      [2:0]o_vga_rgb;
wire 	 o_adv7123_blank_n;
wire 	 o_adv7123_sync_n;
	
`define CLK_PERIORD_75M		13.333	
always #(`CLK_PERIORD_75M/2) clk_75M = ~clk_75M;	
	
parameter RAW_DATA_WIDTH	= 752;
parameter RAW_DATA_HIGHT	= 480;
parameter DIS_DATA_WIDTH	= 640;
parameter DIS_DATA_HIGHT	= 480;
parameter RAW_DATA_NUM		= RAW_DATA_WIDTH*RAW_DATA_HIGHT;

M_VGA_driver tb_M_VGA_driver(
    .i_clk          (clk_75M),
    .i_rst_n        (i_rst_n),
    .o_display_image_rden       (o_display_image_rden),
    .o_display_image_clr        (o_display_image_clr),
    .i_display_image_data       (i_display_image_data),
    .o_vga_b        (o_vga_b),
    .o_vga_g        (o_vga_g),
    .o_vga_r        (o_vga_r),
    .o_vga_rgb      (o_vga_rgb),
    .o_vga_hsy      (o_vga_hsy),
    .o_vga_vsy      (o_vga_vsy),
    .o_adv7123_blank_n      (o_adv7123_blank_n),
    .o_adv7123_sync_n       (o_adv7123_sync_n)
);
initial begin
    clk_75M <= 0;
    i_rst_n <= 0;
    #1000;
    i_rst_n <= 1;
end

reg [7:0]data_mem[RAW_DATA_NUM-1:0];
initial begin
    $readmemh("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_vga_driver/input/image_from_matlab.txt",data_mem);
end

initial begin
    @(posedge i_rst_n);

    @(posedge o_vga_hsy);

    @(posedge o_vga_vsy);

    $stop;
end

integer x,y;
always @(posedge clk_75M) begin
    if(o_display_image_clr)begin
        x <= 0;
        y<= 0;
    end
    else if(o_display_image_rden)begin
        if(x >= DIS_DATA_WIDTH-1)begin
            x <= 0;
            y <= y+1;
        end else x <=x +1;
    end
end
assign i_display_image_data = data_mem[y*RAW_DATA_WIDTH + x];

integer rfile;
initial begin
    rfile = $fopen("D:/34998/FPGA_Study/FPGA/Image_Capture_1A/testbench/tb_vga_driver/output/rfile.txt","w");
end
always @(posedge clk_75M) begin
    if(o_adv7123_blank_n) $fwrite(rfile,"%x\n%x\n%x\n",
                                 {o_vga_r,o_vga_rgb},{o_vga_g,o_vga_rgb[1:0]},{o_vga_b,o_vga_rgb});
end
endmodule