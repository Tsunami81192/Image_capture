//=============================================================================//
//
//
//
//=============================================================================//

module M_ddr3_cache (
    input i_clk_200M,
    input i_clk_ddr3rd,//75MHz
    input i_clk_ddr3wr,//50MHz
    input i_rst_n,

    // Memory interface ports
    output [13:0]       ddr3_addr,
    output [2:0]		ddr3_ba,
    output			    ddr3_cas_n,
    output [0:0]		ddr3_ck_n,
    output [0:0]		ddr3_ck_p,
    output [0:0]		ddr3_cke,
    output			    ddr3_ras_n,
    output			    ddr3_reset_n,
    output			    ddr3_we_n,
    inout [15:0]		ddr3_dq,
    inout [1:0]		    ddr3_dqs_n,
    inout [1:0]		    ddr3_dqs_p,
    output [1:0]		ddr3_dm,
    output [0:0]		ddr3_odt,
    output			    o_init_calib_complete,
    //some datas from fifo that image capture
    input [15:0]        i_wrfifo_data,
    input               i_wrfifo_clr,
    input               i_wrfifo_vld,
    //some datas transfrom ddr3 to VGA
    output [15:0]       o_rdfifo_data,
    input              i_rdfifo_vld,
    input              i_rdfifo_clr         
);


reg [27:0]		app_addr;//DDR3 address signal
reg [2:0]		  app_cmd; //DDR3 command signal
reg 			    app_en;  //DDR3 enable signal;
wire 		      app_rdy;

wire [127:0]		app_wdf_data;  //DDR3 write data
wire			    app_wdf_end;   //
reg 			    app_wdf_wren;
wire 		      app_wdf_rdy;
wire  [15:0]	app_wdf_mask = 16'h0;

wire [127:0]	app_rd_data;
wire 			    app_rd_data_end;
wire 	        app_rd_data_valid;

wire            app_sr_req = 1'b0;  	// input	app_sr_req
wire            app_ref_req = 1'b0;  	// input	app_ref_req
wire            app_zq_req = 1'b0;  	// input	app_zq_req
wire            app_sr_active; // output	app_sr_active
wire            app_ref_ack;  	// output	app_ref_ack
wire            app_zq_ack;  	// output	app_zq_ack

wire            ui_clk;
wire            ui_clk_sync_rst;
wire            w_init_calib_complete;

assign o_init_calib_complete = w_init_calib_complete; //

localparam P_RESET = 4'd0;
localparam P_IDLE  = 4'd1;
localparam P_WDATA = 4'd2;
localparam P_WDONE = 4'd3;
localparam P_RDATA = 4'd4;
localparam P_RDONE = 4'd5;
localparam P_WR_BURST_THRESHOLD = 80;	//80*8=640*16bit
localparam P_RD_BURST_THRESHOLD = 80;	//80*8=640*16bit
localparam P_WR_FIFO_THRESHOLD = 78;
localparam P_RD_FIFO_THRESHOLD = 500;
reg [3:0]r_nstate,r_cstate;

reg [7:0]r_addrcnt;
reg [7:0]r_rdcnt;
reg [7:0]r_wrcnt;

reg [26:0]r_app_wraddr;
reg [26:0]r_app_rdaddr;

wire w_wrfifo_rden;

wire [8:0]w_wrfifo_data_count;
wire [9:0]w_rdfifo_data_count;



fifo_ddr3_write uut_fifo_ddr3_write (
  .rst          (i_wrfifo_clr),                      // input wire rst
  .wr_clk       (i_clk_ddr3wr),                // input wire wr_clk
  .rd_clk       (ui_clk),                // input wire rd_clk
  .din          (i_wrfifo_data),                      // input wire [15 : 0] din
  .wr_en        (i_wrfifo_vld),                  // input wire wr_en
  .rd_en        (w_wrfifo_rden),                  // input wire rd_en
  .dout         (app_wdf_data),                    // output wire [127 : 0] dout
  .rd_data_count(w_wrfifo_data_count),  // output wire [8 : 0] rd_data_count
  .full         (),                    // output wire full
  .empty        (),                  // output wire empty
  .wr_rst_busy  (),      // output wire wr_rst_busy
  .rd_rst_busy  ()      // output wire rd_rst_busy
);

/*
    DDR3 write and read state
                                                   (app_wdf_wren) && app_cmd
                                                    _____________>P_WRITE----------->P_WDONE
                                                   /                         80
              w_init_calib_complete               /
    P_RESET---------------------------->P_IDLE---/
                                                  \
                                                    \-------------->P_READ------------->P_RDONE
                                                      (app_cmd)               80

*/
//------------------------------------the count of writing and reading--------------------------//
always @(posedge ui_clk) begin
  if(r_cstate == P_WDATA)begin
    if(app_wdf_wren && app_wdf_rdy) r_wrcnt <= r_wrcnt + 1;
    else ;
  end
  else r_wrcnt <= 'b0;
end
always @(posedge ui_clk) begin
  if((r_cstate == P_WDATA) || (r_cstate == P_RDATA))begin
    if(app_en && app_rdy)r_addrcnt <= r_addrcnt + 1'b1;
    else ;
  end 
  else r_addrcnt <= 'b0;
end
always @(posedge ui_clk) begin
  if(i_rdfifo_clr)r_rdcnt <= 'b0;
  else if(r_rdcnt < 255)r_rdcnt <= r_rdcnt + 1;
  else;
end


//---------------------------DDR3 control read and write state-------------------------------------//
always @(posedge ui_clk) begin
  if(!i_rst_n || ui_clk_sync_rst) r_cstate <= P_RESET;
  else r_cstate <= r_nstate;
end

always @(*) begin
  case (r_cstate)
    P_RESET    :  begin 
                      if(w_init_calib_complete)r_nstate = P_IDLE; 
                      else r_nstate = P_RESET;
                  end  
    P_IDLE     :  begin
                        if(w_wrfifo_data_count >= P_WR_FIFO_THRESHOLD )r_nstate = P_WDATA;//When the data in the FIFO is full, the DDR3 switches to the write state
                        else if((w_rdfifo_data_count < P_RD_FIFO_THRESHOLD) &&(r_rdcnt == 255))r_nstate = P_RDATA;
                        else r_nstate = P_IDLE;
                  end
    P_WDATA    :  begin
                        if((r_addrcnt >= P_WR_BURST_THRESHOLD) &&(r_wrcnt >= P_WR_BURST_THRESHOLD))r_nstate  =  P_WDONE;
                        else r_nstate = P_WDATA;
                  end
    P_WDONE    :  begin
                        r_nstate = P_IDLE;
                  end
    P_RDATA    :  begin
                        if(r_addrcnt >= P_RD_BURST_THRESHOLD) r_nstate = P_RDONE;
                        else r_nstate = P_RDATA;
                  end
    P_RDONE    :  r_nstate = P_IDLE;
    default: ;
  endcase
end

//-------------DDR3 control signal---app_en----app_cmd------app_addr---------------------------------//
//---------------------------------------------------------------------------------------------------//

always @(posedge ui_clk) begin   //app_en
  if(r_cstate == P_WDATA)begin
    if(r_addrcnt == 0) app_en <= 'b1;
    else if((r_addrcnt == P_WR_BURST_THRESHOLD-1) && app_rdy)app_en <= 'b0;
    else ;
  end
  else if(r_cstate == P_RDATA)begin
    if(r_addrcnt == 0) app_en <= 'b1;
    else if((r_addrcnt == P_RD_BURST_THRESHOLD-1) && app_rdy)app_en <= 'b0;
    else ;
  end
  else app_en <= 'b0;
end

always @(posedge ui_clk) begin  //app_cmd
  if(r_cstate == P_WDATA)begin
    app_cmd <= 3'b000;
  end else if(r_cstate == P_RDATA)app_cmd <= 3'b001;
  else app_cmd <= 3'b001; 
end

always @( *) begin //app_addr
  if(r_cstate == P_WDATA)app_addr <= {1'b0,r_app_wraddr};
  else if(r_cstate == P_RDATA)app_addr <= {1'b0,r_app_rdaddr};
  else ;
end

always @(posedge ui_clk) begin //r_app_wraddr
  if(i_wrfifo_clr)r_app_wraddr <= 'b0;
  else if(app_en && app_rdy && (r_cstate == P_WDATA)) r_app_wraddr <= r_app_wraddr + 8;
  else;
end

always @(posedge ui_clk) begin //r_app_rdaddr
  if(i_rdfifo_clr)r_app_rdaddr <= 'b0;
  else if(app_en && app_rdy &&(r_cstate == P_RDATA))r_app_rdaddr <= r_app_rdaddr + 8;
  else;
end
//------------------------------------------------------------------------------------------------------------------------------------------//

//--------------------------------app_wdf_wren----app_wdf_end-------------------------------------------------------------------------------//
//------------------------------------------------------------------------------------------------------------------------------------------//

always @(posedge ui_clk) begin
  if(r_cstate == P_WDATA) begin
    if(r_wrcnt == 'b0)app_wdf_wren <= 1;
    else if(r_wrcnt == P_WR_BURST_THRESHOLD -1 && app_wdf_rdy) app_wdf_wren <= 'b0;
    else ;
  end 
  else app_wdf_wren <= 'b0;
end

assign app_wdf_end = app_wdf_wren;
assign w_wrfifo_rden = app_wdf_wren & app_wdf_rdy;
//------------------------------------------------------------------------------------------------------------------------------------------//



  mig_7series_0 u_mig_7series_0 (
    // Memory interface ports
    .ddr3_addr                      (ddr3_addr),  // output [13:0]		ddr3_addr
    .ddr3_ba                        (ddr3_ba),  // output [2:0]		ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),  // output			ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]		ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]		ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),  // output [0:0]		ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),  // output			ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),  // output			ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),  // output			ddr3_we_n
    .ddr3_dq                        (ddr3_dq),  // inout [15:0]		ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [1:0]		ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [1:0]		ddr3_dqs_p
    .init_calib_complete            (w_init_calib_complete),  // output			init_calib_complete
    .ddr3_dm                        (ddr3_dm),  // output [1:0]		ddr3_dm
    .ddr3_odt                       (ddr3_odt),  // output [0:0]		ddr3_odt
    // Application interface ports
    .app_addr                       (app_addr),  // input [27:0]		app_addr
    .app_cmd                        (app_cmd),  // input [2:0]		app_cmd
    .app_en                         (app_en),  // input				app_en
    .app_wdf_data                   (app_wdf_data),  // input [127:0]		app_wdf_data
    .app_wdf_end                    (app_wdf_end),  // input				app_wdf_end
    .app_wdf_wren                   (app_wdf_wren),  // input				app_wdf_wren
    .app_rd_data                    (app_rd_data),  // output [127:0]		app_rd_data
    .app_rd_data_end                (app_rd_data_end),  // output			app_rd_data_end
    .app_rd_data_valid              (app_rd_data_valid),  // output			app_rd_data_valid
    .app_rdy                        (app_rdy),  // output			app_rdy
    .app_wdf_rdy                    (app_wdf_rdy),  // output			app_wdf_rdy
    .app_sr_req                     (app_sr_req),  // input			app_sr_req
    .app_ref_req                    (app_ref_req),  // input			app_ref_req
    .app_zq_req                     (app_zq_req),  // input			app_zq_req
    .app_sr_active                  (app_sr_active),  // output			app_sr_active
    .app_ref_ack                    (app_ref_ack),  // output			app_ref_ack
    .app_zq_ack                     (app_zq_ack),  // output			app_zq_ack
    .ui_clk                         (ui_clk),  // output			ui_clk
    .ui_clk_sync_rst                (ui_clk_sync_rst),  // output			ui_clk_sync_rst
    .app_wdf_mask                   (app_wdf_mask),  // input [15:0]		app_wdf_mask
    // System Clock Ports
    .sys_clk_i                       (i_clk_200M),
    .sys_rst                         (i_rst_n) // input sys_rst
    );

//------------------------------------------------------------------------------------------------------------------------------------------//

fifo_ddr3_read uut_fifo_ddr3_read (
  .rst            (i_rdfifo_clr),                  // input wire rst
  .wr_clk         (ui_clk),            // input wire wr_clk
  .rd_clk         (i_clk_ddr3rd),            // input wire rd_clk
  .din            (app_rd_data),                  // input wire [127 : 0] din
  .wr_en          (app_rd_data_valid),              // input wire wr_en
  .rd_en          (i_rdfifo_vld),              // input wire rd_en
  .dout           (o_rdfifo_data),                // output wire [15 : 0] dout
  .wr_data_count  (w_rdfifo_data_count)  // output wire [9 : 0] wr_data_count
  /*
  .full(full),                // output wire full
  .empty(empty),              // output wire empty
  .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
  */
);

endmodule