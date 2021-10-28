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

%% define the program parametetr
%timer function params
p.j=1;
p.t=0;
p.dt=.01;
p.tstop=15;
% system model parameters (as global vars)
p.g=9.8;  %m/s^2

p.m=15;
p.k=2;
p.c=1;

p.wn=sqrt(p.k/p.m);
p.dr=p.c/(2*sqrt(p.m*p.k));
p.wd=p.wn*sqrt(1-p.dr^2);

p.x1_0=2; %state variables, initial values
p.x2_0=0;

% control sytem params 
p.f=0; %actuator input
p.xref=3;
p.kp=12;

%% prepare the plot
figure(1)
axes('xlim',[-5,15],'ylim',[-5,5]);
grid on

%draw a box
p.bht=1;
p.bwt=1;
p.bps=-3;
px=[0 p.bwt p.bwt 0]+p.bps;
py=[0 0 p.bht p.bht]-p.bht/2+p.x1_0;
% 
box=patch(px,py,'red',...
    'userdata',0,...
    'marker','none',...
    'linestyle','-');

%draw a few lines 
l1=line(p.t,p.x1_0,...
    'userdata',0,...
    'marker','.',...
    'color','red',...
    'markersize',2,...
    'linestyle','-');

l2=line(p.t,p.x2_0,...
    'userdata',0,...
    'marker','.',...
    'color','blue',...
    'markersize',2,...
    'linestyle','-');
% 
% l2=line([-5+p.bwt/2 p.t],[p.y0 p.y0],...
%     'userdata',0,...
%     'marker','o',...
%     'color','black',...
%     'markersize',2,...
%     'linestyle',':');

shg;   

%% setup the timer function
th=timer;
th.TimerFcn={@model_mck_12_03_2015,p,l1,l2,box};
th.StopFcn={@model_stop};
set(th,...
    'period',p.dt,...
    'TasksToExecute', round(p.tstop/p.dt),...
    'executionmode','fixedrate');
% ...and start it
input('Press any Key to Start')

start(th);
% % while strcmp(get(th,'Running'),'on');end
% % delete(th);
% 
% % while(t<tmax);
% % end
% %    
% % % clean up
% % stop(th);
% % delete(th);
% close(h)