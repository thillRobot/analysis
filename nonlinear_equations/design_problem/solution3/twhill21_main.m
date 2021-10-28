%% ME 3001 - Tennessee Technological University
% Tristan Hill - 1/25/2016
% Roots of Non-Linear Equations
% The Incremental Search Method
% 
% A mechanical design problem - Deisgn a Cone
%%
clear variables;close all;clc
%% Define the constants
global h % this will be know in all names spaces
h=1; %(m)
s=100; %(m^2)
tol=0.1; %(m^2)

%% look at the curve graphically
r=0:0.1:10; %define a range of r values
n=length(r);
for k=1:n
    f(k)=ttu_fun(r(k));
end
figure(1)
plot(r,f)

%% Solve with the Incremental Search Method

xo=3;
x_guess=3;
dx=0.01;

while ttu_fun(x_guess)*ttu_fun(x_guess+dx)>0
    x_guess=x_guess+dx;
end
root=x_guess;

%% solve with the built in 'fzero' function
root_check=fzero(@ttu_fun,3);

%% print the results in the command window
 
fprintf('\nThe Surface Area is %5.3f (m^3) and the Height is %5.3f (m)\n',s,h)
fprintf('The Radius was found with the Incremental Search as %5.3f (m) with dx=%4.2f (m^2).\n',root,dx)
fprintf('The Radius verified using fzero() as %5.3f (m)\n\n',root_check)
