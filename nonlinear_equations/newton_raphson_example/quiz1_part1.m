%% 
% ME3001 - Tennessee Technological University
% Tristan Hill, September 12, 2019 - September 04, 2020
% Module 2 - Non Linear Equations
% Quiz 1 - Solution 
%%
clear variables;close all;clc

%% Show the Curve Graphically 

g=9.8;
m=85;
c=13.7;

xmin=0;   %show curve from xmin to xmax
xmax=60;
delx=.1;

xg=xmin:delx:xmax; % from xmin to xmax, in steps of delx

for i=1:length(xg)
    
    yg(i)=quiz1_fun(xg(i),g,m,c);

end

figure(1);hold on 
plot(xg,yg);
title('Newton Raphson Method')
grid on

%% find the root using the Newton-Raphson method 
tol=.00001;

% choose intial guess
x(1)=5;

i=1;
while(abs(quiz1_fun(x(i),g,m,c))>tol)
    
    % calculate next guess x
    x(i+1)=x(i)-quiz1_fun(x(i),g,m,c)/quiz1_dfun(x(i),g,m,c);
    
    % draw a fancy picture
    plot(x(i),quiz1_fun(x(i),g,m,c),'b*')
    plot(x(i+1),0,'g*')
  
    plot([x(i) x(i+1)],[quiz1_fun(x(i),g,m,c) 0],'r')
    plot([x(i) x(i)],[quiz1_fun(x(i),g,m,c) 0],':k')
    
    % increment the counter
    i=i+1;
    % wait for a key press 
    pause
end

fprintf('Tolerance Reached\n')
fprintf('The root was found at x=%.3f\n',x(i))
fprintf('The function value is f(%.3f)=%.3f\n',x(i),quiz1_fun(x(i),g,m,c))

%% define functions below

% returns value of function
function [ out_val ] = quiz1_fun( in_val,G,M,C )
    
    out_val=G*M/C*(1-exp(-C/M*in_val))-50; % this is just an example

end

% returns derivative of function
function [ out_val ] = quiz1_dfun( in_val,G,M,C )

    out_val=(-C/M)*G*M/C*-exp(-C/M*in_val); % this is the derivative

end
