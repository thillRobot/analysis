%% ME 3001 
%
%  Tristan Hill
%% Using the Symbolic Toolbox

clear all
close all
clc

%% example 1 - quadratic equation
% a=sym('a')
% b=sym('b')
% c=sym('c')
% 
% x=sym('x')
% 
% e1=a*x^2+b+x+c;
% 
% s=solve(e1,'x')

%% example 2 - some basic calculus 
% x=sym('x')
% y=sym('y')
% z=sym('z')
% 
% e1=cos(x)+2*sin(y)/5+z^2*sin(z)
% 
% e1p=diff(e1,'z')
% 
% e1=int(e1p,'z')

%% example 3- solve a system of linear equations - hw6
% syms c1 c2 c3
% Q33=120;
% Q13=40;
% Q12=80;
% Q23=60;
% Q21=20;
% 
% e1=500+Q21*c2-Q12*c1-Q13*c1
% e2=Q12*c1-Q21*c2-Q23*c2 
% e3=200+Q13*c1+Q23*c2-Q33*c3

% s=solve(e1,e2,e3)

