set_property PACKAGE_PIN G14 [get_ports {ddr3_dqs_p[1]}]
set_property PACKAGE_PIN F14 [get_ports {ddr3_dqs_n[1]}]
set_property PACKAGE_PIN D14 [get_ports {ddr3_dqs_p[0]}]
set_property PACKAGE_PIN D15 [get_ports {ddr3_dqs_n[0]}]
set_property IOSTANDARD LVTTL [get_ports i_clk]
set_property PACKAGE_PIN N11 [get_ports i_clk]

set_property IOSTANDARD LVTTL [get_ports i_rst_n]
set_property PACKAGE_PIN T2 [get_ports i_rst_n]


set_property IOSTANDARD LVTTL [get_ports o_image_sensor_sclk]
set_property PACKAGE_PIN C1 [get_ports o_image_sensor_sclk]
set_property IOSTANDARD LVTTL [get_ports io_image_sensor_sdat]
set_property PACKAGE_PIN B1 [get_ports io_image_sensor_sdat]
set_property IOSTANDARD LVTTL [get_ports o_image_sensor_exposure]
set_property PACKAGE_PIN J3 [get_ports o_image_sensor_exposure]
set_property IOSTANDARD LVTTL [get_ports o_image_sensor_pwdn]
set_property PACKAGE_PIN J5 [get_ports o_image_sensor_pwdn]
set_property IOSTANDARD LVTTL [get_ports i_image_sensor_pclk]
set_property PACKAGE_PIN F2 [get_ports i_image_sensor_pclk]
set_property IOSTANDARD LVTTL [get_ports o_image_sensor_xclk]
set_property PACKAGE_PIN E2 [get_ports o_image_sensor_xclk]
set_property IOSTANDARD LVTTL [get_ports i_image_sensor_vsync]
set_property PACKAGE_PIN G5 [get_ports i_image_sensor_vsync]
set_property IOSTANDARD LVTTL [get_ports i_image_sensor_href]
set_property PACKAGE_PIN G4 [get_ports i_image_sensor_href]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets i_image_sensor_pclk_IBUF]

set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[0]}]
set_property PACKAGE_PIN H3 [get_ports {i_image_sensor_data[0]}]
set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[1]}]
set_property PACKAGE_PIN J4 [get_ports {i_image_sensor_data[1]}]
set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[2]}]
set_property PACKAGE_PIN H4 [get_ports {i_image_sensor_data[2]}]
set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[3]}]
set_property PACKAGE_PIN K2 [get_ports {i_image_sensor_data[3]}]
set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[4]}]
set_property PACKAGE_PIN H2 [get_ports {i_image_sensor_data[4]}]
set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[5]}]
set_property PACKAGE_PIN L3 [get_ports {i_image_sensor_data[5]}]
set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[6]}]
set_property PACKAGE_PIN G1 [get_ports {i_image_sensor_data[6]}]
set_property IOSTANDARD LVTTL [get_ports {i_image_sensor_data[7]}]
set_property PACKAGE_PIN K1 [get_ports {i_image_sensor_data[7]}]

set_property IOSTANDARD LVTTL [get_ports o_vga_clk]
set_property IOSTANDARD LVTTL [get_ports o_vga_vsy]
set_property IOSTANDARD LVTTL [get_ports o_vga_hsy]
set_property IOSTANDARD LVTTL [get_ports {o_vga_r[0]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_r[1]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_r[2]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_r[3]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_r[4]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_g[0]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_g[1]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_g[2]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_g[3]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_g[4]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_g[5]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_b[0]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_b[1]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_b[2]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_b[3]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_b[4]}]
set_property IOSTANDARD LVTTL [get_ports o_adv7123_blank_n]
set_property IOSTANDARD LVTTL [get_ports o_adv7123_sync_n]
set_property IOSTANDARD LVTTL [get_ports {o_vga_rgb[0]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_rgb[1]}]
set_property IOSTANDARD LVTTL [get_ports {o_vga_rgb[2]}]


set_property PACKAGE_PIN D4 [get_ports o_vga_clk]
set_property PACKAGE_PIN C6 [get_ports o_vga_vsy]
set_property PACKAGE_PIN C4 [get_ports o_vga_hsy]
set_property PACKAGE_PIN E3 [get_ports {o_vga_r[0]}]
set_property PACKAGE_PIN F5 [get_ports {o_vga_r[1]}]
set_property PACKAGE_PIN D3 [get_ports {o_vga_r[2]}]
set_property PACKAGE_PIN E5 [get_ports {o_vga_r[3]}]
set_property PACKAGE_PIN C3 [get_ports {o_vga_r[4]}]
set_property PACKAGE_PIN F4 [get_ports {o_vga_g[0]}]
set_property PACKAGE_PIN C2 [get_ports {o_vga_g[1]}]
set_property PACKAGE_PIN F3 [get_ports {o_vga_g[2]}]
set_property PACKAGE_PIN A5 [get_ports {o_vga_g[3]}]
set_property PACKAGE_PIN B4 [get_ports {o_vga_g[4]}]
set_property PACKAGE_PIN A4 [get_ports {o_vga_g[5]}]
set_property PACKAGE_PIN B2 [get_ports {o_vga_b[0]}]
set_property PACKAGE_PIN A7 [get_ports {o_vga_b[1]}]
set_property PACKAGE_PIN A2 [get_ports {o_vga_b[2]}]
set_property PACKAGE_PIN B6 [get_ports {o_vga_b[3]}]
set_property PACKAGE_PIN D6 [get_ports {o_vga_b[4]}]
set_property PACKAGE_PIN A3 [get_ports o_adv7123_blank_n]
set_property PACKAGE_PIN B7 [get_ports o_adv7123_sync_n]
set_property PACKAGE_PIN B5 [get_ports {o_vga_rgb[0]}]
set_property PACKAGE_PIN D5 [get_ports {o_vga_rgb[1]}]
set_property PACKAGE_PIN C7 [get_ports {o_vga_rgb[2]}]



##################################################################################################
##
##  Xilinx, Inc. 2010            www.xilinx.com
##  Thu Feb 9 12:59:49 2017
##  Generated by MIG Version 4.0
##
##################################################################################################
##  File name :       mig_7series_0.xdc
##  Details :     Constraints file
##                    FPGA Family:       ARTIX7
##                    FPGA Part:         XC7A35T-FTG256
##                    Speedgrade:        -1
##                    Design Entry:      VERILOG
##                    Frequency:         400 MHz
##                    Time Period:       2500 ps
##################################################################################################

##################################################################################################
## Controller 0
## Memory Device: DDR3_SDRAM->Components->MT41K128M16XX-15E
## Data Width: 16
## Time Period: 2500
## Data Mask: 1
##################################################################################################

#create_clock -period 5 [get_ports sys_clk_i]

############## NET - IOSTANDARD ##################


# PadFunction: IO_L13P_T2_MRCC_15
set_property SLEW FAST [get_ports {ddr3_dq[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[0]}]
set_property PACKAGE_PIN E12 [get_ports {ddr3_dq[0]}]

# PadFunction: IO_L13N_T2_MRCC_15
set_property SLEW FAST [get_ports {ddr3_dq[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[1]}]
set_property PACKAGE_PIN E13 [get_ports {ddr3_dq[1]}]

# PadFunction: IO_L14P_T2_SRCC_15
set_property SLEW FAST [get_ports {ddr3_dq[2]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[2]}]
set_property PACKAGE_PIN E11 [get_ports {ddr3_dq[2]}]

# PadFunction: IO_L14N_T2_SRCC_15
set_property SLEW FAST [get_ports {ddr3_dq[3]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[3]}]
set_property PACKAGE_PIN D11 [get_ports {ddr3_dq[3]}]

# PadFunction: IO_L16N_T2_A27_15
set_property SLEW FAST [get_ports {ddr3_dq[4]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[4]}]
set_property PACKAGE_PIN F13 [get_ports {ddr3_dq[4]}]

# PadFunction: IO_L17P_T2_A26_15
set_property SLEW FAST [get_ports {ddr3_dq[5]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[5]}]
set_property PACKAGE_PIN E16 [get_ports {ddr3_dq[5]}]

# PadFunction: IO_L17N_T2_A25_15
set_property SLEW FAST [get_ports {ddr3_dq[6]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[6]}]
set_property PACKAGE_PIN D16 [get_ports {ddr3_dq[6]}]

# PadFunction: IO_L18P_T2_A24_15
set_property SLEW FAST [get_ports {ddr3_dq[7]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[7]}]
set_property PACKAGE_PIN F15 [get_ports {ddr3_dq[7]}]

# PadFunction: IO_L19N_T3_A21_VREF_15
set_property SLEW FAST [get_ports {ddr3_dq[8]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[8]}]
set_property PACKAGE_PIN G12 [get_ports {ddr3_dq[8]}]

# PadFunction: IO_L20P_T3_A20_15
set_property SLEW FAST [get_ports {ddr3_dq[9]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[9]}]
set_property PACKAGE_PIN H12 [get_ports {ddr3_dq[9]}]

# PadFunction: IO_L20N_T3_A19_15
set_property SLEW FAST [get_ports {ddr3_dq[10]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[10]}]
set_property PACKAGE_PIN H13 [get_ports {ddr3_dq[10]}]

# PadFunction: IO_L22P_T3_A17_15
set_property SLEW FAST [get_ports {ddr3_dq[11]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[11]}]
set_property PACKAGE_PIN H16 [get_ports {ddr3_dq[11]}]

# PadFunction: IO_L22N_T3_A16_15
set_property SLEW FAST [get_ports {ddr3_dq[12]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[12]}]
set_property PACKAGE_PIN G16 [get_ports {ddr3_dq[12]}]

# PadFunction: IO_L23P_T3_FOE_B_15
set_property SLEW FAST [get_ports {ddr3_dq[13]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[13]}]
set_property PACKAGE_PIN J15 [get_ports {ddr3_dq[13]}]

# PadFunction: IO_L23N_T3_FWE_B_15
set_property SLEW FAST [get_ports {ddr3_dq[14]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[14]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[14]}]
set_property PACKAGE_PIN J16 [get_ports {ddr3_dq[14]}]

# PadFunction: IO_L24P_T3_RS1_15
set_property SLEW FAST [get_ports {ddr3_dq[15]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dq[15]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dq[15]}]
set_property PACKAGE_PIN H14 [get_ports {ddr3_dq[15]}]

# PadFunction: IO_L1P_T0_AD0P_15
set_property SLEW FAST [get_ports {ddr3_addr[13]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[13]}]
set_property PACKAGE_PIN C8 [get_ports {ddr3_addr[13]}]

# PadFunction: IO_L1N_T0_AD0N_15
set_property SLEW FAST [get_ports {ddr3_addr[12]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[12]}]
set_property PACKAGE_PIN C9 [get_ports {ddr3_addr[12]}]

# PadFunction: IO_L2P_T0_AD8P_15
set_property SLEW FAST [get_ports {ddr3_addr[11]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[11]}]
set_property PACKAGE_PIN A8 [get_ports {ddr3_addr[11]}]

# PadFunction: IO_L2N_T0_AD8N_15
set_property SLEW FAST [get_ports {ddr3_addr[10]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[10]}]
set_property PACKAGE_PIN A9 [get_ports {ddr3_addr[10]}]

# PadFunction: IO_L4P_T0_15
set_property SLEW FAST [get_ports {ddr3_addr[9]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[9]}]
set_property PACKAGE_PIN B10 [get_ports {ddr3_addr[9]}]

# PadFunction: IO_L4N_T0_15
set_property SLEW FAST [get_ports {ddr3_addr[8]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[8]}]
set_property PACKAGE_PIN B11 [get_ports {ddr3_addr[8]}]

# PadFunction: IO_L5P_T0_AD9P_15
set_property SLEW FAST [get_ports {ddr3_addr[7]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[7]}]
set_property PACKAGE_PIN B12 [get_ports {ddr3_addr[7]}]

# PadFunction: IO_L5N_T0_AD9N_15
set_property SLEW FAST [get_ports {ddr3_addr[6]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[6]}]
set_property PACKAGE_PIN A12 [get_ports {ddr3_addr[6]}]

# PadFunction: IO_L6P_T0_15
set_property SLEW FAST [get_ports {ddr3_addr[5]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[5]}]
set_property PACKAGE_PIN D8 [get_ports {ddr3_addr[5]}]

# PadFunction: IO_L6N_T0_VREF_15
set_property SLEW FAST [get_ports {ddr3_addr[4]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[4]}]
set_property PACKAGE_PIN D9 [get_ports {ddr3_addr[4]}]

# PadFunction: IO_L7P_T1_AD2P_15
set_property SLEW FAST [get_ports {ddr3_addr[3]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[3]}]
set_property PACKAGE_PIN A13 [get_ports {ddr3_addr[3]}]

# PadFunction: IO_L7N_T1_AD2N_15
set_property SLEW FAST [get_ports {ddr3_addr[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[2]}]
set_property PACKAGE_PIN A14 [get_ports {ddr3_addr[2]}]

# PadFunction: IO_L8P_T1_AD10P_15
set_property SLEW FAST [get_ports {ddr3_addr[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[1]}]
set_property PACKAGE_PIN C14 [get_ports {ddr3_addr[1]}]

# PadFunction: IO_L8N_T1_AD10N_15
set_property SLEW FAST [get_ports {ddr3_addr[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_addr[0]}]
set_property PACKAGE_PIN B14 [get_ports {ddr3_addr[0]}]

# PadFunction: IO_L9P_T1_DQS_AD3P_15
set_property SLEW FAST [get_ports {ddr3_ba[2]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[2]}]
set_property PACKAGE_PIN B15 [get_ports {ddr3_ba[2]}]

# PadFunction: IO_L9N_T1_DQS_AD3N_15
set_property SLEW FAST [get_ports {ddr3_ba[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[1]}]
set_property PACKAGE_PIN A15 [get_ports {ddr3_ba[1]}]

# PadFunction: IO_L10P_T1_AD11P_15
set_property SLEW FAST [get_ports {ddr3_ba[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_ba[0]}]
set_property PACKAGE_PIN C16 [get_ports {ddr3_ba[0]}]

# PadFunction: IO_L10N_T1_AD11N_15
set_property SLEW FAST [get_ports ddr3_ras_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_ras_n]
set_property PACKAGE_PIN B16 [get_ports ddr3_ras_n]

# PadFunction: IO_L11P_T1_SRCC_15
set_property SLEW FAST [get_ports ddr3_cas_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_cas_n]
set_property PACKAGE_PIN C11 [get_ports ddr3_cas_n]

# PadFunction: IO_L11N_T1_SRCC_15
set_property SLEW FAST [get_ports ddr3_we_n]
set_property IOSTANDARD SSTL15 [get_ports ddr3_we_n]
set_property PACKAGE_PIN C12 [get_ports ddr3_we_n]

# PadFunction: IO_L18N_T2_A23_15
set_property SLEW FAST [get_ports ddr3_reset_n]
set_property IOSTANDARD LVCMOS15 [get_ports ddr3_reset_n]
set_property PACKAGE_PIN E15 [get_ports ddr3_reset_n]

# PadFunction: IO_L12P_T1_MRCC_15
set_property SLEW FAST [get_ports {ddr3_cke[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_cke[0]}]
set_property PACKAGE_PIN D13 [get_ports {ddr3_cke[0]}]

# PadFunction: IO_L12N_T1_MRCC_15
set_property SLEW FAST [get_ports {ddr3_odt[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_odt[0]}]
set_property PACKAGE_PIN C13 [get_ports {ddr3_odt[0]}]

# PadFunction: IO_L16P_T2_A28_15
set_property SLEW FAST [get_ports {ddr3_dm[0]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[0]}]
set_property PACKAGE_PIN F12 [get_ports {ddr3_dm[0]}]

# PadFunction: IO_L19P_T3_A22_15
set_property SLEW FAST [get_ports {ddr3_dm[1]}]
set_property IOSTANDARD SSTL15 [get_ports {ddr3_dm[1]}]
set_property PACKAGE_PIN H11 [get_ports {ddr3_dm[1]}]

# PadFunction: IO_L15P_T2_DQS_15
set_property SLEW FAST [get_ports {ddr3_dqs_p[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[0]}]

# PadFunction: IO_L15N_T2_DQS_ADV_B_15
set_property SLEW FAST [get_ports {ddr3_dqs_n[0]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[0]}]

# PadFunction: IO_L21P_T3_DQS_15
set_property SLEW FAST [get_ports {ddr3_dqs_p[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_p[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_p[1]}]

# PadFunction: IO_L21N_T3_DQS_A18_15
set_property SLEW FAST [get_ports {ddr3_dqs_n[1]}]
set_property IN_TERM UNTUNED_SPLIT_50 [get_ports {ddr3_dqs_n[1]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_dqs_n[1]}]

# PadFunction: IO_L3P_T0_DQS_AD1P_15
set_property SLEW FAST [get_ports {ddr3_ck_p[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_p[0]}]

# PadFunction: IO_L3N_T0_DQS_AD1N_15
set_property SLEW FAST [get_ports {ddr3_ck_n[0]}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {ddr3_ck_n[0]}]
set_property PACKAGE_PIN B9 [get_ports {ddr3_ck_p[0]}]
set_property PACKAGE_PIN A10 [get_ports {ddr3_ck_n[0]}]


set_property INTERNAL_VREF 0.75 [get_iobanks 15]

set_property LOC PHASER_OUT_PHY_X0Y7 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_out}]
set_property LOC PHASER_OUT_PHY_X0Y6 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_out}]
set_property LOC PHASER_OUT_PHY_X0Y5 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_out}]
set_property LOC PHASER_OUT_PHY_X0Y4 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_out}]

## set_property LOC PHASER_IN_PHY_X0Y7 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/phaser_in_gen.phaser_in}]
## set_property LOC PHASER_IN_PHY_X0Y6 [get_cells  -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X0Y5 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/phaser_in_gen.phaser_in}]
set_property LOC PHASER_IN_PHY_X0Y4 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/phaser_in_gen.phaser_in}]



set_property LOC OUT_FIFO_X0Y7 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_D.ddr_byte_lane_D/out_fifo}]
set_property LOC OUT_FIFO_X0Y6 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_C.ddr_byte_lane_C/out_fifo}]
set_property LOC OUT_FIFO_X0Y5 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/out_fifo}]
set_property LOC OUT_FIFO_X0Y4 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/out_fifo}]

set_property LOC IN_FIFO_X0Y5 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/in_fifo_gen.in_fifo}]
set_property LOC IN_FIFO_X0Y4 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/in_fifo_gen.in_fifo}]

set_property LOC PHY_CONTROL_X0Y1 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/phy_control_i}]

set_property LOC PHASER_REF_X0Y1 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/phaser_ref_i}]

set_property LOC OLOGIC_X0Y69 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_B.ddr_byte_lane_B/ddr_byte_group_io/*slave_ts}]
set_property LOC OLOGIC_X0Y57 [get_cells -hier -filter {NAME =~ */ddr_phy_4lanes_0.u_ddr_phy_4lanes/ddr_byte_lane_A.ddr_byte_lane_A/ddr_byte_group_io/*slave_ts}]

set_property LOC PLLE2_ADV_X0Y1 [get_cells -hier -filter {NAME =~ */u_ddr3_infrastructure/plle2_i}]
set_property LOC MMCME2_ADV_X0Y1 [get_cells -hier -filter {NAME =~ */u_ddr3_infrastructure/gen_mmcm.mmcm_i}]


set_multicycle_path -setup -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r_reg}] -to [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] 6

set_multicycle_path -hold -from [get_cells -hier -filter {NAME =~ */mc0/mc_read_idle_r_reg}] -to [get_cells -hier -filter {NAME =~ */input_[?].iserdes_dq_.iserdesdq}] 5

set_false_path -through [get_pins -filter {NAME =~ */DQSFOUND} -of [get_cells -hier -filter {REF_NAME == PHASER_IN_PHY}]]

set_multicycle_path -setup -start -through [get_pins -filter {NAME =~ */OSERDESRST} -of [get_cells -hier -filter {REF_NAME == PHASER_OUT_PHY}]] 2
set_multicycle_path -hold -start -through [get_pins -filter {NAME =~ */OSERDESRST} -of [get_cells -hier -filter {REF_NAME == PHASER_OUT_PHY}]] 1

set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/* && IS_SEQUENTIAL}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/device_temp_sync_r1*}] 20.000
set_max_delay -datapath_only -from [get_cells -hier *rstdiv0_sync_r1_reg*] -to [get_pins -filter {NAME =~ */RESET} -of [get_cells -hier -filter {REF_NAME == PHY_CONTROL}]] 5.000
set_false_path -through [get_pins -hier -filter {NAME =~ */u_iodelay_ctrl/sys_rst}]

set_max_delay -datapath_only -from [get_cells -hier -filter {NAME =~ *ddr3_infrastructure/rstdiv0_sync_r1_reg*}] -to [get_cells -hier -filter {NAME =~ *temp_mon_enabled.u_tempmon/xadc_supplied_temperature.rst_r1*}] 20.000


set_max_delay -from [get_clocks -of_objects [get_pins uut_M_ddr3_cache/u_mig_7series_0/u_mig_7series_0_mig/u_ddr3_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]] -to [get_clocks -of_objects [get_pins uut_clk_wiz_0/inst/mmcm_adv_inst/CLKOUT2]] 20.000
