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

%% lets do some drawing
% shape_og.vertices=[0, 0, 0
%                     1, 0, 0 
%                     1, 3, 0 
%                     0, 2.6, 0
%                     0, 0, 0]

theta=0:.1:2*pi;
r=1;
% shape_og.vertices=[cos(theta)*r,cos(theta)*r',zeros(length(theta),1)]
       

shape_og.vertices = [r*cos(theta'), ...
                     r*sin(theta'), ...
                     r*ones(length(theta),1)];
shape_og.faces=[1:length(theta)]

     figure(2)             
patch(shape_og)                  
                
% pause
%% Eulers Forward integration

vx_eulers(1)=vxo
ux_eulers(1)=uxo
vy_eulers(1)=vyo
uy_eulers(1)=uyo

dt=.1;
time=0:dt:10;

figure(1);

for j=1:length(time)
    
    vx_eulers(j+1)=vx_eulers(j)+dt*(slope_vx(ux_eulers(j),vx_eulers(j)));
    ux_eulers(j+1)=ux_eulers(j)+dt*(slope_ux(ux_eulers(j),vx_eulers(j)));
    
    vy_eulers(j+1)=vy_eulers(j)+dt*(slope_vy(uy_eulers(j),vy_eulers(j)));
    uy_eulers(j+1)=uy_eulers(j)+dt*(slope_uy(uy_eulers(j),vy_eulers(j)));
   
    plot(ux_eulers,uy_eulers,'r:');hold on
    plot(ux_eulers(j+1),uy_eulers(j+1),'ro');axis([0 15 0 100]);
    
    
    
                       
    shape.vertices(:,1)=shape_og.vertices(:,1)+ux_eulers(j+1)            
    shape.vertices(:,2)=shape_og.vertices(:,2)+uy_eulers(j+1)  
    
    shape.faces=[1:length(theta)]

    patch(shape)
    hold off
    pause(.02)
end


%% plotting 

% plot(ux_eulers,uy_eulers,'r')
title('pos')

% figure(2);hold on
% plot(vx_eulers,'b')
% plot(vy_eulers,'g')











