%% ME 3001 - Mechanical Engineeing Analysis
% 
% Tristan Hill - 6/22/2014 - 11/13/2017
%
% 1D Heat Equation - Finite Diff. Approx 
% for the Radiation problem the ODE is Non-Linear 
% so we need 'relaxation approach'
%
%% 
close all; clear all; clc

L = 1; %
n = 500; %
h = L/n ; %

d=.1/100;%dia(m)
k=200; %(w/(m*K))
e=0.9;
p=pi*d;
sig=5.670373e-8;
Ac=pi*d^2/4;

% alpha=1;% 
alpha=p*sig*e/(Ac*k)

u0 = 5; %
uL = 20; %
ub = 30; %

x = 0: h :L ; %
% g = sin (pi*x /4); %

u = ones(1 , n)*ub; %
u(1)= u0 ; %
u(n)= uL ; %


figure(1);hold all
steps = 1000; 
for j = 1: steps
    
    for i=2:n-1     
        u(i) = (u(i+1) +u(i)+ u (i-1))/3 - alpha*h^2/3*( u(i)^4- ub^4 );
    end
    plot(x(1:length(u)) , u)
 
end
figure(2)
plot(x(1:length(u)) , u)

