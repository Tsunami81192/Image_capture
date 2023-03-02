onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_ddr3_read_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_ddr3_read.udo}

run -all

quit -force
