%% ME 3001 - Mechanical Engineering Analysis
%
% Tristan Hill - Modified from Dr. Han - summer 2014
%                Modified again        - spring 2015
% 
% Solving Linear, 2nd order Partial Differential Equations
%   using Separation of Variables and the Fourier Series 
%
% Example: 1D Transient Conduction 
%% 

clc
close all
clear all

L=2; %length of solid
n=50;%number of divisions
dx=L/n;%increment of x dimension,(m) 
x=0:dx:L;%x-coordinate

k=400; %conductivity of copper (wire)
cp=400; %specific heat
ro=8000; %density
alpha=sqrt(k/(ro*cp));

M=1; %inital temp

plotT=[]; %store T for ploting afterwards

prof_inc=100; %time between temp profiles

dt=10;
tfinal=10000;
idx=1;

for t=0:dt:tfinal
    sum=0;
    for n=1:100
        sum=sum+(1/n)*(1-cos(n*pi))*sin(n*pi*x/L)*exp(-(alpha*n*pi/L)^2*t);
    end
    
    T=2*M/pi*sum;
    
    if t==0
        plotT=[plotT; T]; %initial temp
        isave=1;
    end
    
    if mod(idx,prof_inc)==0   %plot the temp profile every 50 timesteps
        plotT=[plotT; T]; %save T
    end    
    
    idx=idx+1;
end

%plot the temp profiles
plot(x,plotT,'k');hold on

% %append max and min temp onto each profile to fixing temperature map issue
tmp=[];
[m,n]=size(plotT);
for i=1:m
    tmp=[tmp ; 0 M plotT(i,:)];
end
plotT=tmp;
%append x to make it line up
x=[0 0 x];

% %plot the individual nodes
colors=colormap('hot');
node_colors=round(mapminmax(plotT,1,64));

for i=1:m
    tstr=sprintf('t=%i',i*50*dt);
    text(L/2,plotT(i,round(n/2))+.2,tstr)
    for j=3:n %skip the first 2 points (temp issue above) 
        if mod(j,5)==1
            plot(x(j),plotT(i,j),'Marker','.','MarkerSize',30,'Color',colors(node_colors(i,j),:))
        end
    end
end
xlabel('x')
ylabel('T')
grid on

% %patch the bcs as walls (to be added)
% wall.vertices=[x0-wallw y0-wallh/2
%                    x0-wallw y0+wallh/2
%                    x0 y0+wallh/2
%                    x0 y0-wallh/2
%                    x0-wallw y0-wallh/2  ];
%         wall.faces   = 1:length(wall.vertices);
%         wall.facecolor =cmap(round(T(i)),:);
%         patch(wall)



