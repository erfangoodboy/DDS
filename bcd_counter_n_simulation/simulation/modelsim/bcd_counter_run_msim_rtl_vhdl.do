transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/intelFPGA_lite/16.1/projects/bcd_counter/bcd_counter.vhd}

vcom -93 -work work {C:/intelFPGA_lite/16.1/projects/bcd_counter/test_bench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L arriaii_hssi -L arriaii_pcie_hip -L arriaii -L rtl_work -L work -voptargs="+acc"  test_bench

add wave *
view structure
view signals
run 500 ns
