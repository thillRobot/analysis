
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

%initialize the falcon


pos = [10 20];
yh(1)=pos(2)/1000;

i=1;
t=0;
dt=.05;
tmax=10;

%define the model parameters
m=1;    %mass of mass (kg)
k=15;    %spring constant (N/m)
% c=2;   %damping coefficient (N/m/s)
g=9.8;  %m/s^2
l=.02;     %unstrectched length of spring (m)

%initial conditions
del_st=m*g/k;
ay=0; 
vy=0;
ym(1)=yh(1)-(del_st+l+.5);

%find c based on damping ratio
dr=.5;   %underdamped 
% dr=1;  %critically damped
% dr=2;  %overdamped
c=dr*2*sqrt(m*k);
% c=0;

% prepare the plot
 axes('xlim',[1,60],'ylim',[-1.5,1]);
 x=0;
 y=10;
 
 lh=line(x,yh,...
        'userdata',1,...
        'marker','.',...
        'color','red',...
        'markersize',5,...
        'linestyle','none');
    
 lm=line(x,ym,...
        'userdata',1,...
        'marker','.',...
        'markersize',5,...
        'linestyle','none');
 shg;   
% prepare a simple timer function
 tfun=[

        'x=[x x(i)+dt];'...  
        'yh=[yh pos(2)/1000];'...
        'ay=k/m*(yh(i)-ym(i)-l)-g-c/m*vy(i);'...
        'vy(i+1)=vy(i)+ay*dt;'...
        'ym=[ym ym(i)+vy(i)*dt];'...
        'Fh=-k*(yh(i)-ym(i)-l);'...
        't=t+dt;'...
        'i=i+1;'...
        'set(lm,''ydata'',ym);'...
        'set(lm,''xdata'',x);'...
        'set(lh,''ydata'',yh);'...
        'set(lh,''xdata'',x);'
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