%% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014
%
% 2nd and 4th order Runga-Kutta methods
%
%% 

clear all
close all 
clc

dt1=.5; % independent variable step size
dte=.01; % timestep for exact curve
tmax=2;

t1=0:dt1:tmax;
te=0:dte:tmax;

y1(1)=1; %initial condition

c_1=1;   %unknown constant from initial condtion from y(1)=1 %cant use zero as index in matlab 
for i=1:length(te)
    ye(i) = exp(.33*te(i)^3-1.2*te(i));
end
    
% 2nd Order Runga Kutta - dt=.5
for i=1:length(t1)-1
    
   k1=dt1*myF(t1(i),y1(i));
   k2=dt1*myF(t1(i)+dt1/2,y1(i)+k1/2);
   
   y1(i+1)=y1(i)+k2
end


y2(1)=1; %initial condition
for i=1:length(t1)-1
    
   k1=dt1*myF(t1(i),y1(i));
   k2=dt1*myF(t1(i)+dt1/2,y1(i)+k1/2);
   k3=dt1*myF(t1(i)+dt1/2,y1(i)+k2/2);
   k4=dt1*myF(t1(i)+dt1,y1(i)+k3);
   
   y2(i+1)=y2(i)+k1/6+k2/3+k3/3+k4/6;
end

figure(1) 
plot(t1,y1,'r');hold on
plot(t1,y2,'r');hold on
plot(te,ye)
legend('RK2_{dt=.5}','exact')
xlabel('t');ylabel('y')

