%% ME3050 - Dynamics, Modeling, and Control
% Tristan Hill - 09/10/2015
% 1DOF lumped parameter model (mass+damper) 
%%

clear all
close all
clc

% i=1;
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

% create the timer
 th=timer;
 set(th,...
    'timerfcn',@timr_09_10,...
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