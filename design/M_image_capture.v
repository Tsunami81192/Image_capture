//=============================================================================//
//
//This module mainly realizes from MT9V034 image acquisition and cache
//
//=============================================================================//

module M_image_capture (
    input i_clk,
    input i_rst_n,
    //these ports from MT9V034
    input i_image_sensor_pclk,
    input i_image_sensor_vsync,
    input i_image_sensor_href,
    input [7:0]i_image_sensor_data,
    //these ports transfrom DDR3
    output o_capture_image_vld,
    output reg o_capture_image_clr,
    output [7:0]o_capture_image_data
);
    
    localparam P_IMAGE_WIDTH = 640;
    localparam P_IMAGE_HIGHT = 480;

//cut the image from 752*480 -> 640 * 480
reg fifo_wren;      //the signal of fifo write
reg [9:0]r_hcnt;
reg [7:0]r_image_sensor_data;
always @(posedge i_image_sensor_pclk) begin
    if(!i_image_sensor_href) r_hcnt <= 'b0;
    else r_hcnt <= r_hcnt + 1;
end
always @(posedge i_image_sensor_pclk) begin
    if(!i_rst_n) fifo_wren <= 'b0;
    else if(i_image_sensor_href && (r_hcnt < P_IMAGE_WIDTH))  begin
            fifo_wren <= 'b1;
        end //else fifo_wren <= 'b0;
    else fifo_wren <= 'b0;
end
always @(posedge i_image_sensor_pclk) begin
    r_image_sensor_data <= i_image_sensor_data;
end

//produce the signal of fifo reset
reg [4:0]rst_cnt;
wire w_pos_image_sensor_vsync;
M_plus_detect		uut_m_pulse_detect_isv(
	.i_clk		(i_clk),
	.i_rst_n	(i_rst_n),
	.i_pluse	(i_image_sensor_vsync),	
	.o_pos_edge	(w_pos_image_sensor_vsync),
	.o_neg_edge	()
);
always @(posedge i_clk) begin
    if(!i_rst_n) rst_cnt <= 'b1;
    else if(w_pos_image_sensor_vsync) rst_cnt <= 1;
    else if(rst_cnt != 'b0)rst_cnt <= rst_cnt + 1;
    else rst_cnt <= 'b0;
end
always @(posedge i_clk) begin
    if(!i_rst_n ) o_capture_image_clr <= 'b1;
    else if((rst_cnt > 'b0)) o_capture_image_clr <= 'b1;
    else o_capture_image_clr <= 'b0;
end

//produce the read signal of fifo,read 640 clock period
/*
*Since only 640 data needs to be read from the fifo, it is only necessary to hold the enable signal for 640 clock cycles
*/
reg fifo_rden;
wire prog_full;
reg [9:0]r_fcnt;
reg fifo_reading;
always @(posedge i_clk) begin
    if(!i_rst_n) fifo_reading <= 'b0;
    else if(prog_full) fifo_reading <= 'b1;
    else if(r_fcnt >= P_IMAGE_WIDTH) fifo_reading <= 'b0;
    else;
end
always @(posedge i_clk) begin
    if(!i_rst_n) r_fcnt <= 'b0;
    else if(fifo_reading) r_fcnt <= r_fcnt + 1;
    else r_fcnt <= 'b0;
end
always @(posedge i_clk)begin
    if(!i_rst_n)fifo_rden <= 'b0;
    else if(fifo_reading && (r_fcnt < P_IMAGE_WIDTH)) fifo_rden <= 'b1;
    else fifo_rden <= 'b0;
end

fifo_generator_0 uut_fifo_generator_0 (
  .rst          (o_capture_image_clr),                   // input wire rst
  .wr_clk       (i_image_sensor_pclk),        // input wire wr_clk
  .rd_clk       (i_clk),                      // input wire rd_clk
  .din          (r_image_sensor_data),        // input wire [7 : 0] din
  .wr_en        (fifo_wren),                           // input wire wr_en
  .rd_en        (fifo_rden),                      // input wire rd_en
  .dout         (o_capture_image_data),                           // output wire [7 : 0] dout
  /*
  .full         (),                           // output wire full
  .empty        (),                           // output wire empty
  */
  .valid        (o_capture_image_vld),                      // output wire valid
  .prog_full    (prog_full)                   // output wire prog_full
);
endmodule