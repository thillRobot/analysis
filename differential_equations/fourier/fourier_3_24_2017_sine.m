%% ME 3001 - Mechanical Engineeing Analysis
%
% Tristan Hill - 7/28/2014 - modified from Dr. Han
%
% Fourier Series Half Range Expansions
%% 

clear all
close all
clc

x_hr=0:0.1:2;
f_hr=x_hr;

x=-10:0.01:10;%create a range of x values


%calculate the Sigma Series part of the function

sum=0;% 
N=50
for n=1:N
    
    sum=sum+4/pi*((-1)^(n+1))/n*sin(n*pi*x/2);
      
end

% sum=sum; %multiply by constant part of bn

figure(1)    % show the result alone
plot(x,sum,'r');hold on
plot(x_hr,f_hr,'b')
title('The Fourier Series Sqaure Wave')
xlabel('x')
ylabel('y')
% axis([])
grid on

% sum=0;
% for i=1:n
%     
%     single=((-1)^i-1)/i^2*cos(i*pi*x/2);
%     sum=sum+single; %sum the series as you go 
%     
% end
% 
% sum=1+8/pi^2*sum; %add a0 and multiply by constant bn
% 
% figure(2)    % show the result alone
% plot(x,sum,'r')
% axis equal
% title('The Fourier Series Sqaure Wave')
% xlabel('x')
% ylabel('y')
% grid on
