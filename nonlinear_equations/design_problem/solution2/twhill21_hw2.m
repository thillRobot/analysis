%% ME 3001 - Tennessee Technological University
% Tristan Hill - 6/07/2016
% Roots of Non-Linear Equations
% Newton Raphson and The Fixed Step Iterative Method
% 
% Homework 2 - a mechanical design problem
% Solution Code
%%
close all; clear all; clc

%% define global vars(constants)
global h s tol

s=100;       %(m^2)
h=1;         %(m)
tol=0.1;     %(m^2)

%% plot for graphical verification
r_plot=.1:.01:5;
for i=1:length(r_plot)
    f_plot(i)=fun(r_plot(i));
end
figure(1)
plot(r_plot,f_plot)

%% part 1 - Newton Raphson Method

%use Newton Rapshon to find
xo=.1;
root=tntech_newton_raphson(@fun,@dfun,xo,.1);
root_check=fzero(@fun,xo);

% print the answer in the command window

fprintf('\nThe Surface Area is %5.3f (m^3) and the Height is %5.3f (m)\n',s,h)
fprintf('The Radius was found using Newton Raphson as %5.3f (m) to a tolerance of %4.2f (m^2).\n',root,tol)
fprintf('The Radius verified using fzero() as %5.3f (m)\n\n',root_check)