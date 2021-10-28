clear variables
close all


m=85
g=9.8
c=13.7



t=0:.1:60

v=g*m/c*(1-exp(-c/m*t))

plot(t,v)