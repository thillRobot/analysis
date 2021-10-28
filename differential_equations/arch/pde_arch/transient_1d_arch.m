%% ME 3001 - Mechanical Engineering Analysis
%
% Tristan Hill - Modified from Dr. Han
%
% Solving Linear, 2nd order Partial Differential Equations
%   using Separation of Variables and the Fourier Series 
%
% Example: 1D Transient Conduction
%% 

clc
close all
clear all

L=2; %length of solid
n=40;%number of divisions
dx=L/n;%increment of x dimension,(m) 
x=0:dx:L;%x-coordinate

k=400; %conductivity of copper (wire)
cp=400; %specific heat
ro=8000; %density
alpha=sqrt(k/(ro*cp));

M=10; %inital temp

plotT=[]; %store T for ploting afterwards

dt=10;
for t=0:dt:2000
    sum=0;
    for n=1:100
        sum=sum+(1/n)*(1-cos(n*pi))*sin(n*pi*x/L)*exp(-(alpha*n*pi/L)^2*t);
    end
    
    T=2*M/pi*sum;
    
    if t==0
        plotT=[plotT T']; %initial temp
        isave=1;
    end
    
    if isave==50
        plotT=[plotT T']; %save T
        isave=1;%reset the save counter
    else
        isave=isave+1;
    end
    
end

plot(x,plotT)
xlabel('x')
ylabel('T')
grid on