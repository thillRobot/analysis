%% ME 3001 - Tennessee Technological University
% Tristan Hill - 6/07/2016 - 09/06/2017 - 09/10/2019
% Roots of Non-Linear Equations
% Incremental Search Method and Newton Raphson Method
% Homework Problem 2 Setup - a mechanical design problem
%%
close all; clear all; clc

%% define global vars(constants)
s=25;       %(m^2)
h=1;         %(m)
tol=0.1;     %(m^2)

%% plot for graphical verification
r_plot=.1:.01:5;

for i=1:length(r_plot)
    f_plot(i)=fun(r_plot(i));
end
figure(1)
plot(r_plot,f_plot)
grid on

%% Incremental Search Method
xo=1;

root_inc=xo;
dx=0.01;

while fun(root_inc)*fun(root_inc+dx)>0

    root_inc=root_inc+dx;

end
root_inc

%% Newton-Raphson Method
root_NR=xo;
while abs(fun(root_NR))>0.1

    root_NR=root_NR-fun(root_NR)/dfun(root_NR);
    
end
root_NR

%% FZERO Function Method (built-in to MATLAB)
root_check=fzero(@fun,xo)

%% Print the answer in the command window
fprintf('\nThe Surface Area is %5.3f (m^3) and the Height is %5.3f (m)\n',s,h)
fprintf('The Radius was found using Incremental Search as %5.3f (m) to a tolerance of %4.2f (m^2).\n',root_inc,tol)
fprintf('The Radius was found using Newton-Raphson as %5.3f (m) to a tolerance of %4.2f (m^2).\n',root_NR,tol)
fprintf('The Radius verified using fzero() as %5.3f (m)\n\n',root_check)
