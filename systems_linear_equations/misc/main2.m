%% 
% ME 3001-001 , Tristan Hill, 6/9/2014, Summer 2014
%
% Systems of Simulataneous Linear Equations 
%
% Round off Error Examples
%% 
clear all
close all

xmin=-5;
xmax=5;
xstep=.1;

x=xmin:xstep:xmax;

y1=(3-x)/.001;

y2=5-2.*x;

figure(1); hold on
plot(x,y1,'r')
plot(x,y2,'b')

y1=3-.001.*x;
y2=(x-5)/-2;

figure(2); hold on
plot(x,y1,'r')
plot(x,y2,'b')
