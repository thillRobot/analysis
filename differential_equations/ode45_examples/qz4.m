%% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014
%
% Euler's and Crank-Nicolson Runga-Kutta methods
%
% Example 1 
%% 

clear all
close all 
clc

% ODE to solve: dy/dx=(1-x)y, initial condition y=1 at x=0
slopeFun=@(x,y) x^5*exp(2*x)+(3/x)*y;

h=0.1; %independent variable step size
xmin=1;
xmax=1.3;
x=xmin:h:xmax; %range of independent variable values

y(1)=2; %initial condition (crank nicolson)
y_eu(1)=2; %initial condition (eulers)


ye=exp(x-x.^2/2); %exact solution 

%% Euler's Method

for i=1:length(x)-1
   y_eu(i+1)=y_eu(i)+slopeFun(x(i),y_eu(i))*h; 
end

subplot(1,2,1)
plot(x,y,'x',x,ye)
title('dy/dx=(1-x)y')
legend('Euler','exact')
xlabel('x');ylabel('y')




