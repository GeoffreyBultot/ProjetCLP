onerror {quit -f}
vlib work
vlog -work work DistanceMeasure.vo
vlog -work work DistanceMeasure.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DistanceMeasure_vlg_vec_tst
vcd file -direction DistanceMeasure.msim.vcd
vcd add -internal DistanceMeasure_vlg_vec_tst/*
vcd add -internal DistanceMeasure_vlg_vec_tst/i1/*
add wave /*
run -all
