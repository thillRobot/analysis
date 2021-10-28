%%
%
% Euler's Integration TTU 
%
%%
clear variables;clc;close all

%% constant params

%C
m=10
g=9.8
c=0.68
mu=0.55
th=28*pi/180
v0=10;

%D
m=14
g=9.8
c=0.68
mu=0.65
th=32*pi/180
v0=15;



f=m*g*(sin(th)-mu*cos(th));

%% define the slope function
slope=@(v) f-c/m*v;

%% graph exact solution 'theoretical' derived in class
t=0:.01:5;
r=-6;
A=v0-f*m/c;

for k=1:length(t)
    v_exact(k)=f*m/c+A*exp(-c/m*t(k));
end


%% Eulers Forward integration

v_eulers(1)=v0;

dt=.5;
et(1)=0
for j=1:10
   
    v_eulers(j+1)=v_eulers(j)+dt*(slope(v_eulers(j)));
    et(j+1)=et(j)+dt;
end
% %% RK2
% dt=.01; 
% y_rk(1)=yo;
% for j=1:100
%     
%     k1=dt*-6*y_rk(j);
%     k2=dt*-6*(y_rk(j)+k1);
%     y_rk(j+1)=y_rk(j)+(k1+k2)/2;
%     
% end
% 
% %% built in method
% 
% [t_45,y_45]=ode45(slope_fun,[0 1],1)
% 
%% plotting 
figure(1);hold on
plot(t,v_exact,'r')
plot(et(1:length(v_eulers)),v_eulers,'b*')
% plot(t(1:length(y_rk)),y_rk,'go')
% 
% plot(t_45,y_45,'c*')
% 
% legend('Exact','Eulers','RK2','ODE45')









% 