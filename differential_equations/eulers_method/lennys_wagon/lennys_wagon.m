% names and such
clear variable;clc;close all

m=100
c=1.5
v0=2.0

dt=2
tstop=1000
t=0:dt:tstop

v_analytical=v0*exp(-c/m*t)

tnum=t(1)
vnum(1)=v0
for i=1:1000
    % i
    % v(i)
    % v(i)+-c/m*v(i)*dt
    vnum(i+1)=vnum(i)+-c/m*vnum(i)*dt;
    tnum(i+1)=tnum(i)+dt;
end


figure(1);hold on
plot(t,v_analytical)
plot(tnum,vnum,'*')


