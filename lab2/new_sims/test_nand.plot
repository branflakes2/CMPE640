#!/bin/gnuplot

set datafile separator ","
set xrange [0:8e-9]
set style line 1 linecolor rgb '#dd181f' linetype 1 linewidth 2
set style line 2 linecolor rgb '#0060ad' linetype 1 linewidth 2
set style line 3 linecolor rgb '#afd8c5' linetype 1 linewidth 2
set style line 4 linecolor rgb '#08d298' linetype 1 linewidth 2
set style line 5 linecolor rgb '#999999' linetype 1 linewidth 2
set key at 5.5e-9,3 
set linetype 4 dt 3
set terminal epslatex size 5,3.75 color colortext
set output 'nand.tex'

set xlabel "Time (sec)"
set ylabel "Voltage (V)"
set title "Output Voltage vs. Time of Nand Gate with Differing Loads and Square Wave Input"

plot \
'Output_nand_1_sA.csv' using 1:2 with lines lt 1 title "1 Load Inverter Switch A", \
'Output_nand_1_sB.csv' using 1:2 with lines lt 1 dashtype 2 title "1 Load Inverter Switch B", \
'Output_nand_2_sA.csv' using 1:2 with lines lt 3 title "2 Load Inverters Switch A", \
'Output_nand_2_sB.csv' using 1:2 with lines lt 3 dashtype 2 title "2 Load Inverters Switch B", \
'Output_nand_4_sA.csv' using 1:2 with lines lt 5 title "4 Load Inverters Switch A", \
'Output_nand_4_sB.csv' using 1:2 with lines lt 5 dashtype 2 title "4 Load Inverters Switch B"

