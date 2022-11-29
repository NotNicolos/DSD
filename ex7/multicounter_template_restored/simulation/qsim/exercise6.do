onerror {quit -f}
vlib work
vlog -work work multicounter.vo
vlog -work work exercise6.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.alarm_watch_tester_vlg_vec_tst
vcd file -direction exercise6.msim.vcd
vcd add -internal alarm_watch_tester_vlg_vec_tst/*
vcd add -internal alarm_watch_tester_vlg_vec_tst/i1/*
add wave /*
run -all
