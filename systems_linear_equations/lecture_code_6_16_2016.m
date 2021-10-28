

% Solving a sytem of lin eqs
clear variables;clc;close all


A=[-1 1 0 -1 1 0
   -1 0 0 -3 10 0
   0 0 -1 1 0 1
   0  0  0 0 0 9
   1 0 1 0 0 0
   0 0 2 0 0 0 ];

b= [ 0 ; 0 ; 200 ; 1400 ; 100 ; 100]; 

x=inv(A)*b
x=A\b
