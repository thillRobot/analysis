%% ME 3001 - Mechanical Engineeing Analysis
%
% Tristan Hill - 7/28/2014 - modified from Dr. Han
%
% Fourier Series Approximation of Saw Tooth Wave
%% 

clear all
close all
clc

x=-10*pi:0.01*pi:10*pi;
sum=0; %initialize the sum

%calculate the Sigma Series part of the function
n=100;
sum=0
    
for i=1:n
    sum=sum+(1-cos(i*pi))*sin(i*x)/i
    B=4
    f=sum*2*B/pi; %multiply by bn
    
plot(x,f)
grid on
    pause
end

 

xlabel('x')
ylabel('y')
