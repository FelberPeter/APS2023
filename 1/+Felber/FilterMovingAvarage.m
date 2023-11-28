function [filtertdata] = FilterMovingAvarage(data,windowSize)
 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
filtertdata = filter(b,a,data);
