transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+jtag_axi_0  -L xpm -L jtag_axi -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.jtag_axi_0 xil_defaultlib.glbl

do {jtag_axi_0.udo}

run 1000ns

endsim

quit -force
