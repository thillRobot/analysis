
clear all
clc

time=0:.01:10
dtr=pi/180;
theta0=25*dtr; 
f=5
l=0.35
g=9.8

theta=(theta0-f*l/g)*cos(sqrt(g/l)*time)


figure(1)
plot(time,theta)
