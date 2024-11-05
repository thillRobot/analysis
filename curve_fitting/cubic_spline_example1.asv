% cubic spline interpolation
% ME3001, TNTech
% Tristan Hill, November 4, 2024
% method and notation is from Applied Numerical Methods with MATLAB,
% Chapra and Canale 6th

clear; clc; close all

% example from pg 482
h1=1.5 % x steps
h2=2.5
h3=2.0

x1=3.0 % x values
x2=4.5
x3=7.0
x4=9.0

f1=2.5 % y values
f2=1.0
f3=2.5
f4=0.5

A=[1, 0, 0, 0    % coefs matrix to solve for the Cs
   h1, 2*(h1+h2), h2, 0
   0,  h2, 2*(h2+h3), h3
   0,  0,         0,  1]
b=[0             % knowns   
   3*(fdiff(f3,f2,x3,x2)-fdiff(f2,f1,x2,x1))
   3*(fdiff(f4,f3,x4,x3)-fdiff(f3,f2,x3,x2))
   0]
c=inv(A)*b

% basic finite difference method
function df=fdiff(fi,fj,xi,xj)
    df=(fi-fj)/(xi-xj);
end