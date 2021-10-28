%% 
% ME3001 - Tennessee Technological University
% Tristan Hill, September 12, 2019 - September 09, 2020
% Module 2 - Non Linear Equations
% Topic 3 - Newton Raphson Method - Example 3 - I like this one best!
%%
clear variables;close all;clc

%% Show the Curve Graphically 

xmin=-2.0;   %show curve from xmin to xmax
xmax=2.0;
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
tol=.00001;

% choose intial guess
x(1)=-1.5;

i=1;
while(abs(example_fun(x(i)))>tol)
    
    % Calculate next guess of x with the Newton-Raphson formula!)
    x(i+1)=x(i)-example_fun(x(i))/example_dfun(x(i));
    
    % draw a fancy picture
    plot(x(i),example_fun(x(i)),'b*')
    plot(x(i+1),0,'g*')
  
    plot([x(i) x(i+1)],[example_fun(x(i)) 0],'r')
    plot([x(i) x(i)],[example_fun(x(i)) 0],':k')
    
    % increment the counter
    i=i+1;
    
    pause
end

fprintf('Tolerance Reached\n')
fprintf('The root was found at x=%.3f\n',x(i))
fprintf('The function value is f(%.3f)=%.3f\n',x(i),example_fun(x(i)))
%% define functions below

% returns value of function
function [ out_val ] = example_fun( in_val )
    
    out_val=in_val^3-5*in_val^2+10; % this is just an example fn.

end

% returns derivative of function
function [ out_val ] = example_dfun( in_val )

    out_val=3*in_val^2-10*in_val; % this is the derivative of that fn.

end
