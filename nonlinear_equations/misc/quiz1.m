clear all
close all



m=85
c=13.7
g=9.8


t=0:.1:60
v=g*m/c*(1-exp(-c/m*t))
