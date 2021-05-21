transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {bcd_counter.vo}

vcom -93 -work work {C:/intelFPGA_lite/16.1/projects/bcd_counter/test_bench.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_mf_ver -L altera_ver -L lpm_ver -L sgate_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L gate_work -L work -voptargs="+acc"  test_bench

add wave *
view structure
view signals
run 500 ns
