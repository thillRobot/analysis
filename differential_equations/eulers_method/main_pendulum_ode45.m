%% ME3001 - Mech. Engr. Analysis
%
%  Tristan Hill - 7/24/2014 - 04/05/2017
%
%  Systems of ODEs - Pendulum Problem - 
%%
clc
clear all;
close all;

m=2;g=9.8;l=42*(1/100)
%uo=50*pi/180; %u=theta
vo=0; %let v = d(theta)/dt =du/dt
c=1; %drag

%define the system of 2 ODEs
ode_sys=@(t,u) [u(2)
                -g/l*sin(u(1))-c*u(2)]

%define the initial conditions (r(0) ,dr(0)/dtau, theta(0), d theta(0)/dtau) 
initcond=[50*pi/180,0]

% colors=['r*';'b*';'g*'];          
time=0:0.1:10; %setup the independent variable 

[t45,x45]=ode45(ode_sys,[0 10],initcond);

figure(2);hold on
plot(t45,x45(:,1),'g')
plot(t45,x45(:,2),'b')
title('ODE 45')
legend('Angular Velocity','Angular Position')

