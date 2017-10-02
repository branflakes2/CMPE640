#!/bin/python
import csv
import sys


    
def main():
    filename = sys.argv[1]
    yval = float(sys.argv[2])
    col1 = int(sys.argv[3])
    col2 = int(sys.argv[4])
    with open(filename, 'r') as csvfile:
        data = list(csv.reader(csvfile)) 
        print(findYValues(data, col1, col2, yval, 1))
        


def findYValues(data, xcol, ycol, value, startingPoint):
    prev = float(data[startingPoint][ycol])
    intersections = []
    for i in range(startingPoint, len(data)):
        current = float(data[i][ycol])
        x = 0
        if current > value and prev < value:
            x = estimateVal(float(data[i - 1][xcol]), float(data[i][xcol]), float(data[i - 1][ycol]), float(data[i][ycol]), value)
            intersections.append(x)
        if current < value and prev > value:
            x = estimateVal(float(data[i - 1][xcol]), float(data[i][xcol]), float(data[i - 1][ycol]), float(data[i][ycol]), value)
            intersections.append(x)
        prev = current
    return intersections

def estimateVal(x1, x2, y1, y2, y):
    return x2 - ((x2 - x1)*(y2 - y))/(y2 - y1)


main()
