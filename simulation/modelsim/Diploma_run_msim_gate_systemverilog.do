transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {Diploma.svo}

vlog -sv -work work +incdir+E:/Diploma/output_files {E:/Diploma/output_files/tb1.sv}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb1

add wave *
view structure
view signals
run -all
