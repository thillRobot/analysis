%% ME 3001 - MEA
% Homework 5 solution - Roots of Non-Linear Functions
% Tristan Hill 

clear all
close all
clc

param.v=5;
param.t=3;
param.g=9.8;
param.l=5;

%plot the figure 
figure(1)
x_plot=0:.1:10;
for k=1:length(x_plot)
    y_plot(k)=vfun(x_plot(k),param);
end
plot(x_plot,y_plot);hold on

option.xmin=0;
option.xmax=10;
option.x0=0;
option.del=.1;
option.tol=.001;
option.paus=99;
option.plt=1;
option.prnt=1;

myBisection(@vfun,param,option)











param.v=5;
param.t=3;
param.g=9.8;
param.l=10;

option.xmin=0;
option.xmax=10;
option.x0=0;
option.del=.1;
option.tol=.001;
option.paus=0;
option.plt=0;
option.prnt=1;

myBisection(@vfun,param,option)

param.v=10;
param.t=2;
param.g=9.8;
param.l=5;

option.xmin=0;
option.xmax=10;
option.x0=0;
option.del=.1;
option.tol=.001;
option.paus=0;
option.plt=0;
option.prnt=1;

myBisection(@vfun,param,option)
