#!/bin/gnuplot

set terminal epslatex
set datafile separator ","
set key on left top
set terminal epslatex size 5,3.75 color solid colortext
set output 'inverter_delay.tex'

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

set style data histogram
set style histogram cluster gap 1
set style fill solid border rgb "black"

set ylabel "Rise/Fall Propogation Delay (sec)"
set xlabel "Number of X1 Load Inverters"
set title "Propogation Delay of Different Sized Inverters With Different Loads"

plot 'inverter_delay.csv' using 2:xtic(1) title col, \
    '' using 3:xtic(1) title col, \
    '' using 4:xtic(1) title col, \
    '' using 5:xtic(1) title col, \
    '' using 6:xtic(1) title col, \
    '' using 7:xtic(1) title col
