%% ME3001 - Mech. Engr. Analysis
%
%  Tristan Hill - 7/24/2014 
%
%  Systems of ODEs - Orbital Motion Problem - engr. guide to matlab (2nd
%  ed.)
%%
clc
clear all;
close all;

%define the system of 4 ODEs
orbit=@(t,x) [x(2)
              x(1)*x(4)^2-4*pi^2/x(1)^2;
              x(4)
              -2*x(2)*x(4)/x(1)];

%define the initial conditions (r(0) ,dr(0)/dtau, theta(0), d theta(0)/dtau) 
initcond=[2.0,0,0,1.5  %elliptical orbit
          1.0,0,0,2*pi  %circular orbit
          2,0,0,3];   %hyperbolic

colors=['r*';'b*';'g*'];      
figure(1)      
tspan=linspace(0,5,100); %setup the independent variable 
% for i=1:3
i=1; %choose boundary condition (determines orbit type)
%solve the system of ODEs defined in  the function orbit
[t45,x45]=ode45(orbit,tspan,initcond(i,:)');
polar(x45(:,3),x45(:,1),colors(i,:))
hold on


figure(2)
%use patch to create bodies m1 and m2
% nx2 array of vertices, n-num points on patch
r1=1;
r2=.1;
phi=linspace(0,2*pi,100);
for i=1:length(phi)
    mass1.vertices(i,:)=[r1*cos(phi(i)) r1*sin(phi(i))];
    polar(phi(i),5)
end
mass1.faces=1:length(mass1.vertices);
mass1.facecolor='blue';
mass1.edgecolor='black';
patch(mass1)

%% animate orbit
for j=1:length(t45)
    for i=1:length(phi)
        mass2.vertices(i,:)=[r2*cos(phi(i))+x45(j,1)*cos(x45(j,3)) r2*sin(phi(i))+x45(j,1)*sin(x45(j,3))];
    end
    mass2.faces=1:length(mass1.vertices);
    mass2.facecolor='red';
    mass2.edgecolor='black';
    patch(mass2)
    pause(.05)
end
axis equal


