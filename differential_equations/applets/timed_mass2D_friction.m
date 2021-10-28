
% TIMER CALLBACK CODE - MATLAB CENTRAL
% Sachitha Obeysekara:
% <SNIP has time in his/her mind...
% 
% one of the solutions using a timer callback is outlined 
% below
%%- note: use <stop(th)> BEFORE you delete the plot...
% this can be done in the command window
clear all
close all
clc

global prt
global t
global i

%initialize the falcon

global h 

h= haptikdevice;



fprintf('Falcon Initialized\n\n')
pos = read_position(h);

i=1;
t=0;
dt=.05;
tmax=10;

% prepare the plot
 axes('xlim',[-1000,1000],'ylim',[-1000,1000]);
%initial conditions
prt.vx(1)=0; 
prt.vy(1)=0; 
prt.xm=0;
prt.ym=0;
prt.mass=1.5;
prt.theta(i)=0;
prt.stopped=1;
% 
%   %find theta based on current and previous point    
%     theta(i+1)=atan((py(i+1)-py(i))/(px(i+1)-px(i)));
%     
%     %find the friction force in the X dir.
%     fricx=mu*Nf*cos(theta(i+1));      %N
%     ax=-Fx/mass; %constant m/s^2
% 
%     %find the friction force in the Y dir.
%     Fy=mu*Nf*sin(theta(i+1));      %N
 global lm
 lm=line(prt.xm,prt.ym,...
        'userdata',1,...
        'marker','.',...
        'color','red',...
        'markersize',5,...
        'linestyle','none');
 shg;   
% create the timer
 th=timer;
 set(th,...
    'timerfcn',@tFun2D,...
    'period',dt,...
    'executionmode','fixedrate');
% ...and start it

start(th);


% % clean up
% stop(th);
% delete(th);
% close(h)