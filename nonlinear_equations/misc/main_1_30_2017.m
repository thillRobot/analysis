%stuff here
clear variables;clc;close all

m1=.5;
m2=-1;
b1=6;
b2=8;
A=[-m1, 1
   -m2, 1];
B=[b1
   b2];
x=inv(A)*B
