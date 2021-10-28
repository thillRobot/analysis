%%
%
% Euler's Integration TTU - for Double Pendulum Problem - Nonlin
%
%%
clear variables;clc;close all

%% define the slope function
m=2;g=9.8;l=42*(1/100)
uo=50*pi/180; %u=theta
vo=0; %let v = d(theta)/dt =du/dt
c=5; %drag
f_wind=5;
% f_ext=1;

slope_u=@(u,v) v;
slope_v=@(u,v) -g/l*sin(u)-c*v+f_wind*cos(u);


t1_dot=@() w1;
w1_dot=@() m2*l1*w1^2*sin(t2-t1)*cos(t2-t1)+m2*g*sin(t2)*cos(t2-t1)

t2_dot=@() w2;


%% graph exact solution 'theoretical' derived in class
% t=0:.01:1;
% r=-6;
% A=1;
% for k=1:length(t)
%     y_exact(k)=A*exp(r*t(k));
% end

%% let us draw a picture with patch
shape.vertices=[0,0,0
                10,0,0
                10,10,0
                0,10,0
                0,0,0];

shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
shape.vertices(:,2)=shape.vertices(:,2)+5; 
    
shape.faces=[1:5];


%% Eulers Forward integration

v_eulers(1)=vo;
u_eulers(1)=uo;

t=0;j=1;
dt=.1;
t_stop=30;

%% setup the animation figure
figure(1);hold on
while t<t_stop
    v_eulers(j+1)=v_eulers(j)+dt*(slope_v(u_eulers(j),v_eulers(j)));
    
    u_eulers(j+1)=u_eulers(j)+dt*(slope_u(u_eulers(j),v_eulers(j)));
    
    polar(u_eulers(j+1)-pi/2,l,'o');hold on
    
    polar([0, u_eulers(j+1)-pi/2],[0, l],'r')
    
    shape.vertices(:,1)=shape.vertices(:,1)+20 ;           
    shape.vertices(:,2)=shape.vertices(:,2)+5 ;
    shape.faces=[1:5];
    patch(shape);
    
    polar(u_eulers-pi/2,ones(1,length(u_eulers))*l,'y:');hold off
    pause(.1)
    t=t+dt;
    j=j+1;
end


% %% plotting 
% figure(1);hold on
% plot(u_eulers,'r')

polar(u_eulers,ones(1,length(u_eulers))*l)
axis square
axis([-l l -l 0]);
% figure(2);hold on
% plot(v_eulers,'b')











