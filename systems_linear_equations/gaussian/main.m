%%
% ME 3001 - Mechanical Engineering Analysis
%
%%

clear all
close all 
clc

% Gaussian Elmination With Scaled Partial Pivoting 
% Also we will use pivoting index to avoid moving rows
% compare to method that moves rows if we have time

%% Test Matrix A
% N=10;
% Atest=hilb(N)*1000;
% rcond(Atest)
% btest=rand(1:N);

A=[ -15 10 5
   -5 -13 7
   13 4  2]

b=[10 ;12; 23];

ge_naive(A)

% A=partial_pivot(A)


% rcond(A) %check the system condition

% [A_red b_red]=ge_naive_nobacksub(A,b);


% x1=ge_naive(A,b)
% x2=ge_scaled_partial(A,b)
% 
% %% solve with built in matlab functions 
% 
% x3=inv(A)*b;
% x3'
% 
% x4=A\b;
% x4'
% 



















% %% solve with the symbolic toolbox
% syms x1 x2 x3 x4
% 
% e1=A(1,1)*x1+A(1,2)*x2+A(1,3)*x3+A(1,4)*x4-b(1);
% e2=A(2,1)*x1+A(2,2)*x2+A(2,3)*x3+A(2,4)*x4-b(2);
% e3=A(3,1)*x1+A(3,2)*x2+A(3,3)*x3+A(3,4)*x4-b(3);
% e4=A(4,1)*x1+A(4,2)*x2+A(4,3)*x3+A(4,4)*x4-b(4);
% 
% sol=solve(e1,e2,e3,e4);
% eval(sol.x1)
% eval(sol.x2)
% eval(sol.x3)
% eval(sol.x4)
