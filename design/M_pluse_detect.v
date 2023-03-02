module M_plus_detect (
    input i_clk,
    input i_rst_n,
    input i_pluse,
    output o_pos_edge,
    output o_neg_edge
);
reg[1:0] r_pulse;

always @(posedge i_clk)	
	if(!i_rst_n) r_pulse <= 'b0;
	else r_pulse <= {r_pulse[0],i_pluse};
	
assign o_pos_edge = ~r_pulse[1] & r_pulse[0];
assign o_neg_edge = r_pulse[1] & ~r_pulse[0];	
endmodule