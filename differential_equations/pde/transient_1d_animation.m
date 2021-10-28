%% ME 3001 - Mechanical Engineering Analysis
%
% Tristan Hill - Modified from Dr. Han - summer 2014
%                Modified again        - spring 2015
%                Modified again        - summer 2016






% Solving Linear, 2nd order Partial Differential Equations
% using Separation of Variables and the Fourier Series 
%
% Example: 1D Transient Conduction 
%%

clc
close all
clear all

% figure(2)
% % Create push button - Welcome button
%     bstr=sprintf('TTU ME30001');
%     btn = uicontrol('Style', 'pushbutton', 'String',bstr,...
%         'FontSize',20,...
%         'Position', [0 20 0 20],...
%         'Callback', @btn_cb);  
% 

   

% define global variables

global L n dx x alpha M dt 

T0=0;
Tl=0;

L=2; %length of solid
n=50;%number of divisions
dx=L/n;%increment of x dimension,(m) 
x=0:dx:L;%x-coordinate

k=400; %conductivity of copper (wire)
cp=400; %specific heat
ro=8000; %density
alpha=sqrt(k/(ro*cp));

M=100; %inital temp

plotT=[]; %store T for ploting afterwards

prof_inc=10; %time between temp profiles

dt=1;
tfinal=1000;
idx=1;

for t=0:dt:tfinal
    sum=0;
    for n=1:100
        sum=sum+(1/n)*(1-cos(n*pi))*sin(n*pi*x/L)*exp(-(alpha*n*pi/L)^2*t);
    end
    
    T=2*M/pi*sum;

    if mod(idx,prof_inc)==0   %plot the temp profile every 50 timesteps
        plotT=[plotT; T]; %save T
    end    
    
    idx=idx+1;
end

%% initialize the graphics
a=axes('xlim',[0,L],'ylim',[-2,M]);
% plot the temp profiles
plot(x,plotT,'k');hold on

grid on
l=line(0,0,...
    'userdata',0,...
    'marker','.',...
    'color','red',...
    'markersize',2,...
    'linestyle','-');   
    
colors=colormap('hot');
% node_colors=round(mapminmax(plotT,1,64));    
    
%% setup the timer callback function 
dt=dt/10
th=timer;
th.TimerFcn={@tcb_transient1D,l};
th.StopFcn={@tcb_stop};
set(th,...
    'period',dt,...
    'TasksToExecute', round(tfinal/dt),...
    'executionmode','fixedrate');
start(th);



