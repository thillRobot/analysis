%% ME 3023 - The Fourier Series
%
% Tristan Hill - 7/28/2014 - 09/21/2020
%
% Fourier Series Approximation of Saw Tooth Wave
%% 

clear all
close all
clc

figure(1);hold on
x=-5*pi:0.01*pi:5*pi;
sum=0; %initialize the sum

%calculate the Sigma Series part of the function
n=100;
sum=0
    
for i=1:n
    
    sum=sum+(1-cos(i*pi))*sin(i*x)/i
    B=4
    g=(1-cos(i*pi))*sin(i*x)/i*2*B/pi
    f=sum*2*B/pi; %multiply by bn
    
    
% plot(x,g)
    
grid on
%     pause
end

plot(x,f)
 

xlabel('x')
ylabel('y')
