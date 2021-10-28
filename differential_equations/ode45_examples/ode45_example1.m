%% ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - modified from Dr. Han - 7/21/2014 - updated 10/28/2020
% Using ODE45 to find numerical solutions to ODEs
% ODE45 Example 1 - ice cube problem - 'free' first order model with friction
%% 

clear variables
close all         % close figures
clc

%% analytical answer from separation of variables
tau=2.2;  % set our parameters (constants)
v0=3;
dt=.025; % independent variable step size

tmin=0; % choose bounds
tmax=5;
time_SOV=tmin:dt:tmax; % make an array for IV values 
               
% calculate an array of dependent variable values using the derived solution
vel_SOV=v0*exp(-time_SOV/tau); 

%% compare with numerical solution from ode45

opts=optimset('Display','iter'); % set some options for the solver

[time_ODE45,vel_ODE45]= ode45(@slope_fn,[tmin tmax],v0,opts,tau);

%% show both solutions in a figure

figure(1); hold on
plot(time_SOV,vel_SOV,'r')
plot(time_ODE45,vel_ODE45,'g:*')
title('Solution to ODE')
xlabel('time(s)')
ylabel('velocity(m/s)')
legend('Separation of Variables','ODE45')
grid on
 
%% define a function to describe the ODE ( y'=f(t,y) )

% t,v are passed in by the magic behind the scenes
% that happens when you call ODE45 (little green people)

% TAU is shown in caps just to prove that the value
% is copied in and this variable has local scope

function dv = slope_fn(t,v,TAU)
                
    dv=-v/TAU;  % this is the ODE in the form y'=f(t,y)
                    
end













