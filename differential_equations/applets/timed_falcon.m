
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

h = haptikdevice;
fprintf('Falcon Initialized\n\n')

i=1;
t=0;
dt=.05;
tmax=10;

% prepare the plot
 axes('xlim',[1,tmax],'ylim',[-30,30]);
 x=0;
 y=10;
 
 lh=line(x,y,...
        'userdata',1,...
        'marker','.',...
        'markersize',5,...
        'linestyle','none');
 shg;   
% prepare a simple timer function
 com=[
        'pos = read_position(h);'...
        'x=[x x(i)+dt];'...
        'y=[y pos(3)];'...
        't=t+dt;'...
        'i=i+1;'...
        'set(lh,''ydata'',y);'...
        'set(lh,''xdata'',x);'
 ];
% create the timer
 th=timer;
 set(th,...
    'timerfcn',com,...
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