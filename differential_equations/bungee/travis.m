clear all
close all
clc

m = 80; % Mass of Jumper (kg)
L = 20; % Length of unstrecthed cord (m)
g = 9.81; % Accel. of gravity (kg/s^2)
c = 15; % (kg/s)
Cd = 1; 
ti = 0; % Initial time (s)
tf = 60; % Final time (s)
h = 0.1; % Time step increment
t = ti:h:tf;
v(1) = 0;
z(1) = 0;
k=255;

bungee=@(v,z) g-(k/m)*(z-L)-(c/m)*v-sign(v)*(Cd/m)*v^2;
bungee2=@(v) g-sign(v)*(Cd/m)*v^2;
bungee3=@(v) v;
%------Euler's--------%
for i=1:length(t)-1
    v(i+1) = v(i) + bungee(v(i),z(i))*h;

    z(i+1) = z(i) + bungee3(v(i))*h;
end

% %------4th Order RK------%
% for i=1:length(t)-1
%    k1 = h*bungee(v(i),t(i));
%    k2 = h*bungee(v(i)+h/2,t(i)+h/2*k1);
%    k3 = h*bungee(v(i)+h/2,t(i)+h/2*k2);
%    k4 = h*bungee(v(i)+h,t(i)+h*k3);
%    
%    v(i+1)=v(i)+(1/6)*(k1+2*k2+2*k3+k4);
% end
% for i=1:length(t)-1
%    k1 = h*bungee3(z(i),t(i));
%    k2 = h*bungee3(z(i)+h/2,t(i)+h/2*k1);
%    k3 = h*bungee3(z(i)+h/2,t(i)+h/2*k2);
%    k4 = h*bungee3(z(i)+h,t(i)+h*k3);
%    
%    z(i+1)=z(i)+(1/6)*(k1+2*k2+2*k3+k4);
% end


