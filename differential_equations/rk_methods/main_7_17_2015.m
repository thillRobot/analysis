%% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014
%
% 2nd and 4th order Runga-Kutta methods
%
%% 

clear all
close all 
clc

dt1=.05; % independent variable step size
dte=.001; % timestep for exact curve
tmax=2;

t1=0:dt1:tmax;
te=0:dte:tmax;

y1(1)=1; %initial condition

c_1=1;   %unknown constant from initial condtion from y(1)=1 %cant use zero as index in matlab 
for i=1:length(te)
    ye(i) = c_1*exp(0.333333*te(i)^3-1.2*te(i));
end

% 2nd Order Runga Kutta - dt=.5
for i=1:length(t1)-1 
   k1=dt1*myF(t1(i),y1(i));
   k2=dt1*myF(t1(i)+dt1,y1(i)+k1);
   y1(i+1)=y1(i)+.5*k1+.5*k2;
end

plot(t1,y1);hold on
plot(te,ye)
