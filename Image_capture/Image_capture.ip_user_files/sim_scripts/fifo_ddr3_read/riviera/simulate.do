onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fifo_ddr3_read -L xpm -L fifo_generator_v13_2_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fifo_ddr3_read xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fifo_ddr3_read.udo}

run -all

endsim

quit -force
