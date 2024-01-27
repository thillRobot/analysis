%% 
% ME3001 - Tennessee Technological University
% Tristan Hill, September 12, 2019 - September 04, 2020 - January 27, 2024
% Module 2 - Non Linear Equations
% Topic 3 - Newton Raphson Method - demo with graphics
%%
clear variables;close all;clc

%% Show the Curve Graphically 

xmin=-5.0;   %show curve from xmin to xmax
xmax=10.0;
delx=.01;
x=xmin:delx:xmax; % from xmin to xmax, in steps of delx

for i=1:length(x)
    y(i)=example_fun(x(i));
end

figure(1);hold on 
plot(x,y);
title('Newton Raphson Method')
grid on

%% find the root using the Newton-Raphson method 
tol=.001;

% choose intial guess
x0=input('Enter a starting location (x value): ');
x_curr=x0; % start the search and save the initial guess
fprintf('Starting Newton-Raphson Method\n')
cnt=1;
while(abs(example_fun(x_curr))>tol)

    x_next=x_curr-example_fun(x_curr)/example_dfun(x_curr); %Newton-Raphson Equation
    
    plot(x_curr,example_fun(x_curr),'b*') % make a graphic 
    plot(x_next,0,'g*')
  
    plot([x_curr x_next],[example_fun(x_curr) 0],'r')
    plot([x_curr x_curr],[example_fun(x_curr) 0],':k')
     
    x_curr=x_next; % move x to improved guess
    cnt=cnt+1;
    pause(1) % pause for graphic
end

fprintf('Tolerance Reached -> Stopping Newton-Raphson Method\n')
fprintf('The root was found at x=%.3f\n',x_curr)
fprintf('The function value is f(%.3f)=%.5f\n',x_curr,example_fun(x_curr))

%% double check with the FZERO function
root_check=fzero(@example_fun,x0)


%% define functions below

% returns value of function
function [ out_val ] = example_fun( in_val )
    
    out_val=in_val^3-5*in_val^2+10; % this is just an example fn.

end

% returns derivative of function
function [ out_val ] = example_dfun( in_val )

    out_val=3*in_val^2-10*in_val; % this is the derivative of that fn.

end
