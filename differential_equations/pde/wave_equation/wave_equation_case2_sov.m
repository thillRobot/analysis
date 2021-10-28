%% ME 3001 - Mechanical Engineering Analysis
%
% Tristan Hill - Modified from Dr. Han - summer 2014
%                Modified again        - spring 2015
%                Modified again to be wave eq   
%                Once again in Fall 2019 - TWH
%
%   Solving Linear, 2nd order Partial Differential Equations
%   using Separation of Variables and the Fourier Series 
%
% Example: A plucked string, the wave equation
%% 

clc
close all
clear variables

L=pi; %length of solid
n=100;%number of divisions
dx=L/n;%increment of x dimension,(m) 
x=0:dx:L;%x-coordinate

% wave speed
c=9;
a=sqrt(c);
h=1.0;

dt=.05;
tfinal=10;
time=0:dt:tfinal;

for idx=1:length(time)    
    
    sum=0;
    for n=1:10
        if n~=4
            sum=sum+h/pi*(sin((1-n/4)*pi)/(4-n)-sin((1+n/4*pi))/(4+n))*sin(n*pi*x/L)*cos(a*n*pi/L*time(idx));
        end
    end
    
    Y=sum+h/4*sin(4*pi*x/L)*cos(4*a*pi/L*time(idx));
      
    plot(x,Y,'*')

    axis equal
    axis([0 L -4 4])
    pause(.1)
    
    
end


