%% ME3050 - simple P controller 
%
% Tristan Hill - December 04 2015 
%
%%

clear all
close all
clc

%% system parameters
m=15;
k=2;
c=5;

x1(1)=2;
x2(1)=0;

xref=-5;
kp=12;
f(1)=0;

%% numerical solution to the mass sping damper problem
dt=.01;
stime=0:dt:20;

for i=1:length(stime)

    x1_dot(i)=x2(i);
    x2_dot(i)=-c*x2(i)-k*x1(i)+f(i);
       
    x1(i+1)=x1(i)+x1_dot(i)*dt;
    x2(i+1)=x2(i)+x2_dot(i)*dt;
    
    xerr=xref-x1(i);
    f(i)=kp*xerr;
    
end

figure(1);hold on
plot(stime,x1(1:length(stime)),'r')
plot(stime,x2(1:length(stime)),'b')
plot(stime,x2(1:length(stime)),'b')

grid on