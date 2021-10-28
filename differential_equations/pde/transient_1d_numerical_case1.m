% me 3001 - 1d transient numerical heat transfer
%transient_1d_numerical_case1.m
%one-dimensional transient conduction using explicit finite difference method.
clear all
close all
clc
%
L=2;%length of bar (m)
k=400;%conductivity of copper
ro=8000;%density
c=400;%specific heat

alpa=sqrt(k/(ro*c));%(thermal_diffusivity)^0.5
n=40;%number of divisions
dx=L/n;%increment of x dimension,(m) 
% lamda=0.5; %Courant number, non-dimensional (should be less than 0.5)
% dt=lamda*(dx/alpa)^2;%time step dictated by Courant number
tstop=2000;%maximum calculation time (sec)
dt=10
% lamda=alpa^2*dt/dx^2
lambda=k/(ro*c)*dt/dx^2

T0=50;
Tn=100;


x=0:dx:L;%x-coordinate
%given initial conditions
%n+1;%number of nodes including boundary
for i=1:n+1
%     if x(i)<=L/2
%         g(i)=10%*sin(2*pi*x(i)/L); %initial temperature T(x,0)=g(x)
%     else
%         g(i)=0;
%     end
    g(i)=20;
end
% g=10*ones(length(x),1);
%
t=0;%starting time
T=g;% T(x,0)
plot_temp=[T'];%save initial temperature for plot
%
isave=1;
while t<=tstop
    for i=2:n
%     T(i)=T0(i)+lamda*(T0(i+1)-2*T0(i)+T0(i-1));%T at t=t+dt
        T(i)=lambda*T(i+1)+(1-2*lambda)*T(i)+lambda*T(i-1);
    end 
    T(1)=T0;%boundary condition at x=0
    T(n+1)=Tn;%boundary condition at x=L
%reinitialize for next time step   
    t=t+dt;%increase time
%     T0=T;%reinitialization 
    if isave==50
        plot_temp=[plot_temp T'];%save data 
        isave=1;
    else
        isave=isave+1;
    end
%     pause
end
plot(x,plot_temp)
grid on
xlabel('x'), ylabel('T')