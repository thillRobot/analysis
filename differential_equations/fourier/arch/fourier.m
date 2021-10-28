%% ME 3001 - Mechanical Engineeing Analysis
%
% Tristan Hill - 7/28/2014 - modified from Dr. Han
%
% Fourier Series Approximation of Saw Tooth Wave
%% 

clear all
close all
clc

x=-3*pi:0.01*pi:3*pi;
sum=0; %initialize the sum

%calculate the Sigma Series part of the function
n=50;
    
for i=1:n
    sum=sum+(-2/i)*cos(i*pi)*sin(i*x);
end

f=sum; %multiply by bn 

plot(x,f)
grid on
xlabel('x')
ylabel('y')
