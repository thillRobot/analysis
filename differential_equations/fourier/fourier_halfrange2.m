%% ME 3001 - Mechanical Engineeing Analysis
%
% Tristan Hill - 7/28/2014 - modified from Dr. Han
%
% Fourier Series Half Range Expansions
%% 

clear all
close all
clc

x=-20:0.01*pi:20;%create a range of x values
sum=0; %initialize the sum

%calculate the Sigma Series part of the function
n=100;
B=10;  %height of the wave  

a0=50/3;


P=5;
for i=1:n
    
    
    single=(-1)^i/i^2*cos(i*pi*x/P);
    
    sum=sum+single; %sum the series as you go 
    
end

sum=P^2/3+4*P^2/pi^2*sum; %add 'a0' and multiply by constant part of 'an'

figure(1)    % show the result alone
plot(x,sum,'r')
title('The Fourier Series Sqaure Wave')
xlabel('x')
ylabel('y')
axis equal
grid on
    
sum=0;
for i=1:n
    
    single=(2-pi^2*i^2*cos(pi*i)+2*pi*i*sin(pi*i)-2)*sin(i*pi*x/2)/i^3;
    sum=sum+single; %sum the series as you go 
    
end

sum=2*P^2*sum; %multiply by bn

figure(2)    % show the result alone
plot(x,sum,'r')
axis([-10 10 -50 50])
title('The Fourier Series Sqaure Wave')
xlabel('x')
ylabel('y')
grid on
