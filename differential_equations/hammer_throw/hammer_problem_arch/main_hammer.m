%%
% Euler's Integration TTU - for Hammer Throw Problem - Nonlin
%%
clear variables;clc;close all

%% define the constant parameters
g=9.8; %gravity
c_drag=0.02;

lb2kg=0.454; % conversion factor
in2m=2.54*10^-2; % conversion factor

ms=1.0*lb2kg; % mass of stick
mh=2.0*lb2kg;   %mass of the head

l=18*in2m;
t=0.75*in2m;
h=3*in2m;
w=6*in2m;

I=mh/12*(w^2+h^2)+ms/12*(l^2+t^2)+ms*(l/2*h/2)^2;

x=ms*(l/2+h/2)/(mh+ms);

%% define the slope functions
% anonymous funtion defintions (inline)

u1_prime=@(u1,u2,u3,u4)  u2;

u2_prime=@(u1,u2,u3,u4)  (ms*g*(l/2+h/2)*cos(u1)*-sign(cos(u1))-c_drag*u2)/I;

u3_prime=@(u1,u2,u3,u4)  u4;

u4_prime=@(u1,u2,u3,u4)  -g;

u5_prime=@(u1,u2,u3,u4)  10;

%% let us draw a picture with patch
shape0.vertices=[h/2+l,t/2
                h/2,t/2
                h/2,w/2
                -h/2,w/2
                -h/2,-w/2
                h/2,-w/2
                h/2,-t/2
                h/2+l,-t/2];

% shape.vertices(:,1)=shape.vertices(:,1)+20;           
% shape.vertices(:,2)=shape.vertices(:,2)+5; 
    
theta=15*pi/180;
shape.vertices=([cos(theta) -sin(theta);sin(theta) cos(theta)]*shape0.vertices')';
shape0.faces=[1:8];

patch(shape)
% axis equal
% pause

%% eu Forward integration

u1_eu(1)=80*pi/180; %u1, initial theta
u2_eu(1)=5*pi/280; %u2, initial omega
u3_eu(1)=0;         %u3, initial y
u4_eu(1)=10;         %u4, initial vy
u5_eu(1)=0;         %u5, initial x

t=0;j=1;
dt=0.01;
t_stop=5;


%% setup the animation figure
figure(1);hold off
while t<t_stop
  
    u1_eu(j+1)=u1_eu(j)+u1_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j))*dt;  
    u2_eu(j+1)=u2_eu(j)+u2_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j))*dt;
    u3_eu(j+1)=u3_eu(j)+u3_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j))*dt;  
    u4_eu(j+1)=u4_eu(j)+u4_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j))*dt;
    u5_eu(j+1)=u5_eu(j)+u5_prime(u1_eu(j),u2_eu(j),u3_eu(j),u4_eu(j))*dt;
    
    theta=u1_eu(j);
      
   
    shape.vertices=([cos(theta) -sin(theta);sin(theta) cos(theta)]*shape0.vertices')';%+[-x*cos(u1_eu(j))+u5_eu(j) u3_eu(j)]
    shape.vertices(:,1)=shape.vertices(:,1)+-x*cos(u1_eu(j))+u5_eu(j);
    shape.vertices(:,2)=shape.vertices(:,2)+u3_eu(j);

    
    shape.faces=[1:8];

    
    clf
    patch(shape)
  
    axis equal
    axis([-2 20 -5 5]);
    pause
    
%     polar(u1_eu(j+1)-pi/2,l,'o');hold on
%     
%     polar([0, u1_eu(j+1)-pi/2],[0, l],'r')
%     
%     shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
%     shape.faces=[1:5];
%     patch(shape);
%     
%     polar(u1_eu-pi/2,ones(1,length(u1_eu))*l,'y:');hold off
%     pause(.0001)
    t=t+dt;
    j=j+1;
end


% %% plotting 
figure(2);hold on
plot(u1_eu,'r')
plot(u2_eu,'g')
legend('Theta','Omega')

figure(3);hold on
plot(u3_eu,'r')
plot(u4_eu,'g')


%polar(u1_eu,ones(1,length(u2_eu))*l)

% figure(2);hold on
% plot(v_eu,'b')











