#!/bin/gnuplot

set datafile separator ","
set xrange [0:8e-8]
set yrange [-1:6]
set key off 
set terminal epslatex size 5,3.75 color colortext
set output 'oai_func.tex'

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

set title "OAI Simulation Plots"

TOP = 1
DY = .2

set multiplot
unset title
unset xlabel
set offset 0,0,graph 0.05, graph 0.05
set ytics 0,5

set ylabel 'D' offset 1
set tmargin at screen TOP-4*DY
set bmargin at screen TOP-5*DY
plot 'oai_func.csv' using 3:4 with lines lt 1

set xtics format ''
set ylabel 'C' offset 1
set tmargin at screen TOP-3*DY
set bmargin at screen TOP-4*DY
plot 'oai_func.csv' using 1:2 with lines lt 2

set ylabel 'B' offset 1
set tmargin at screen TOP-2*DY
set bmargin at screen TOP-3*DY
plot 'oai_func.csv' using 5:6 with lines lt 3

set ylabel 'A' offset 1
set tmargin at screen TOP-DY
set bmargin at screen TOP-2*DY
plot 'oai_func.csv' using 7:8 with lines lt 4

set title "OAI Extracted View Functionality Simulation"
set ylabel 'Out' offset 1
set tmargin at screen TOP
set bmargin at screen TOP-DY
plot 'oai_func.csv' using 9:10 with lines lt 5

unset multiplot; set output

