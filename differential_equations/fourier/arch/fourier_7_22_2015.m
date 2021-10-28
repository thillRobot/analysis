%% ME 3001 - Mechanical Engineeing Analysis
%
% Tristan Hill - 7/22/2015 - modified from Dr. Han
%
% Fourier Series Approximation of Square Wave
%% 

clear all
close all
clc

x=-3*pi:0.01*pi:3*pi;%range for expanded fn.

B=13.2;% 1/2 height of wave

%calculate the Sigma Series part of the function
figure(1);hold on %allows plot overlay(multi curves)
N=100

sum=0; %initialize the sum
for i=1:N %Sigma Sum
    sum=sum+2*B/pi*(1/i)*(1-(-1)^i)*sin(i*x);
end
f=sum;
plot(x,f)
grid on
xlabel('x')
ylabel('y')
   


