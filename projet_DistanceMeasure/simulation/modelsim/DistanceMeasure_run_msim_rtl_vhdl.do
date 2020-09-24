transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/geoff/OneDrive - Haute Ecole Bruxelles Brabant (HE2B)/Ecole 2020 - 2021/UE_SystemesEmbarques/CircuitsLogiqueProgrammable/Cours/ProjetCLP/projet_DistanceMeasure/DistanceMeasure.vhd}
vcom -93 -work work {D:/geoff/OneDrive - Haute Ecole Bruxelles Brabant (HE2B)/Ecole 2020 - 2021/UE_SystemesEmbarques/CircuitsLogiqueProgrammable/Cours/ProjetCLP/projet_DistanceMeasure/ADC.vhd}
vcom -93 -work work {D:/geoff/OneDrive - Haute Ecole Bruxelles Brabant (HE2B)/Ecole 2020 - 2021/UE_SystemesEmbarques/CircuitsLogiqueProgrammable/Cours/ProjetCLP/projet_DistanceMeasure/rawTo4Digit.vhd}
vcom -93 -work work {D:/geoff/OneDrive - Haute Ecole Bruxelles Brabant (HE2B)/Ecole 2020 - 2021/UE_SystemesEmbarques/CircuitsLogiqueProgrammable/Cours/ProjetCLP/projet_DistanceMeasure/multiplex7seg4digit.vhd}

