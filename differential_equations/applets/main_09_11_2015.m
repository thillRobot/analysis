%% ME3050 - Dynamics, Modeling, and Control
% Tristan Hill - 09/10/2015
% 1DOF lumped parameter model (mass+damper w/ init vel) 
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
c=2;   %damping coefficient (N/m/s)

%initial conditions
x0=0;
v0=3;
x=x0;

B=v0*m/c;


% prepare the plot
 axes('xlim',[-1,10],'ylim',[-1,10]);
 
%  lh=line(t,y0,...
%         'userdata',0,...
%         'marker','.',...
%         'color','red',...
%         'markersize',5,...
%         'linestyle','none');
    
  px=[0 5 5 0];
  py=[0 0 5 5];
  pp=patch(px,py,'red',...
        'userdata',0,...
        'marker','.',...
        'markersize',5,...
        'linestyle','none');
    
  
 shg;   
% prepare a simple timer update function
 tfun=[
        't=[t t(i)+dt];'...  
        'x=[x B*exp(-c/m*t(i))];'...
        'px=[0 5 5 0]+x(i);'....
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

input('Press Enter to Stop')
stop(th);
delete(th);

figure(2)
for j=1:length(t)
    
    xp(i)=B*exp(-c/m*t(j));
    
end
plot(t,xp)
