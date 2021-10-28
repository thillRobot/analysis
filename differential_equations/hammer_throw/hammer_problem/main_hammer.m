%%
% Euler's Integration TTU - for Hammer Throw Problem - Nonlin
%%
clear variables;clc;close all

%% define the constant parameters
g=9.8; % gravity
c_drag=0.05;

lb2kg=0.454; % conversion factor
in2m=2.54*10^-2; % conversion factor

ms=2.0*lb2kg; % mass of stick
mh=8.0*lb2kg; % mass of the head
m=ms+mh;      % total mass

l=24*in2m;
t=0.75*in2m;
h=3*in2m;
w=6*in2m;

d=(h/2+l/2);
dh=ms*(l/2+h/2)/(mh+ms);
ds=d-dh;

I=mh/12*(w^2+h^2)+mh*(dh)^2+ms/12*(l^2+t^2)+ms*(ds)^2;

%% define the slope functions
% anonymous funtion defintions (inline)

u1_prime=@(u1,u2,u3,u4,u5,u6)  u2;
u2_prime=@(u1,u2,u3,u4,u5,u6)  -c_drag*u2/m;
u3_prime=@(u1,u2,u3,u4,u5,u6)  u4;
u4_prime=@(u1,u2,u3,u4,u5,u6)  (-m*g-c_drag*u4)/m;
u5_prime=@(u1,u2,u3,u4,u5,u6)  u6;
u6_prime=@(u1,u2,u3,u4,u5,u6)  (-c_drag*u6)/I;

%% define the intial conditions

u1_eu(1)=0;          %u1, initial x
u2_eu(1)=5;          %u2, initial vx
u3_eu(1)=0;          %u3, initial y
u4_eu(1)=5;          %u4, initial vy
u5_eu(1)=80*pi/180; %u5, initial theta
u6_eu(1)=-360*pi/180;   %u6, initial omega

%% draw a picture with patch
shape0.vertices=[h/2+l-dh,t/2
                h/2-dh,t/2
                h/2-dh,w/2
                -h/2-dh,w/2
                -h/2-dh,-w/2
                h/2-dh,-w/2
                h/2-dh,-t/2
                h/2+l-dh,-t/2];
            
theta=u5_eu(1)*pi/180;
% shape.vertices=([cos(theta) -sin(theta);sin(theta) cos(theta)]*shape0.vertices')';
shape0.faces=[1:8];

% patch(shape0)
% axis equal
% pause

%% solve the equations with forward elimination and show an animation
j=1;
dt=0.025;
t_stop=3;    

time=0:dt:t_stop;

figure(1);hold off
for j=1:length(time)
  
    u1_eu(j+1)=u1_eu(j)+u1_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j),u5_eu(j),u6_eu(j))*dt;  
    u2_eu(j+1)=u2_eu(j)+u2_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j),u5_eu(j),u6_eu(j))*dt;
    u3_eu(j+1)=u3_eu(j)+u3_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j),u5_eu(j),u6_eu(j))*dt;  
    u4_eu(j+1)=u4_eu(j)+u4_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j),u5_eu(j),u6_eu(j))*dt;
    u5_eu(j+1)=u5_eu(j)+u5_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j),u5_eu(j),u6_eu(j))*dt;
    u6_eu(j+1)=u6_eu(j)+u6_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j),u5_eu(j),u6_eu(j))*dt;
    
    theta=u5_eu(j);
      
    shape.vertices=([cos(theta) -sin(theta);sin(theta) cos(theta)]*shape0.vertices')';%+[-x*cos(u1_eu(j))+u5_eu(j) u3_eu(j)]
    shape.vertices(:,1)=shape.vertices(:,1)+u1_eu(j);
    shape.vertices(:,2)=shape.vertices(:,2)+u3_eu(j);
    shape.faces=[1:8];

    clf
    patch(shape)
  
    axis equal
    axis([-2 10 -2 5]);
    pause(.01)
    
end

%% Plot the curves after the animation is finished. 

figure(2);hold on
plot(time,u1_eu(1:length(time)),'r')
plot(time,u2_eu(1:length(time)),'g')
legend('Horizontal Position - x','Horizontal Velocity - v_x')

figure(3);hold on
plot(time,u3_eu(1:length(time)),'r')
plot(time,u4_eu(1:length(time)),'g')
legend('Vertical Poistion - y','Vertical Velocity v_y')

figure(4);hold on
plot(time,u5_eu(1:length(time)),'r')
plot(time,u6_eu(1:length(time)),'g')
legend('Orientation - Theta','Angular Velocity - Omega')

