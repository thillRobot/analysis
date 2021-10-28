%% ME 3001 - Mechanical Enigineering Analysis
%
%  Tristan Hill - 6/24/2014
%
%  Finite Difference Method 
%  Example Problem - solve a 2nd order Linear ODE 
%  solve w fin. diff and compare to exact solution
%
%%
close all
clear all
clc

n =5; % number of values in function 
x=linspace(0,1,n); 
h=x(2)-x(1); % distance between x values , remains constant
y=zeros(size(x));

% compute value at intitial condition
y(1)=1;
y(2)=y(1)*(1-h^2);

for i=2:n-1
    y(i+1)=((2*y(i)-y(i-1))/h^2 + 3*y(i-1)/(2*h) -2*y(i) )/(1/h^2+3/(2*h));
    
end

ye=2*exp(-x)-exp(-2*x);

figure(1)
plot(x,ye,'r',x,y,'b')


