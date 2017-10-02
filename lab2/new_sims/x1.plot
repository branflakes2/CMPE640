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
set output 'x1.tex'

set xlabel "Time (sec)"
set ylabel "Voltage (V)"
set title "Output Voltage vs. Time of Inverter x1 with Differing Loads and Square Wave Input"

plot \
'Output_x1_1.csv' using 5:6 with lines lt 1 title "Input", \
'Output_x1_1.csv' using 3:4 with lines lt 2 title "1 Load Inverter", \
'Output_x1_2.csv' using 3:4 with lines lt 3 title "2 Load Inverters", \
'Output_x1_4.csv' using 3:4 with lines lt 4 title "4 Load Inverters", \
'Output_x1_8.csv' using 3:4 with lines lt 5 title "8 Load Inverters", \
'Output_x1_16.csv' using 3:4 with lines lt 6 title "16 Load Inverters"

