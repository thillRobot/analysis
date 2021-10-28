%% ME 3001 - Mechanical Engineeing Analysis
% 
% Tristan Hill - 6/22/2014 - 04/12/2017
%
% 1D Heat Equation - Finite Diff. Approx 
% leads to a Tridiagonal System - solve with TMDA
% Problem from Chapra - Applied Numerical Methods w/ MATLAB
%
%% 
close all; clear variables; clc

L = 10;     %length of the bar in meters
n = 1000;    %number of nodes in bar
dx = L/n;   %length of a node
x0 = 0;     %location of first node
y0 = .5;
h = .3;     %height of bar
hp  = .05;  %heat transer coeff (m^-2)
T0=0;
Tn=180;
Ta=350;
a=2+hp*dx^2;
b=hp*dx^2*Ta;


%% Solve the System with Naive Gaussian ELimination
% Set Up the Tri-Diagonal Matrix
A(1,1)=a;
A(1,2)=-1;
for i=2:n-1 
    for j=i-1:i+1       
        if j==i
            A(i,j)=a;
        else
            A(i,j)=-1; 
        end     
    end   
end
A(n,n)=a;
A(n,n-1)=-1;

% Set up the vector of knowns
B=ones(n,1)*b;
B(1)=b+T0;
B(n)=b+Tn;

[m,n]=size(A);

%% Solve the System with  
tic
T_GE=ttu_GE(A,B);
toc

%% Solve the System with the Thomas alorithm (TDMA)

tic
T_TDMA=ttu_TDMA(A,B);
toc
   
%% Solve the System with back Divide

tic
T_BD=A\B;
toc

%% Solve with the Matrix Inverse

tic
T_INV=inv(A)*B;
toc

%% Draw a fancy picture
figure(1);hold on

plot(T_GE,'b*')
plot(T_TDMA,'r')
plot(T_BD,'go') 
plot(T_INV,'cd') 
