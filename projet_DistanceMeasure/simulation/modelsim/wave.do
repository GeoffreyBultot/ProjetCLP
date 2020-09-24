onerror {resume}
quietly set dataset_list [list sim vsim]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate /multiplex7seg4digit/Clock2500kHZ
add wave -noupdate /multiplex7seg4digit/DigitDecade
add wave -noupdate /multiplex7seg4digit/DigitUnit
add wave -noupdate /multiplex7seg4digit/DigitTenth
add wave -noupdate /multiplex7seg4digit/DigitHundredth
add wave -noupdate -expand sim:/multiplex7seg4digit/DigitOUT
add wave -noupdate -expand sim:/multiplex7seg4digit/DigitSelection
add wave -noupdate sim:/multiplex7seg4digit/sig_DigitSelection
add wave -noupdate sim:/multiplex7seg4digit/currentDigit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {44253 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 236
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
wave create -driver freeze -pattern clock -initialvalue U -period 10ns -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/multiplex7seg4digit/Clock2500kHZ 
wave modify -driver freeze -pattern clock -initialvalue U -period 10ns -dutycycle 50 -starttime 0ns -endtime 1000ns Edit:/multiplex7seg4digit/Clock2500kHZ 
wave create -driver freeze -pattern constant -value 1000 -range 3 0 -starttime 0ns -endtime 1000ns sim:/multiplex7seg4digit/DigitDecade 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0100 -range 3 0 -starttime 0ns -endtime 1000ns sim:/multiplex7seg4digit/DigitUnit 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0010 -range 3 0 -starttime 0ns -endtime 1000ns sim:/multiplex7seg4digit/DigitTenth 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 0ns -endtime 1000ns sim:/multiplex7seg4digit/DigitHundredth 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
