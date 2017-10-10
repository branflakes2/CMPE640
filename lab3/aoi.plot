#!/bin/gnuplot

set datafile separator ","
set xrange [0:8e-9]
set key at 5.5e-9,3 
set terminal epslatex size 5,3.75 color colortext
set output 'aoi.tex'

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
set title "AOI Simulation Plots"

plot \
'aoi_sA_sch.csv' using 1:2 with lines lt 1 title "sA sch", \
'aoi_sA_ext.csv' using 1:2 with lines lt 1 dashtype 2 title "sA ext", \
'aoi_sB_sch.csv' using 1:2 with lines lt 2 title "sB sch", \
'aoi_sB_ext.csv' using 1:2 with lines lt 2 dashtype 2 title "sB ext", \
'aoi_sC_sch.csv' using 1:2 with lines lt 3 title "sC sch", \
'aoi_sC_ext.csv' using 1:2 with lines lt 3 dashtype 2 title "sC ext", \
'aoi_sD_sch.csv' using 1:2 with lines lt 4 title "sD sch", \
'aoi_sD_ext.csv' using 1:2 with lines lt 4 dashtype 2 title "sD ext" 
