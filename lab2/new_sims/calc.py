#!/bin/python
import csv
import sys


def main():
    for filename in sys.argv[1:]:
        falltime = 0
        risetime = 0
        propdelay_rise = 0
        propdelay_fall = 0
        with open(filename, 'r') as csvfile:
            data = list(csv.reader(csvfile))
            sig_in = [0, 0]
            sig_out = [0, 0]
            top90 = 4.5
            half = 2.5
            bottom10 = 0.5
            if filename == "Output_x1_1.csv":
                sig_in = [4, 5]
            else:
                sig_in = [0, 1]
            sig_out = [2, 3]
            out = findYValue(data, sig_out[0], sig_out[1], 4.5, 1)
            sp4 = out[2]
            sp5 = 0
            if out[1]:
                falltime = out[0]
                out = findYValue(data, sig_out[0], sig_out[1], .5, sp4)
                sp5 = out[2]
                falltime = (falltime - out[0])*(-1)
            else:
                risetime = out[0]
                out = findYValue(data, sig_out[0], sig_out[1], .5, 1)
                sp5 = out[2]
                risetime = (risetime - out[0])
            out = findYValue(data, sig_out[0], sig_out[1], 4.5, sp4)
            if out[1]:
                falltime = out[0]
                out = findYValue(data, sig_out[0], sig_out[1], .5, sp5)
                falltime = (falltime - out[0])*(-1)
            else:              
                risetime = out[0]
                out = findYValue(data, sig_out[0], sig_out[1], .5, sp5)
                risetime = (risetime - out[0])
            out = findYValue(data, sig_out[0], sig_out[1], 2.5, 1)
            spOut = out[2]
            spIn = 0
            if out[1]:
                propdelay_fall = out[0]
                out = findYValue(data, sig_in[0], sig_in[1], 2.5, 1)
                spIn = out[2]
                propdelay_fall = propdelay_fall - out[0]
            else:
                propdelay_rise = out[0]
                out = findYValue(data, sig_in[0], sig_in[1], 2.5, 1)
                spIn = out[2]
                propdelay_rise = propdelay_rise - out[0]
            out = findYValue(data, sig_out[0], sig_out[1], 2.5, spOut)
            if out[1]:
                propdelay_fall = out[0]
                out = findYValue(data, sig_in[0], sig_in[1], 2.5, spIn)
                spIn = out[2]
                propdelay_fall = propdelay_fall - out[0]
            else:
                propdelay_rise = out[0]
                out = findYValue(data, sig_in[0], sig_in[1], 2.5, spIn)
                spIn = out[2]
                propdelay_rise = propdelay_rise - out[0]

            print("----", filename, "----\n", "\nRise Time: ", risetime, "\nFall Time: ", falltime, "\nProp Rise: ", propdelay_rise, "\nProp Fall: ", propdelay_fall, "\n\n")
    
           

def findYValue(data, xcol, ycol, value, startingPoint):
    prev = float(data[startingPoint][ycol])
    falling = False
    for i in range(startingPoint + 1, len(data)):
        current = float(data[i][ycol])
        x = 0
        if current > value and prev < value:
            x = estimateVal(float(data[i - 1][xcol]), float(data[i][xcol]), float(data[i - 1][ycol]), float(data[i][ycol]), value)
            falling = False
            return (x, falling, i)
        if current < value and prev > value:
            x = estimateVal(float(data[i - 1][xcol]), float(data[i][xcol]), float(data[i - 1][ycol]), float(data[i][ycol]), value)
            falling = True
            return (x, falling, i)
        prev = current
    return (-1, falling, -1)

def estimateVal(x1, x2, y1, y2, y):
    return x2 - ((x2 - x1)*(y2 - y))/(y2 - y1)


main()
