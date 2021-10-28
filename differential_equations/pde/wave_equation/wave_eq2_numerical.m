%% ME 3001 - Mechanical Engineering Analysis
%
% Tristan Hill - Modified from Dr. Han - summer 2014
%                Modified again        - spring 2015
%                Modified again to be wave eq   
%                Once again in Fall 2019 - TWH
%
% Solving Linear, 2nd order Partial Differential Equations
%   using the Finite Difference Method 
%
% Example: A plucked string , the wave equation
%% 

clear variables
close all
clc

c=9;        % wave speed

L=pi;        % length of string (m)
n=400;       % number of divisions
dx=L/n;     % increment of x dimension,(m) 
x=0:dx:L;   % x-coordinate
Uleft=0;       % left boundaries
Uright=0;       % right boundaries

tstop=2;   % calculation time (sec)
dt=.8*dx/c;  % timestep based on 'Courant Friedrichs-Lewy condition
time=0:dt:tstop;

r2=c*dt^2/dx^2; % Courant Number

% define the initial profile, f(x)
f(1)=Uleft;    %boundary condition at x=0
f(n+1)=Uright;  %boundary condition at x=L

Up=1;
xp=L/4;


a=sqrt(c);
h=1.0;
b=4

for i=2:n

    if x(i)<=xp
        f(i)=h*sin(b*x(i));  % slope intercept bfore plucked point
    else
        f(i)=0;  % slope intercept after plucked point
    end
    g(i)=0;
end

U0=f;

U1(1)=Uleft;
U1(n+1)=Uright;
for i=2:n

    U1(i)=1/2*(r2*U0(i-1)+2*(1-r2)*U0(i)+r2*U0(i+1))+dt*g(i);
    
end

figure(1)
plot(x,U0)
plot(x,U1,'*')
axis([0 2 -2 2])
axis equal

U(1)=Uleft;
U(n+1)=Uright;

for j=1:length(time)
     
    for i=2:n

        U(i)=r2*U1(i-1)+2*(1-r2)*U1(i)+r2*U1(i+1)-U0(i);

    end 
        
    U0=U1;
    U1=U;
     
    plot(x,U)
    axis([0 2 -2 2])
    axis equal
    pause(.001)
end
