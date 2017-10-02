#!/bin/gnuplot

set datafile separator ","
set xrange [0:8e-9]
set key at 5.5e-9,3 
set terminal epslatex size 5,3.75 color colortext
set output 'nor.tex'

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
set title "Output Voltage vs. Time of Nor Gate with Differing Loads and Square Wave Input"

plot \
'Output_nor_1_sA.csv' using 3:4 with lines lt 1 title "1 Load Inverter Switch A", \
'Output_nor_1_sB.csv' using 3:4 with lines lt 1 dashtype 2 title "1 Load Inverter Switch B", \
'Output_nor_2_sA.csv' using 3:4 with lines lt 3 title "2 Load Inverters Switch A", \
'Output_nor_2_sB.csv' using 3:4 with lines lt 3 dashtype 2 title "2 Load Inverters Switch B", \
'Output_nor_4_sA.csv' using 3:4 with lines lt 5 title "4 Load Inverters Switch A", \
'Output_nor_4_sB.csv' using 3:4 with lines lt 5 dashtype 2 title "4 Load Inverters Switch B"

