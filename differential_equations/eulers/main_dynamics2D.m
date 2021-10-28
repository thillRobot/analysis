%%
%
% Euler's Integration TTU 
%
%%
clear variables;clc;close all

%% define the slope function
m=20;g=9.8;
uxo=0;
vxo=1;

uyo=0;
vyo=50;

f_ext=-.5;

slope_ux=@(ux,vx) vx;
slope_vx=@(ux,vx) f_ext/m;

slope_uy=@(uy,vy) vy;
slope_vy=@(uy,vy) -g;

%% graph exact solution 'theoretical' derived in class
% t=0:.01:1;
% r=-6;
% A=1;
% for k=1:length(t)
%     y_exact(k)=A*exp(r*t(k));
% end
% 

%% Eulers Forward integration

vx_eulers(1)=vxo
ux_eulers(1)=uxo
vy_eulers(1)=vyo
uy_eulers(1)=uyo

dt=.01;
time=0:dt:10;

for j=1:length(time)
    
    vx_eulers(j+1)=vx_eulers(j)+dt*(slope_vx(ux_eulers(j),vx_eulers(j)));
    ux_eulers(j+1)=ux_eulers(j)+dt*(slope_ux(ux_eulers(j),vx_eulers(j)));
    
    vy_eulers(j+1)=vy_eulers(j)+dt*(slope_vy(uy_eulers(j),vy_eulers(j)));
    uy_eulers(j+1)=uy_eulers(j)+dt*(slope_uy(uy_eulers(j),vy_eulers(j)));
   
end


%% plotting 
figure(1);hold on
plot(ux_eulers,uy_eulers,'r')
title('pos')

figure(2);hold on
plot(vx_eulers,'b')
plot(vy_eulers,'g')











