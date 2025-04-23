transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {}
vlib activehdl/xpm
vlib activehdl/jtag_axi
vlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/hdl/verilog" -l xpm -l jtag_axi -l xil_defaultlib \
"/mnt/data40tb/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/mnt/data40tb/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/mnt/data40tb/Xilinx/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work jtag_axi  -v2k5 "+incdir+../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/hdl/verilog" -l xpm -l jtag_axi -l xil_defaultlib \
"../../../ipstatic/hdl/jtag_axi_v1_2_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/hdl/verilog" -l xpm -l jtag_axi -l xil_defaultlib \
"../../../../project_fpga.gen/sources_1/ip/jtag_axi_0/sim/jtag_axi_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

