%% ME3050 - Dynamics, Modeling, and Control
% Tristan Hill - 09/18/2015
% 1DOF lumped parameter model (mass+spring) 
%%
% using the...
% TIMER CALLBACK CODE - MATLAB CENTRAL
% 
%%

clear all
close all
clc

%define timer function params
p.j=1;
p.t=0;
p.dt=.1;
%define the model parameters (as global vars)
g=9.8;  %m/s^2
% m=100;    %mass of mass (kg)
% k=200;    %spring constant (N/m)
%initial conditions (as global vars)

p.g=g;

p.m=100;
p.k=200;
p.c=20;

p.x0=0;
p.xdot0=0;
p.y0=10;
p.ydot0=0;
p.wn=sqrt(p.k/p.m);


p.dr=p.c/(2*sqrt(p.m*p.k));

p.wd=p.wn*sqrt(1-p.dr^2);

figure(1)

% prepare the plot
axes('xlim',[-10,20],'ylim',[-10,20]);

l=line(p.t,p.y0,...
    'userdata',0,...
    'marker','.',...
    'color','black',...
    'markersize',5,...
    'linestyle','-');

%draw a box
p.bht=5;
p.bwt=3;
p.bps=-5;
px=[0 p.bwt p.bwt 0]+p.bps;
py=[0 0 p.bht p.bht]+p.y0;
% 
box=patch(px,py,'red',...
    'userdata',0,...
    'marker','none',...
    'linestyle','-');
shg;   

th=timer;
th.TimerFcn={@model_mck,p,l,box};
th.StopFcn={@model_mk_stop};
set(th,...
    'period',p.dt,...
    'TasksToExecute', 150,...
    'executionmode','fixedrate');
% ...and start it
input('Press any Key to Start')

start(th);
% while strcmp(get(th,'Running'),'on');end
% delete(th);

% while(t<tmax);
% end
%    
% % clean up
% stop(th);
% delete(th);
% close(h)