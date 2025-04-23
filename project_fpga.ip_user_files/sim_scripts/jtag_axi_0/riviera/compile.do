transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {/home/fpga14/project_fpga/project_fpga.cache/compile_simlib/riviera}
vlib riviera/xpm
vlib riviera/jtag_axi
vlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/hdl/verilog" -l xpm -l jtag_axi -l xil_defaultlib \
"/mnt/data40tb/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/mnt/data40tb/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/mnt/data40tb/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work jtag_axi  -incr -v2k5 "+incdir+../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/hdl/verilog" -l xpm -l jtag_axi -l xil_defaultlib \
"../../../ipstatic/hdl/jtag_axi_v1_2_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/hdl/verilog" -l xpm -l jtag_axi -l xil_defaultlib \
"../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/sim/jtag_axi_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

