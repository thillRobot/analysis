%% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014
%
% 2nd order Runga-Kutta method
%
% Example 1 
%% 

clear all
close all 
clc

% ODE to solve: dy/dx=(1-x)y, initial condition y=1 at x=0
% slopeFun=@(x,y) (1-x)*y;
slope_fun=@(x,y) -6*y;

h=.01; % independent variable step size
h_ext=.001;
xmin=0;
xmax=1;
x=xmin:h:xmax;
x_ext=xmin:h_ext:xmax;


y2(1)=1; %initial condition

% ye=exp(x_ext-x_ext.^2/2);
%% graph exact solution 'theoretical' derived in class
r=-6;
A=1;
for k=1:length(x_ext)
    ye(k)=A*exp(r*x_ext(k));
end

% 2nd Order Runga Kutta
for i=1:length(x)-1
   k1=h*slope_fun(x(i),y2(i));
   k2=h*slope_fun(x(i)+h,y2(i)+h*k1);
   
   y2(i+1)=y2(i)+0.5*(k1+k2);
end


%% compare with ode45

[x45,y45]= ode45(slope_fun,[xmin xmax],1)


figure(1);hold on
plot(x,y2,'x'); pause
plot(x_ext,ye,'black'); pause
plot(x45,y45,'g'); pause
legend('RK2','exact','ode45')
xlabel('x');ylabel('y')
















