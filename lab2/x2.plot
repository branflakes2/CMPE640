#!/bin/gnuplot

set datafile separator ","
set xrange [0:8e-9]
set style line 1 linecolor rgb '#dd181f' linetype 1 linewidth 2
set style line 2 linecolor rgb '#0060ad' linetype 1 linewidth 2
set style line 3 linecolor rgb '#afd8c5' linetype 1 linewidth 2
set style line 4 linecolor rgb '#08d298' linetype 1 linewidth 2
set style line 5 linecolor rgb '#999999' linetype 1 linewidth 2
set key on center top
set linetype 4 dt 3
set terminal epslatex size 5,3.75 color colortext
set output 'x2.tex'

set title "Voltage vs. Time of Different Loads"

plot \
'Output_x2_1.csv' using 1:2 with lines linestyle 1 title "1 Inverter", \
'Output_x2_2.csv' using 1:2 with lines linestyle 2 title "2 Inverters", \
'Output_x2_4.csv' using 1:2 with lines linestyle 3 title "4 Inverters", \
'Output_x2_8.csv' using 1:2 with lines linestyle 4 title "8 Inverters", \
'Output_x2_16.csv' using 1:2 with lines linestyle 5 title "16 Inverters"


