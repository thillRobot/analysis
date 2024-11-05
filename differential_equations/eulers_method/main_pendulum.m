%%
% Euler's Integration TTU - for Pendulum Problem - Nonlin
%%
clear variables;clc;close all

%% define the slope function
m=2;g=9.8;l=42*(1/100)
%uo=50*pi/180; %u=theta
vo=0; %let v = d(theta)/dt =du/dt
c=1; %drag
% f_wind=5;

2
%anonymous funtion defintions (inline)

u1_prime=@(u1,u2) u2;

u2_prime=@(u1,u2) -g/l*sin(u1)-c*u2;





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

u1_eu(1)=50*pi/180; %u1, initial theta
u2_eu(1)=0;  %u2, initial omega

t=0;j=1;
dt=.01;
t_stop=30;

%% setup the animation figure
figure(1);hold on
while t<t_stop
  
    u1_eu(j+1)=u1_eu(j)+u1_prime(u1_eu(j),u2_eu(j))*dt;  
    u2_eu(j+1)=u2_eu(j)+u2_prime(u1_eu(j),u2_eu(j))*dt;
    
    
    
    
    
    polar(u1_eu(j+1)-pi/2,l,'o');hold on
    
    polar([0, u1_eu(j+1)-pi/2],[0, l],'r')
    
    shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
    shape.faces=[1:5];
    patch(shape);
    
    polar(u1_eu-pi/2,ones(1,length(u1_eu))*l,'y:');hold off
    pause(.0001)
    t=t+dt;
    j=j+1;
end


% %% plotting 
% figure(1);hold on
plot(u1_eu,'r')

%polar(u1_eu,ones(1,length(u2_eu))*l)
%axis square
%axis([-l l -l 0]);
% figure(2);hold on
% plot(v_eu,'b')











