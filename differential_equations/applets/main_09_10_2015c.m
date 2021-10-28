%% ME3050 - Dynamics, Modeling, and Control
% Tristan Hill - 09/10/2015
% 1DOF lumped parameter model (mass+damper) 
%%
% using the...
% TIMER CALLBACK CODE - MATLAB CENTRAL
% Sachitha Obeysekara:
%%

clear all
close all
clc

i=1;
t=0;
dt=.05;
tmax=10;

%define the model parameters
m=10;    %mass of mass (kg)
k=45;    %spring constant (N/m)
% c=2;   %damping coefficient (N/m/s)
g=9.8;  %m/s^2
l=.02;     %unstrectched length of spring (m)
y0=5;
v0=0; 
yh=y0;
vy=v0; 
%initial conditions

%find c based on damping ratio
dr=.5;   %underdamped 
% dr=1;  %critically damped
% dr=2;  %overdamped
c=dr*2*sqrt(m*k);

A=1;
C=1*y0/m;
B=15;

% prepare the plot
 axes('xlim',[-2,5],'ylim',[-2,5]);
 
 lh=line(t,y0,...
        'userdata',0,...
        'marker','.',...
        'color','red',...
        'markersize',5,...
        'linestyle','none');
    
  px=[0 .5 .5 0]-1;
  py=[0 0 .5 .5];
  pp=patch(px,py,'red',...
        'userdata',0,...
        'marker','.',...
        'markersize',5,...
        'linestyle','none');
    
  
 shg;   
% prepare a simple timer update function
 tfun=[
        't=[t t(i)+dt];'...  
        'yh=[yh y0+C*exp(-A*(t(i)))*sin(B*t(i))];'...
        'ay=10;'...
        'vy(i+1)=vy(i)+ay*dt;'...
        'py=[0 0 .5 .5]+yh(i);'....
        'set(lh,''ydata'',yh);'...
        'set(lh,''xdata'',t);'...
        'set(pp,''xdata'',px);'...
        'set(pp,''ydata'',py);'...
        't(i)=t(i)+dt;'...
        'i=i+1;'...
 ];
% create the timer
 th=timer;
 set(th,...
    'timerfcn',tfun,...
    'period',dt,...
    'executionmode','fixedrate');
% ...and start it

start(th);

% while(t<tmax);
% end
%    
% % clean up
% stop(th);
% delete(th);
% close(h)