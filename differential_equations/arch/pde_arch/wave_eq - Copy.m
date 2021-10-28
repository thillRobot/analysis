%% ME 3001 - Mechanical Engineering Analysis
%
% Tristan Hill - Modified from Dr. Han - summer 2014
%                Modified again        - spring 2015
%                Modified again to be wave eq   
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

c=9 %wave speed

plotY=[]; %store T for ploting afterwards

prof_inc=1; %time between temp profiles

dt=.1;
tfinal=10;
idx=1;

for t=0:dt:tfinal
    sum=0;
    
    for k=1:100
        sum=sum+((-1)^(k-1))/(2*k-1)^2*sin((2*k-1)*x)*cos(3*(2*k-1)*t);
    end
    
    Y=sum*4/pi%*(pi/2)
    
%     if t==0
%         plotY=[plotY; Y]; %initial temp
%         isave=1;
%     end
%     
%     if mod(idx,prof_inc)==0   %plot the temp profile every 50 timesteps
%         plotY=[plotY; Y]; %save T
%     end    
     
    plot(x,Y)
    axis([0 4 -4 4])
    axis equal
    pause(.2)
    idx=idx+1;
end




