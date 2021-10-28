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

%anonymous funtion defintions (inline)

u1_prime=@(t,u1,u2) u2;

u2_prime=@(t,u1,u2) -g/l*sin(u1)-c*u2;


%% let us draw a picture with patch
shape.vertices=[0,0,0
                10,0,0
                10,10,0
                0,10,0
                0,0,0];

shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
shape.vertices(:,2)=shape.vertices(:,2)+5; 
    
shape.faces=[1:5];


%% Forward integration


u1_eu(1)=50*pi/180; %u1, initial theta
u2_eu(1)=0;  %u2, initial omega

u1_rk2(1)=50*pi/180; %u1, initial theta
u2_rk2(1)=0;  %u2, initial omega

t=0;j=1;
dt=.01;
t_stop=10;

%% setup the animation figure
figure(1);hold on
while t<t_stop
  
    u1_eu(j+1)=u1_eu(j)+u1_prime(t,u1_eu(j),u2_eu(j))*dt;  
    u2_eu(j+1)=u2_eu(j)+u2_prime(t,u1_eu(j),u2_eu(j))*dt;   
    
    % RK2 for U1
    k1=u1_prime(t,u1_rk2(j),u2_rk2(j))*dt;
    
    k2=u1_prime(t+dt,u1_rk2(j)+k1,u2_rk2(j))*dt;
    
    u1_rk2(j+1)=u1_rk2(j)+k1/2+k2/2;
       
    % RK2 for U1
    k1=u2_prime(t,u1_rk2(j),u2_rk2(j))*dt;
    
    k2=u2_prime(t+dt,u1_rk2(j),u2_rk2(j)+k1)*dt;  
    
    u2_rk2(j+1)=u2_rk2(j)+k1/2+k2/2;
    
    
%     polar(u1_eu(j+1)-pi/2,l,'o');hold on
%     
%     polar([0, u1_eu(j+1)-pi/2],[0, l],'r')
%     
%     shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
%     shape.faces=[1:5];
%     patch(shape);
%     
%     polar(u1_eu-pi/2,ones(1,length(u1_eu))*l,'y:');hold off
%     pause(.0001)

    t=t+dt;
    j=j+1;
end



%polar(u1_eu,ones(1,length(u2_eu))*l)
%axis square
%axis([-l l -l 0]);
% figure(2);hold on
% plot(v_eu,'b')

%% now verify with the ODE45 solver

%define the system of 2 ODEs
ode_sys=@(t,u) [u(2)
                -g/l*sin(u(1))-c*u(2)]

%define the initial conditions (r(0) ,dr(0)/dtau, theta(0), d theta(0)/dtau) 
initcond=[50*pi/180,0]

% colors=['r*';'b*';'g*'];          
time=0:0.1:10; %setup the independent variable 

[t45,x45]=ode45(ode_sys,[0 10],initcond);


%% plotting 
figure(1);hold on
plot(u1_eu,'b')
plot(u2_eu,'g')
title('Euler''s Method ')
legend('Angular Velocity','Angular Position')

figure(2);hold on
plot(u1_rk2,'b')
plot(u2_rk2,'g')
title('Second Order Runge-Kutta')
legend('Angular Velocity','Angular Position')

figure(3);hold on
plot(t45,x45(:,1),'b')
plot(t45,x45(:,2),'g')
title('ODE 45')
legend('Angular Velocity','Angular Position')













