%%
% Euler's Integration TTU - for Pendulum Problem - Nonlin
% revising for ME3050 - June 13, Summer 2020  
%%
clear variables;clc;close all

%% define the slope function
m=10;
g=9.8;
l=50*(1/100);
Io=m*l^2; % inertia of point mass at distance
u10=50*pi/180; %u=theta
c=0.8; %drag

P.m=m;
P.g=g;
P.c=c;
P.l=l;
P.Io=Io;

%anonymous funtion defintions (inline)


%% let us draw a picture with patch
shape.vertices=[0,0,0
                10,0,0
                10,10,0
                0,10,0
                0,0,0];

shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
shape.vertices(:,2)=shape.vertices(:,2)+5; 
    
shape.faces=[1:5];


%% eu Forward integration

u1_eu(1)=u10; %u1, initial theta
u2_eu(1)=0;  %u2, initial omega

t=0;
dt=.001;
t_stop=5;
time=0:dt:t_stop;


%% setup the animation figure
% figure(1);hold on
% while t<t_stop
for j=1:length(time)
  
    u1_eu(j+1)=u1_eu(j)+f1(u1_eu(j),u2_eu(j),P)*dt;  
    u2_eu(j+1)=u2_eu(j)+f2(u1_eu(j),u2_eu(j),P)*dt;
    
%     ph1=polar(u1_eu(j+1)-pi/2,l,'ko');hold on %,'MarkerFaceColor',[0.6,0.1961,0.8]
%     ph1.set('Color',[0.3098, 0.1607, 0.5176],'MarkerFaceColor',[1.0000, 0.8666, 0.0000])
%     ph1.set('MarkerSize',20,'LineWidth',3)
%     
%     ph2=polar([0, u1_eu(j+1)-pi/2],[0, l-.025]);
%     ph2.set('Color',[0.3098, 0.1607, 0.5176],'LineWidth',3)
%     
%     ph3=polar(u1_eu-pi/2,ones(1,length(u1_eu))*l,'k:');
%    
%     plot(0,0,'ko','MarkerFaceColor','black','MarkerSize',10) ;hold off
%     
%     shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
%     shape.faces=[1:5];
%     patch(shape);
%     
%     pause(.0001)
end

%% plotting 
figure(2);hold on
plot(time,u1_eu(1:length(time)),'b')
% plot(time,u2_eu(1:length(time)),'b:')
grid on
xlabel('time(s)')
ylabel('\theta(rad)')

%% define the slope functions 'inline'
function u1_dot=f1(u1,u2,P)
    u1_dot=u2;
end

function u2_dot=f2(u1,u2,P)
    u2_dot=(1/P.Io)*(-P.m*P.g*P.l*sin(u1)-P.c*u2);
end

