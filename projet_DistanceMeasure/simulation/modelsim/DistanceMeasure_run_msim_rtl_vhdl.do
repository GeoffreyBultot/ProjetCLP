transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/geoff/OneDrive - Haute Ecole Bruxelles Brabant (HE2B)/Ecole 2020 - 2021/UE_SystemesEmbarques/CircuitsLogiqueProgrammable/Cours/Projet_final/projet_DistanceMeasure/DistanceMeasure.vhd}
vcom -93 -work work {D:/geoff/OneDrive - Haute Ecole Bruxelles Brabant (HE2B)/Ecole 2020 - 2021/UE_SystemesEmbarques/CircuitsLogiqueProgrammable/Cours/Projet_final/projet_DistanceMeasure/ADC.vhd}
vcom -93 -work work {D:/geoff/OneDrive - Haute Ecole Bruxelles Brabant (HE2B)/Ecole 2020 - 2021/UE_SystemesEmbarques/CircuitsLogiqueProgrammable/Cours/Projet_final/projet_DistanceMeasure/freq_div.vhd}

