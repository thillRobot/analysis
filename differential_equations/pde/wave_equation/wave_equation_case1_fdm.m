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

c=9;       % wave speed
a=sqrt(c);

L=pi;      % length of string (m)
n=10;     % number of divisions, n nodes, (n-1) divisions
dx=L/(n-1);    % increment of x dimension,(m) 
x=0:dx:L;  % x-coordinate
Uleft=0;   % left boundaries
Uright=0;  % right boundaries

tstop=2;   % calculation time (sec)
dt=.001;  
time=0:dt:tstop;

r2=c*dt^2/dx^2; % Courant Number

% define the initial profile, f(x)
f(1)=Uleft;     %boundary condition at x=0
f(n)=Uright;  %boundary condition at x=L

% location of plucked point
Up=pi/2;  % vertical dist
xp=L/2; % horiz dist

% define the rest of points on string (triangular - as if pulled tight)
for i=2:n-1
    
    m1=(Up-Uleft)/xp;
    b1=Uleft;
    
    m2=(Uright-Up)/(L-xp);
    b2=-m2*L;
    
    if x(i)<=xp
        f(i)=m1*x(i)+b1;  % slope intercept before plucked point
    else
        f(i)=m2*x(i)+b2;  % slope intercept after plucked point
    end
    g(i)=0; % initial velocity of string is zero
end

U(:,1)=f; %first profile is f

% second profile is must defined using intial conditions and 'ghost nodes'
for i=2:n-1

    U(i,2)=1/2*(r2*U(i-1,1)+2*(1-r2)*U(i,1)+r2*U(i+1,1))+dt*g(i);
    
end

figure(1)
plot(x,U,'p')
axis equal
axis([0 L -2 2])

% now you can define the rest of the profiles as time goes by
for j=2:length(time)
     
    for i=2:n-1

        U(i,j+1)=r2*U(i-1,j)+2*(1-r2)*U(i,j)+r2*U(i+1,j)-U(i,j-1);

    end 
            
    plot(x,U(:,j))
    axis equal
    axis([0 L -2 2])
    
    pause(.001)
end

