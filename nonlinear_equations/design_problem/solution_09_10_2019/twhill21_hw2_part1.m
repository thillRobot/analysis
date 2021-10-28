%% ME 3001 - Tennessee Technological University
% Tristan Hill - 6/07/2016 - 09/06/2017 - 09/10/2019
% Roots of Non-Linear Equations
% Incremental Search Method and Newton Raphson Method
% Homework Problem 2 Setup - a mechanical design problem
%%
close all; clear all; clc

%% define constants
p.s=25;       %(m^2)
p.h=1;         %(m)
p.tol=0.1;     %(m^2)


%% plot for graphical verification
r_range=0:.01:3;

for i=1:length(r_range)
    f_range(i)=f_fun(r_range(i),p);
end
figure(1)
plot(r_range,f_range)
grid on

%% Incremental Search Method
xo=1;

root_inc=xo;
dx=0.01;

while f_fun(root_inc,p)*f_fun(root_inc+dx,p)>0

    root_inc=root_inc+dx;

end
root_inc;

%% Newton-Raphson Method
root_NR=xo;
while abs(f_fun(root_NR,p))>p.tol

    root_NR=root_NR-f_fun(root_NR,p)/df_fun(root_NR,p);
    
end
root_NR;

%% FZERO Function Method (built-in to MATLAB)
o=optimset('Display','off');
root_check=fzero(@f_fun,xo,o,p);

%% Print the answer in the command window
fprintf('\nThe Surface Area is %5.3f (m^3) and the Height is %5.3f (m)\n',p.s,p.h)
fprintf('The Radius was found using Incremental Search as %5.3f (m) to a tolerance of %4.2f (m^2).\n',root_inc,p.tol)
fprintf('The Radius was found using Newton-Raphson as %5.3f (m) to a tolerance of %4.2f (m^2).\n',root_NR,p.tol)
fprintf('The Radius verified using fzero() as %5.3f (m)\n\n',root_check)
