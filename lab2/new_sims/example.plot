#!/bin/gnuplot

set datafile separator ","
set xrange [0:8e-9]
set key on center top
set terminal epslatex size 5,3.75 color solid colortext
set output 'example.tex'

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
set title "Sample Input vs Output Plot of X1 Inverter Driving 16 Inverters"

set arrow from 1.1e-9,2.5 to 1.51e-9,2.5 heads
set label "$\\Delta _t$" at 1.2e-9,2.3
set arrow from 1.256e-9,4.5 to 2.8e-9,4.5 nohead
set arrow from 2.402e-9,.5 to 2.8e-9,.5 nohead
set arrow from 2.8e-9,.6 to 2.8e-9,4.4 heads
set label "$\\Delta _r$" at 2.9e-9,2.5
plot \
'Output_x1_16.csv' using 3:4 with lines lt 1 title "Output", \
'' using 1:2 with lines lt 2 title "Input"

