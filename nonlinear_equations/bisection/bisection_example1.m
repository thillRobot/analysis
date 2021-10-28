%% 
% ME3001 - Tennessee Technological University
% Tristan Hill, September 12, 2019 - September 16, 2020
% Module 2 - Non Linear Equations
% Topic 5 - Bisection Method - Example 1
%%
close all; clear all; clc

% Show the Curve Graphically - for estimation and choosing starting locations

xmin=-2.0;   %show curve from xmin to xmax
xmax=5.0;
delx=.01;
x=xmin:delx:xmax; % from xmin to xmax, in steps of delx

for i=1:length(x)
    y(i)=example_fun(x(i));
end

figure(1);hold on 
plot(x,y);

title('Bisection Method - Example 1')
grid on

% solve 'example_fun' with the bisection method   

tol=.1;
x_left=0;
x_right=3;
x_center=(x_left+x_right)/2;

while ( abs(example_fun(x_center))>tol )

     % print the center value each iteration
     x_center=(x_left+x_right)/2
    
    
    if ((example_fun(x_left)*example_fun(x_center))>0)
        x_left=x_center;
    else
        x_right=x_center;
    end
    

end
% print the center value after tolerance is reached
x_center

% use MATLABs built-in solver 'fzero'
% make sure to use the @ symbol unless your function is 'anonymous'
x0=1.5;
x_check=fzero(@example_fun,x0) 



%% these are functions below

% returns value of function
function [ out_val ] = example_fun( in_val )
    
    out_val=in_val^3-5*in_val^2+10; % this is just an example fn.

end