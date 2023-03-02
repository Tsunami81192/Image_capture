//=============================================================================//
//
//
//
//=============================================================================//

//VGA driver 
module M_VGA_driver (
    input i_clk,
    input i_rst_n,
    //VGA  --> FIFO
    output reg o_display_image_clr,
    output reg o_display_image_rden,
    input [15:0]i_display_image_data,
    //vga driver
    output [4:0]o_vga_r,
    output [5:0]o_vga_g,
    output [4:0]o_vga_b,
    output reg o_vga_hsy,
    output reg o_vga_vsy,
    output [2:0]o_vga_rgb,
	output o_adv7123_blank_n,
	output o_adv7123_sync_n 
);
localparam P_VGA_HTT = 12'd1648-1;	//Hor total time
localparam P_VGA_HST = 12'd80;		//Hor sync time
localparam P_VGA_HBP = 12'd216;		//Hor Back porch
localparam P_VGA_HVT = 12'd1280;	//Hor valid time
localparam P_VGA_HFP = 12'd72;		//Hor front porch

localparam P_VGA_VTT = 12'd750-1;	//Ver total time
localparam P_VGA_VST = 12'd5;		//Ver sync time
localparam P_VGA_VBP = 12'd22;		//Ver Back porch
localparam P_VGA_VVT = 12'd720;	//Ver valid time
localparam P_VGA_VFP = 12'd3;		//Ver front porch

//-----------------------produce the count of x and y-----------------------------//
reg [11:0]x_cnt,y_cnt;
always @(posedge i_clk) begin
    if(!i_rst_n) x_cnt <= 'b0;
    else if(x_cnt < P_VGA_HTT) x_cnt <= x_cnt + 1;
    else x_cnt <= 'b0;
end

always @(posedge i_clk) begin
    if(!i_rst_n) y_cnt <= 'b0;
    else if(x_cnt == P_VGA_HTT)begin
        if(y_cnt < P_VGA_VTT) y_cnt <= y_cnt + 1;
        else y_cnt <= 0;
    end
    else;
end

//-----------------------produce the clr and vld signal-------------------------//
always @(i_clk) begin
    if(!i_rst_n) o_display_image_clr <= 1;
    else if(y_cnt == 'b0)o_display_image_clr <= 1;
    else o_display_image_clr <= 0;
end
always @(posedge i_clk) begin
    if(!i_rst_n) o_display_image_rden <= 0;
    else if(((x_cnt >= (P_VGA_HST + P_VGA_HBP + 320))) && (x_cnt < (P_VGA_HST + P_VGA_HBP + P_VGA_HVT-320))
          && (y_cnt >= P_VGA_VST + P_VGA_VBP + 120)    && (y_cnt <  P_VGA_VST + P_VGA_VBP + P_VGA_VVT - 120))o_display_image_rden <= 1;
    else o_display_image_rden <= 0;
end

//-----------------------hsy and vsy signal-------------------------------------//
always @(posedge i_clk) begin
    if(!i_rst_n) o_vga_hsy <= 0;
    else if(x_cnt < P_VGA_HST )o_vga_hsy <= 1;
    else o_vga_hsy <= 0;
end
always @(posedge i_clk) begin
    if(!i_rst_n) o_vga_vsy <= 0;
    else if(y_cnt < P_VGA_VST )o_vga_vsy <= 1;
    else o_vga_vsy <= 0;
end

//----------------------produce the data transfer VGA----------------------------//
reg [15:0]r_dispaly_image_data;
always @(posedge i_clk) begin
    if(!i_rst_n) r_dispaly_image_data <= 'b0;
    else if(o_display_image_rden) r_dispaly_image_data <= i_display_image_data;
    else r_dispaly_image_data <= 'b0;
end
assign o_vga_r = r_dispaly_image_data[7:3];
assign o_vga_g = r_dispaly_image_data[7:2];
assign o_vga_b = r_dispaly_image_data[7:3];
assign o_vga_rgb = r_dispaly_image_data[2:0];

//------------------------o_adv7123_blank and o_adv7123 sync----------------------//
reg r_vga_valid;
always @(posedge i_clk) begin
    if(!i_rst_n)r_vga_valid <= 0;
    else if((x_cnt >= P_VGA_HST + P_VGA_HBP) && (x_cnt < P_VGA_HST +P_VGA_HBP +P_VGA_HVT) && 
            (y_cnt >= P_VGA_VBP + P_VGA_VST) && (y_cnt < P_VGA_VBP + P_VGA_VST +P_VGA_VVT))r_vga_valid <= 1;
    else r_vga_valid <= 0;
end
assign o_adv7123_blank_n = r_vga_valid;
assign o_adv7123_sync_n = 0;
endmodule
