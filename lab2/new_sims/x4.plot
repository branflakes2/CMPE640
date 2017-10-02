#!/bin/gnuplot

set datafile separator ","
set xrange [0:8e-9]
set key on center top
set terminal epslatex size 5,3.75 color solid colortext
set output 'x4.tex'

set linetype  1 lc rgb "dark-violet" lw 2
set linetype  2 lc rgb "#009e73" lw 2
set linetype  3 lc rgb "#56b4e9" lw 2
set linetype  4 lc rgb "#e69f00" lw 2
set linetype  5 lc rgb "#f0e442" lw 2
set linetype  6 lc rgb "#0072b2" lw 2
set linetype  7 lc rgb "#e51e10" lw 2
set linetype  8 lc rgb "black"   lw 2
set linetype  9 lc rgb "gray50"  lw 2
set linetype cycle  9


set xlabel "Time (sec)"
set ylabel "Voltage (V)"
set title "Output Voltage vs. Time of Inverter x4 with Differing Loads and Square Wave Input"

plot \
'Output_x4_1.csv' using 3:4 with lines lt 1 title "1 Load Inverter", \
'Output_x4_2.csv' using 3:4 with lines lt 2 title "2 Load Inverters", \
'Output_x4_4.csv' using 3:4 with lines lt 3 title "4 Load Inverters", \
'Output_x4_8.csv' using 3:4 with lines lt 4 title "8 Load Inverters", \
'Output_x4_16.csv' using 3:4 with lines lt 5 title "16 Load Inverters"


