%%
%
% Euler's Integration TTU 
%
%%
clear variables;clc;close all

%% define the slope function
m=20;
uo=0;
vo=1;

f_ext=1;

slope_u=@(u,v) v;
slope_v=@(u,v) f_ext/m;


%% graph exact solution 'theoretical' derived in class
% t=0:.01:1;
% r=-6;
% A=1;
% for k=1:length(t)
%     y_exact(k)=A*exp(r*t(k));
% end
% 

%% Eulers Forward integration

v_eulers(1)=vo
u_eulers(1)=uo

t=0;j=1;
dt=.01;
t_stop=30;
while t<t_stop
    v_eulers(j+1)=v_eulers(j)+dt*(slope_v(u_eulers(j),v_eulers(j)));
    
    u_eulers(j+1)=u_eulers(j)+dt*(slope_u(u_eulers(j),v_eulers(j)));
    t=t+dt;
    j=j+1;
end


%% plotting 
figure(1);hold on
plot(u_eulers,'r')
figure(2);hold on
plot(v_eulers,'b')











