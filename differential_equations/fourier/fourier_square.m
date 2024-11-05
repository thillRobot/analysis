%% ME 3001 - Mechanical Engineeing Analysis
%
% Tristan Hill - 7/22/2015 -03/20/2017 - 03/27/2024 - modified from Dr. Han
%
% Fourier Series Approximation of Square Wave
%% 

clear all
close all
clc

x=-2*pi:0.01*pi:2*pi;%range for expanded fn.
% x=-1.99*pi
B=10;% 1/2 height of wave

%calculate the Sigma Series part of the function
figure(1);hold on %allows plot overlay(multi curves)
N=100

sum=0; %initialize the sum
for n=1:N %Sigma Sum
    sum=sum+2*B/(n*pi)*(1-cos(n*pi))*sin(n*x);
end
f=sum;
plot(x,f)
grid on
xlabel('x')
ylabel('y')
   


