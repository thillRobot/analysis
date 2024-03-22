%%
% ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - Spring 2017
% Solving Second ODEs - Euler's and RK2 Methods
%%
clear variables;close all;clc

% Use the free non-linear pendulum as the model, the link is massless %
% The ODE was derived in class  

%% Constant Parameters
m=2;
g=9.8;
l=42*(1/100);
c=1; %drag

%% define the slope function
%anonymous funtion defintions
u1_prime=@(t,u1,u2) u2;
u2_prime=@(t,u1,u2) -g/l*sin(u1)-c*u2;

%% Forward integration with Euler's and RK
theta0=50; %ICs
omega0=0;

u1_eu(1)=theta0*pi/180; %u1, initial theta
u2_eu(1)=omega0;  %u2, initial omega

u1_rk2(1)=theta0*pi/180; %u1, initial theta
u2_rk2(1)=omega0;  %u2, initial omega

dt=.01;
t_stop=10;
time=0:dt:t_stop;

figure(1);hold on
for j=1:length(time)
  
    %eulers for u1
    u1_eu(j+1)=u1_eu(j)+u1_prime(time(j),u1_eu(j),u2_eu(j))*dt;  
    
    %eulers for u2
    u2_eu(j+1)=u2_eu(j)+u2_prime(time(j),u1_eu(j),u2_eu(j))*dt;   
    
    % RK2 for u1
    k1=u1_prime(time(j),u1_rk2(j),u2_rk2(j))*dt;
    k2=u1_prime(time(j)+dt,u1_rk2(j)+k1,u2_rk2(j))*dt;   
    u1_rk2(j+1)=u1_rk2(j)+k1/2+k2/2;       
    
    % RK2 for U2
    k1=u2_prime(time(j),u1_rk2(j),u2_rk2(j))*dt;    
    k2=u2_prime(time(j)+dt,u1_rk2(j),u2_rk2(j)+k1)*dt;      
    u2_rk2(j+1)=u2_rk2(j)+k1/2+k2/2;

end

%% now verify with the ODE45 solver

%define the system of 2 ODEs
ode_sys=@(t,u) [u(2)
                -g/l*sin(u(1))-c*u(2)]

%define the initial conditions (r(0) ,dr(0)/dtau, theta(0), d theta(0)/dtau) 
initcond=[50*pi/180,0];

[t45,x45]=ode45(ode_sys,time,initcond);

%% plotting 
figure(1);hold on
subplot(3,1,1);hold on 
plot(time,u1_eu(1:length(time)),'b')
plot(time,u2_eu(1:length(time)),'g')
title('Euler''s Method ')
legend('Angular Position','Angular Velocity')
ylabel('\theta(rad)')
grid on

subplot(3,1,2);hold on
plot(time,u1_rk2(1:length(time)),'b')
plot(time,u2_rk2(1:length(time)),'g')
title('Second Order Runge-Kutta')
legend('Angular Position','Angular Velocity')
ylabel('\theta(rad)')
grid on

subplot(3,1,3);hold on
plot(t45,x45(:,1),'b')
plot(t45,x45(:,2),'g')
title('ODE 45')
legend('Angular Position','Angular Velocity')
xlabel('Time(s)')
ylabel('\theta(rad)')
grid on
