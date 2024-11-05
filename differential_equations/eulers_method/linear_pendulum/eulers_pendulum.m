% ME3001 - Tennessee Technological University
% Tristan Hill - March 03, 2024
% Euler's Integration
clear variables;clc;close all

time=0:.0001:10;
dtr=pi/180;
theta0=25*dtr; 
f=5;
l=0.35;
g=9.8;

% analytical solution derived in class notes
theta=(theta0-f*l/g)*cos(sqrt(g/l)*time);

x0=theta0;
xdot0=0;
z1(1)=x0;
z2(1)=xdot0;
dt=.0001
time(1)=0;

figure(1)
plot(time,theta)

for i=1:100000

    z1(i+1)=z1(i)+f1(z2(i))*dt;
    z2(i+1)=z2(i)+f2(z1(i),f,l,g)*dt;
    time(i+1)=time(i)+dt;

end

x=z1;
xdot=z2;

% x_analytical=1/9*(3*time+2*exp(-3*time/2)+7)
% xdot_analytical=1/3-3*exp(-3*time/2)+C1

figure(2); hold on
subplot(2,1,1); hold on
% plot(x)
plot(time(1:length(x)),x)
% plot(time,x_analytical)

% subplot(2,1,2); hold on 
% plot(time,xdot)
% plot(time,xdot_analytical)


% slope funs below

function [z1dot] = f1(z2)

    z1dot=z2;

end

function [z2dot] = f2(z1,f,l,g)

    z2dot=f-g/l*z1;

end