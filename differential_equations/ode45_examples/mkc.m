%% ME3001-001 Mechanical Engineering Analysis
%
% Tristan Hill 7/9/2014
%
% Solving Ordinary Differential Equations 
% and Modeling Mechanical Systems
%
% Mass - Spring - Damper - Free Damped Vibration 
%%
clc; clear all; close all

% define the system parameters
m=10; %kg 
k=20; %N/m
c=20; %N*s/m
% check damping condition 
if c^2-4*m*k < 0 
    disp('Underdamped')
elseif c^2-4*m*k > 0
    disp('Overdamped')
else
    disp('Critically Damped')
end

beta=sqrt(abs(c^2-4*m*k))/(2*m); %roots of char. eq. alpha+beta*i
alpha=(-c/(2*m));

x_o=2; % initial conditions
v_o=5;

c1=x_o; 
c2=(v_o-c1)/beta;

n=100; % setup independent variable
tmax=20;
t=linspace(0,tmax,n);

for i=1:n  %compute the solution (underdamped only)
    x(i)=exp(alpha*t(i))*(c1*cos(beta*t(i))+c2*sin(beta*t(i)));

end

figure(1);hold on
plot(t,-x,'r')
% plot(t,x_d,'b')