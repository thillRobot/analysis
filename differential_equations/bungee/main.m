%% ME 3001 - Mechanical Engineering Analysis 
%
% Tristan Hill - 8/5/2014
%
% Bungee Jumper Business Man (Chapra Applied Num. Methods ch. 18)
% Bonus Problem 
%
%%
clc
clear all
close all

%% define constant parameters
g=9.8; %gravity
m=80; %mass(kg)
global L k_nl type m c Cd g
L=20; %length of cord @ equilibrium (m)
c=15; %damping coefficient of cord (kg/s)

k_nl=[500 149 10   %non linear spring force from cord (N/m)
      204 111 4.88    %[k1 k2 d1] piecewise of two linear springs
      162 77  4.88 ];
  
type=3;%1-stiff, 2-medium, 3-soft 

Cd=1; %drag coefficient

dt=.01; %set up independent variable (time)
t=0:dt:60;

%% Write the Equations

% fv = @(z,v,factor,kflag) g- factor*(k(1,1)/m)*(z-L) - factor*(c/m)*v -sign(v)*(Cd/m)*v^2; %dv/dt= g - ...

fz = @(v) v; % dz/dt = v
figure(1)
% write the initial conditions
for j=1:3
    type=j;%1-stiff, 2-medium, 3-soft 
    z=zeros(1,length(t));
    v=zeros(1,length(t));
    fact=zeros(1,length(t));

    z(1)=0; %initial pos. 
    v(1)=0; %initial vel.

    %% Euler's Method for solving 2 simultaneous ODEs 
    % y(i+1)=y(i)+phi*h  % phi - slope, h- stepsize 

    for i=1:length(t)-1

       if z(i)>L      % turn the cord forces on and off
           fact(i)=1;
       else
           fact(i)=0;
       end

    %    if (z(i)-L)<k_nl(type,3) % change the spring rate based on stretch
    %        k(i)=k_nl(type,1);
    %    else
    %        k(i)=k_nl(type,2);
    %    end

       z(i+1)=z(i)+fz(v(i))*dt ;

       v(i+1)=v(i)+ fv(z(i),v(i),fact(i))*dt;

    end
    subplot(3,1,j)
    
    % plot(t,v,'r'); hold on
    plot(t,-z,'b')

end
%%
% [I,map] = imread('busiman_icon.png','png');
% Ibw=im2bw(I);
% 
% % ihand=imshow(Ir,map);
% 
% % extract pixel data into x,y points
% dx=.5;
% dy=.5;
% [m,n]=size(Ibw);
% idx=1;
% for i=1:m
%     for j=1:n
%         if Ibw(i,j)==0
%             Ipts(idx,1)=j*dx;
%             Ipts(idx,2)=i*dy;
%             idx=idx+1;
%         end
%     end
% end
% figure(2)
% scale=1;
% Ipts=Ipts*scale;
% Ipts(:,2)=flipud(Ipts(:,2));
% plot(Ipts(:,1),Ipts(:,2),'*')
% zscale=1;
% cg=[mean(Ipts(:,1)) mean(Ipts(:,2))];
% 
% 
% for i=1:length(t)-1
% %     plot(Ipts(:,1),-(Ipts(:,2)+z(i)*zscale),'.');hold on 
%     plot([10,-(cg(2)+z(i));10, 0]);hold off
%     axis equal
%     axis([-30 30 -150 50]*zscale)
%     pause(.000001)
% end 
% 
% % for i=1:100
% %     Ir=[Ir;ones(length(Ir(1,:)))]
% %     set(ihand,'YData'
% %      imshow(Ir)
% % end
% 
% frame = imread('busiman_icon.png');
% Ir=frame(:,:,1);%pull out the red ch
% frame_size = size(frame);
% allpixels = reshape(frame, frame_size(1)*frame_size(2), frame_size(3))
% 
% 
% 
% 
% 
