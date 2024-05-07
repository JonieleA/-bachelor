transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+E:/Diploma/-bachelor {E:/Diploma/-bachelor/simple_dual_port_ram_single_clock.sv}
vlog -sv -work work +incdir+E:/Diploma/-bachelor {E:/Diploma/-bachelor/string_ram.sv}

vlog -sv -work work +incdir+E:/Diploma/-bachelor/output_files {E:/Diploma/-bachelor/output_files/tb9.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb9

add wave *
view structure
view signals
run -all
