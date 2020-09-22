onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /distancemeasure/CLOCK_50M
add wave -noupdate /distancemeasure/OUTPUT
add wave -noupdate /distancemeasure/the_ADC_CS
add wave -noupdate /distancemeasure/the_ADC_SCLK
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {911416 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1050 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 10ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/distancemeasure/CLOCK_50M 
WaveCollapseAll -1
wave clipboard restore
