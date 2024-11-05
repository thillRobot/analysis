%% ME 3001 - Mechanical Engineeing Analysis
%
% Tristan Hill - 7/28/2014 - 03/27/2024 - modified from Dr. Han
%
% Fourier Series Half Range Expansions
%% 

clear all
close all
clc

x=-10:0.01*pi:10;%create a range of x values
sum=0; %initialize the sum

%calculate the Sigma Series part of the function
n=50;
B=10;  %height of the wave  

a0=50/3;


p=5
for i=1:n
    
    
    single=-2*cos(i*pi)/i*sin(i*pi*x/2);
    
    sum=sum+single; %sum the series as you go 
    
end

sum=sum; %multiply by constant part of bn

figure(1)    % show the result alone
plot(x,sum,'r')
title('The Fourier Series Saw Tooth Wave')
xlabel('x')
ylabel('y')
axis equal
grid on

sum=0;
for i=1:n
    
    single=((-1)^i-1)/i^2*cos(i*pi*x/2);
    sum=sum+single; %sum the series as you go 
    
end

sum=1+8/pi^2*sum; %add a0 and multiply by constant bn

figure(2)    % show the result alone
plot(x,sum,'r')
axis equal
title('The Fourier Series Saw Tooth Wave')
xlabel('x')
ylabel('y')
grid on
