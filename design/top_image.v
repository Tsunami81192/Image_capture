//=============================================================================//
//
//
//
//=============================================================================//


module top_image(
    input i_clk,
    input i_rst_n,

    //VGA
    output o_vga_clk,	
	output[4:0] o_vga_r,
	output[5:0] o_vga_g,
	output[4:0] o_vga_b,
	output[2:0] o_vga_rgb,
	output o_vga_vsy,
	output o_vga_hsy,
	output o_adv7123_blank_n,
	output o_adv7123_sync_n,
    //DDR3
    inout [15:0]       	ddr3_dq,
	inout [1:0]        	ddr3_dqs_n,
	inout [1:0]        	ddr3_dqs_p,
	output [13:0]     	ddr3_addr,
	output [2:0]        ddr3_ba,
	output            	ddr3_ras_n,
	output            	ddr3_cas_n,
	output            	ddr3_we_n,
	output            	ddr3_reset_n,
	output [0:0]       	ddr3_ck_p,
	output [0:0]       	ddr3_ck_n,
	output [0:0]       	ddr3_cke,
	output [1:0]     	ddr3_dm,
	output [0:0]       	ddr3_odt,
   // output              init_calib_complete,
    //MT9VO34
    output o_image_sensor_sclk,
	inout io_image_sensor_sdat,
	output o_image_sensor_xclk,
	output o_image_sensor_exposure,
	output o_image_sensor_pwdn,
	input i_image_sensor_pclk,
	input i_image_sensor_vsync,
	input i_image_sensor_href,
	input[7:0] i_image_sensor_data
);
wire clk_25M;
wire clk_50M;
wire clk_75M;
wire clk_75M_out;
wire clk_200M;
wire locked;
wire w_capture_image_clr;
wire w_capture_image_vld;
wire [7:0]w_capture_image_data;
wire w_dispaly_image_rden;
wire w_display_image_clr;
wire [15:0]w_display_image_data;
wire w_init_calib_complete;

assign o_image_sensor_sclk = 1'b1;
assign io_image_sensor_sdat = 1'b1;
assign o_image_sensor_exposure = 1'b1;
assign o_image_sensor_pwdn = ~i_rst_n;
assign o_image_sensor_xclk = clk_25M;

assign o_vga_clk = clk_75M_out;

clk_wiz_0           uut_clk_wiz_0(
    .clk_out1(clk_25M),     // output clk_out1
    .clk_out2(clk_50M),     // output clk_out2
    .clk_out3(clk_75M),     // output clk_out3
    .clk_out4(clk_75M_out),     // output clk_out4
    .clk_out5(clk_200M),     // output clk_out5
    // Status and control signals
    .reset(~i_rst_n), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(i_clk)
);

M_image_capture     uut_M_image_capture(
    .i_clk                  (clk_50M),
    .i_rst_n                (w_init_calib_complete),
    //these ports from MT9V034
    .i_image_sensor_pclk    (i_image_sensor_pclk),
    .i_image_sensor_vsync   (i_image_sensor_vsync),
    .i_image_sensor_href    (i_image_sensor_href),
    .i_image_sensor_data    (i_image_sensor_data),
    //these ports transfrom DDR3
    .o_capture_image_vld    (w_capture_image_vld),
    .o_capture_image_clr    (w_capture_image_clr),
    .o_capture_image_data   (w_capture_image_data)
);

M_ddr3_cache        uut_M_ddr3_cache(
    .i_clk_200M       (clk_200M),
    .i_clk_ddr3rd     (clk_75M),//75MHz
    .i_clk_ddr3wr     (clk_50M),//50MHz
    .i_rst_n          (sys_rst),

    // Memory interface ports
     .ddr3_dq              (ddr3_dq),
     .ddr3_dqs_n           (ddr3_dqs_n),
     .ddr3_dqs_p           (ddr3_dqs_p),
     .ddr3_addr            (ddr3_addr),
     .ddr3_ba              (ddr3_ba),
     .ddr3_ras_n           (ddr3_ras_n),
     .ddr3_cas_n           (ddr3_cas_n),
     .ddr3_we_n            (ddr3_we_n),
     .ddr3_reset_n         (ddr3_reset),
     .ddr3_ck_p            (ddr3_ck_p),
     .ddr3_ck_n            (ddr3_ck_n),
     .ddr3_cke             (ddr3_cke),
     .ddr3_dm              (ddr3_dm),
     .ddr3_odt             (ddr3_odt),
     .o_init_calib_complete  (w_init_calib_complete),
    //some datas from fifo that image capture
    .i_wrfifo_data    ({8'b0,w_capture_image_data}),
    .i_wrfifo_clr     (w_capture_image_clr),
    .i_wrfifo_vld     (w_capture_image_vld),
    //some datas transfrom ddr3 to VGA
    .o_rdfifo_data      (w_display_image_data),
    .i_rdfifo_vld       (w_display_image_rden),
    .i_rdfifo_clr       (w_display_image_clr)
);

M_VGA_driver        uut_M_VGA_driver (
    .i_clk          (clk_75M),
    .i_rst_n        (w_init_calib_complete),
    .o_display_image_rden       (w_display_image_rden),
    .o_display_image_clr        (w_display_image_clr),
    .i_display_image_data       (w_display_image_data[7:0]),
    .o_vga_b        (o_vga_b),
    .o_vga_g        (o_vga_g),
    .o_vga_r        (o_vga_r),
    .o_vga_rgb      (o_vga_rgb),
    .o_vga_hsy      (o_vga_hsy),
    .o_vga_vsy      (o_vga_vsy),
    .o_adv7123_blank_n      (o_adv7123_blank_n),
    .o_adv7123_sync_n       (o_adv7123_sync_n)
);


endmodule