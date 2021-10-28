 %% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014
%
% 2nd and 4th order Runga-Kutta methods
%
% Example 1 
%% 

clear all
close all 
clc

% ODE to solve: dy/dx=(1-x)y, initial condition y=1 at x=0

c=0.5;
m=20;
vo=120;

slopeFun=@(t,v) -c/m*v

%% look at the theoretical solution
dt=0.1;
time=0:dt:50
v_theo=vo*exp(-c/m*time)
v_rk2(1)=vo;
%% compare with rk2
i=1;t=0;
while t<50
    
   k1=slopeFun(t,v_rk2(i))*dt; 
   k2=slopeFun(t+dt,v_rk2(i)+k1)*dt;
   v_rk2(i+1)=v_rk2(i)+k1/2+k2/2;
   i=i+1; 
   t=t+dt; 
end




%% compare with ode45

[t_45,v_45]= ode45(slopeFun,time,vo)

figure(1);hold on

plot(time,v_theo,'r--')
plot(time,v_rk2,'g','LineWidth',10)
plot(t_45,v_45,'m','MarkerSize',10)
xlabel('t');ylabel('v')
















