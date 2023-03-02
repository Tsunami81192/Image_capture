onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+fifo_ddr3_write -L xpm -L fifo_generator_v13_2_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fifo_ddr3_write xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {fifo_ddr3_write.udo}

run -all

endsim

quit -force