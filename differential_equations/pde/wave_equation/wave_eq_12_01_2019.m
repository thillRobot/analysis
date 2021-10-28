%% ME 3001 - Mechanical Engineering Analysis
%
% Tristan Hill - Modified from Dr. Han - summer 2014
%                Modified again        - spring 2015
%                Modified again to be wave eq   
%                Once again in Fall 2019 - TWH
%
% Solving Linear, 2nd order Partial Differential Equations
%   using Separation of Variables and the Fourier Series 
%
% Example: A plucked string , the wave equation
%% 

% symetric boundary condition 

clc
close all
clear all

L=pi; %length of solid
n=50;%number of divisions
dx=L/n;%increment of x dimension,(m) 
x=0:dx:L;%x-coordinate

c=9; %wave speed

plotY=[]; %store T for ploting afterwards

prof_inc=1; %time between temp profiles

dt=.1;
tfinal=10;
time=0:dt:tfinal;

for idx=1:length(time)   
    
    sum=0;
    
    for k=1:10
        sum=sum+((-1)^(k-1))/(2*k-1)^2*sin((2*k-1)*x)*cos(3*(2*k-1)*time(idx));
    end
    
    Y=sum*4/pi%*(pi/2)
     
    plot(x,Y)
    axis([0 2 -2 2])
    axis equal
    pause(.1)

end
