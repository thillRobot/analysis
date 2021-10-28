%% ME 3001 - Mechanical Engineeing Analysis
% 
% Tristan Hill - 6/22/2014 
%
% 1D Heat Equation - Finite Diff. Approx 
% for the Radiation problem the ode is non linear 
% so we need 'relaxation approach'
%
%% 
close all; clear all; clc

% mynonlinheat ( lacks comments )
% Purpose :
L = .3; %
n = 50; %
h = L/n ; %

d=.1/100;%dia(m)
k=200; %(w/(m*K))
e=0.9;
p=pi*d;
sig=5.670373e-8;
Ac=pi*d^2/4;

alpha=p*sig*e/(Ac*k)

hh = h ^2/3; %
u0 = 100+273; %
uL = -10+273; %
ub = -10+273; %
ub4 = ub ^4; %
x = 0: h :L ; %
g = sin (pi*x /4); %
% u = ones(1 , n +1)*273; %
steps = 100; %
% u(1)= u0 ; %
% u(n+1)= uL ; %


figure(1);hold all
u_prev=[u0 ones(1,n)*263];
for j = 1: steps
    u=u_prev
    for i=2:n     
        u(i) = (u(i+1) +u(i)+ u (i-1))/3 - alpha*h^2/3*( u(i)^4- ub^4 );
        u_prev=u;
    end
    plot (x , u)
 
end
figure(2)
plot(x , u)

