-makelib ies_lib/xpm -sv \
  "D:/34998/Xinlix/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/34998/Xinlix/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/34998/Xinlix/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Image_capture.srcs/sources_1/ip/fifo_ddr3_read/sim/fifo_ddr3_read.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

