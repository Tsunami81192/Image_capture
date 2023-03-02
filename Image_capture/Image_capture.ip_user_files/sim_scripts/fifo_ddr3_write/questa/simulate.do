onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_ddr3_write_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_ddr3_write.udo}

run -all

quit -force
