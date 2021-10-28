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
slopeFun=@(x,y) (1-x)*y;

h=.5; % independent variable step size
h_ext=.001;
xmin=0;
xmax=5;
x=xmin:h:xmax;
x_ext=xmin:h_ext:xmax;


y2(1)=1; %initial condition
y4(1)=1;

ye=exp(x_ext-x_ext.^2/2);

% 2nd Order Runga Kutta
for i=1:length(x)-1
   k1=h*slopeFun(x(i),y2(i));
   k2=h*slopeFun(x(i)+h,y2(i)+h*k1);
   
   y2(i+1)=y2(i)+0.5*(k1+k2);
end

% 4th order Runga Kutta
for i=1:length(x)-1
   k1=h*slopeFun(x(i),y4(i));
   k2=h*slopeFun(x(i)+h/2,y4(i)+h/2*k1);
   k3=h*slopeFun(x(i)+h/2,y4(i)+h/2*k2);
   k4=h*slopeFun(x(i)+h,y4(i)+h*k3);
   
   y4(i+1)=y4(i)+(1/6)*(k1+2*k2+2*k3+k4);
end


%% compare with ode45

[x45,y45]= ode45(slopeFun,[xmin xmax],1)


figure(1)
plot(x,y2,'x',x,y4,'o',x_ext,ye,'black',x45,y45,'g')
legend('RK2','RK4','exact','ode45')
xlabel('x');ylabel('y')
















