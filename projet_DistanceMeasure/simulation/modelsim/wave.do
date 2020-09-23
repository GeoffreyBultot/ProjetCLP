view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue U -period 2ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/distancemeasure/CLOCK_25M 
wave create -driver freeze -pattern clock -initialvalue U -period 5ns -dutycycle 50 -starttime 0ns -endtime 1000ns sim:/distancemeasure/ext_ADC_IN 
WaveCollapseAll -1
wave clipboard restore
