%% ME3050 - Dynamics, Modeling, and Control
% Tristan Hill - 09/10/2015
% 1DOF lumped parameter model (mass+spring) 
%%
% using the...
% TIMER CALLBACK CODE - MATLAB CENTRAL
% Sachitha Obeysekara:
%%

clear all
close all
clc


tmax=10;

%define timer function params
i=1;
t=0;
dt=.05;
%define the model parameters (as global vars)
g=9.8;  %m/s^2
m=10;    %mass of mass (kg)
k=45;    %spring constant (N/m)
%initial conditions (as global vars)
x0=5;    %init pos
xdot0=0; %init vel

p.g=g 
p.m=m 
p.k=k
p.x0=x0 
p.x0dot=xdot0 

% prepare the plot
axes('xlim',[-2,5],'ylim',[-2,5]);

l=line(t,x0,...
    'userdata',0,...
    'marker','.',...
    'color','red',...
    'markersize',5,...
    'linestyle','none');

p.l=l

px=[0 .5 .5 0]-1;
py=[0 0 .5 .5];

pp=patch(px,py,'red',...
    'userdata',0,...
    'marker','.',...
    'markersize',5,...
    'linestyle','none');
shg;   

th=timer;
set(th,...
    'timerfcn',@model_mk,...
    'period',dt,...
    'executionmode','fixedrate',...
    'userdata',p);
% ...and start it

start(th);

% while(t<tmax);
% end
%    
% % clean up
% stop(th);
% delete(th);
% close(h)