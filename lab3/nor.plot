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
set title "Nor Simulation Plots"

plot \
'Output_nor_4_sA.csv' using 3:4 with lines lt 1 title "sA sch", \
'nor_sA.csv' using 1:2 with lines lt 1 dashtype 2 title "sA ext", \
'Output_nor_4_sB.csv' using 3:4 with lines lt 2 title "sB sch", \
'nor_sB.csv' using 1:2 with lines lt 2 dashtype 2 title "sB ext"
