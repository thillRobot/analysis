%% ME3001 
% Model of A Mass Spring on a moving base(in hand)
% for the haptic feedback pheonix joystick
% Tristan Hill + Matthew Powelson
%%
clc
clear all
close all

m=1;    %mass of mass (kg)
k=10;    %spring constant (N/m)
% c=2;   %damping coefficient (N/m/s)
g=9.8;  %m/s^2
l=.25;     %unstrectched length of spring (m)

t=0;      %initital time (s)
dt=.01;   %time step (s)

scl=1; %scale factor for quiver arrows

%forced vibration - motion of the hand
yh=ones(1,10000);

% %initialize the falcon
% h = haptikdevice;


%sine input
% p=0;dp=.05;
% for i=1:length(yh)
%     yh(i)=1*sin(p);
%     p=p+dp;
% end

%step input
p=0;dp=.05;
for i=1:length(yh)
    
    if t<3
        yh(i)=1;
    else
        yh(i)=2;
    end
    p=p+dp;
    t=t+dt;
end

%pre-allocate arrays for speed
ay=zeros(1,length(yh));
vy=zeros(1,length(yh));
ym=zeros(1,length(yh));

%initial conditions
del_st=m*g/k;
ay(1)=0; 
vy(1)=0;
ym(1)=yh(1)-(del_st+l);

%find c based on damping ratio
dr=.5;   %underdamped 
% dr=1;  %critically damped
% dr=2;  %overdamped
c=dr*2*sqrt(m*k);

figure(1)
%show an animation in the loop
i=1;

for i=1:length(yh)
    %Read falcon position
%     pos = read_position(h);
%     yh(i) = pos(2);
    
    %calculate accel from Newton's 2nd Law
%     ay(i+1)=(-k/m*(ym(i)-(l+yh(i))) - vy(i)*c/m + g);
    %   
    ay(i+1)=k/m*(yh(i)-ym(i)-l)-2*g-c/m*vy(i);
    %Sig(Fy)=mass(ay)

    Fm=ay(i+1)/m  % here is the total force on the hand 
    Fh=-ay(i+1)/m;   % notice that it is opposite of force on mass
    
    %intgrate accel into vel
    vy(i+1)=vy(i)+ay(i)*dt;
    
    %intgrate vel into pos
    ym(i+1)=ym(i)+vy(i)*dt;


    %show the animation - the negative signs come from the fact that
    %i derived this with y pointing downward 
    hold off
    plot(0,ym(i),'o','MarkerSize',15)
    hold on
    plot(0,yh(i),'p','MarkerSize',15)    
%     
%     quiver(0,-ym(i),0,-Fm*scl)
%     quiver(0,-yh(i),0,-Fh*scl)
    
    grid on
    
    axis([-.5 .5 -10 10])
%     pause(dt) %pause for graphics
    pause(.000001)% without this the figure isnt shown
%     pause
    t=t+dt;
    
    %Write to the falcon
%     write(h,[0 Fm*0.25 0]);
    
end

% show the whole thing after the fact
figure(2) 
plot(y)

% %Close the falcon
% close(h);
% clear h