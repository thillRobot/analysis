 %% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014 
%
% 03/15/2019
% 2nd and 4th order Runga-Kutta methods
%
% Example 1 
%% 
clear variables
close all 
clc

% define constants first
m=10; % mass in (kg)
c=3;  % air resistance ( N/(m/s) ) or ( (N-s)/m )
f=2;  % motor force (constant) 

v0=5 % initial velocity (m/s)




% generate (x,y)<->(t,v) arrays to plot
tmin=0; tmax=20; dt=.1;
vmin=0; vmax=10;

% this is out 'theoretical solution'
t=tmin:dt:tmax; % time span
v=(v0-f/c)*exp(-c/m*t)+f/c;

% compare with built-in function 'ode45()' (numerical)
% ODE to solve: dy/dx=(1-x)y, initial condition y=1 at x=0
% to do this solve for the 'slope' meaning the first deriv.
slopeFun=@(t,v) (f-c*v)/m;
[t45,v45]= ode45(slopeFun,[tmin tmax],v0)


figure(1);hold on
plot(t,v)
plot(t45,v45)
axis([tmin tmax vmin vmax])
grid on
