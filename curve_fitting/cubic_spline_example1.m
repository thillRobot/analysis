% cubic spline interpolation
% ME3001, TNTech
% Tristan Hill, November 4, 2024
% method and notation is from Applied Numerical Methods with MATLAB,
% Chapra and Canale 6th

clear; clc; close all

% example from pg 482
% define x values
x=[3.0, 4.5, 7.0, 9.0]
n=length(x); 

% calculate h values (x steps)
for i=1:n-1
    h(i)=x(i+1)-x(i);
end
h

% define function values (y)
f=[2.5, 1.0, 2.5, 0.5]

% equation 18.27 (tri-diagonal matrix system)
A_tridiag=[1, 0, 0, 0    % coefs matrix to solve for the Cs
   h(1), 2*(h(1)+h(2)), h(2), 0
   0,  h(2), 2*(h(2)+h(3)), h(3)
   0,  0,         0,  1]
b_tridiag=[0             % knowns   
   3*(fdiff(f(3),f(2),x(3),x(2))-fdiff(f(2),f(1),x(2),x(1)))
   3*(fdiff(f(4),f(3),x(4),x(3))-fdiff(f(3),f(2),x(3),x(2)))
   0]

c=inv(A_tridiag)*b_tridiag % solve for the Cs of all eqs simulaneously

% solve for each b and each d
for i=1:n-1
    b(i)=(f(i+1)-f(i))/h(i)-h(i)/3*(2*c(i)+c(i+1))
    d(i)=(c(i+1)-c(i))/(3*h(i))
end

a=x
% the as are known as the xs


















































% basic finite difference method
function df=fdiff(fi,fj,xi,xj)
    df=(fi-fj)/(xi-xj);
end