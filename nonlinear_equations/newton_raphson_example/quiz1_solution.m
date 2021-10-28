%% 
% ME3001 - Tennessee Technological University
% Tristan Hill, September 12, 2019 - September 04, 2020
% Module 2 - Non Linear Equations
% Topic 3 - Newton Raphson Method 
%%
clear variables;close all;clc

%% Show the Curve Graphically 

g=9.8
m=85
c=13.7

xmin=0;   %show curve from xmin to xmax
xmax=60;
delx=.1;
x=xmin:delx:xmax; % from xmin to xmax, in steps of delx

for i=1:length(x)
    y(i)=example_fun(x(i),g,m,c);
end

figure(1);hold on 
plot(x,y);
title('Newton Raphson Method')
grid on


%% find the root using the Newton-Raphson method 
tol=.00001;

% choose intial guess
x_curr=1.5;
cnt=1;
while(abs(example_fun(x_curr,g,m,c))>tol)

    x_next=x_curr-example_fun(x_curr,g,m,c)/example_dfun(x_curr,g,m,c);
    
    plot(x_curr,example_fun(x_curr,g,m,c),'b*')
    plot(x_next,0,'g*')
  
    plot([x_curr x_next],[example_fun(x_curr,g,m,c) 0],'r')
    plot([x_curr x_curr],[example_fun(x_curr,g,m,c) 0],':k')
     
    x_curr=x_next; % move x to improved guess
    cnt=cnt+1;
    pause
end

fprintf('Tolerance Reached\n')
fprintf('The root was found at x=%.3f\n',x_curr)
fprintf('The function value is f(%.3f)=%.3f\n',x_curr,example_fun(x_curr,g,m,c))

%% define functions below

% returns value of function
function [ out_val ] = example_fun( in_val,G,M,C )
    
    out_val=G*M/C*(1-exp(-C/M*in_val))-50; % this is just an example

end

% returns derivative of function
function [ out_val ] = example_dfun( in_val,G,M,C )

    out_val=(-C/M)*G*M/C*-exp(-C/M*in_val); % this is the derivative

end
