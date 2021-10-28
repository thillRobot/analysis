%%
% ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - Spring 2017
% Solving First Order ODEs - Euler's and RK2 Methods
%%
clear variables;close all;clc

%% define the slope function
% original ODE is dy/dx+6y=0, y(x=0)=1
slope_fun=@(x,y) -6*y;

%% graph exact solution 'theoretical' derived in class
t=0:.01:1;
r=-6;
A=1;
for k=1:length(t)
    y_exact(k)=A*exp(r*t(k));
end

%% Eulers Forward integration
yo=1;
y_eulers(1)=yo;

dt=.01; 
for j=1:100
   
    y_eulers(j+1)=y_eulers(j)+dt*(slope(y_eulers(j),1));
    
end

%% RK2
dt=.01; 
y_rk(1)=yo;
for j=1:100
    
    k1=dt*-6*y_rk(j);
    k2=dt*-6*(y_rk(j)+k1);
    y_rk(j+1)=y_rk(j)+(k1+k2)/2;
    
end

%% built in method ODE45() family

[t_45,y_45]=ode45(slope_fun,[0 1],1);

%% plotting 
figure(1);hold on
plot(t,y_exact,'r:','LineWidth',3)
plot(t(1:length(y_eulers)),y_eulers,'m*')
plot(t(1:length(y_rk)),y_rk,'bo')
plot(t_45,y_45,'k')
grid on
legend('Exact','Eulers','RK2','ODE45')
