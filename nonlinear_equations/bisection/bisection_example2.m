
%% 
% ME3001 - Tennessee Technological University
% Tristan Hill, September 12, 2019 - September 16, 2020
% Module 2 - Non Linear Equations
% Topic 5 - Bisection Method - Example 2
% this example show how to write a function to take functions as the 
% input to the bisection method - Cool!
%%
close all; clear all; clc

%% Show the Curve Graphically 

options.xmin=-2; % notice all these variables are in a 'structure'
options.xmax=5;
options.x0=-4;
options.delx=.01;
options.tol=.5;

x=options.xmin:options.delx:options.xmax; % from xmin to xmax, in steps of delx

for i=1:length(x)
    y(i)=example_fun(x(i));
    y_B(i)=example_fun_B(x(i));
end

figure(1);hold on 
plot(x,y);
plot(x,y_B,'k','LineWidth',1.0);hold on
plot(x,zeros(1,length(x)),'k','LineWidth',1.0)

title('Bisection Method - Example 2')
grid on


%% solve with the bisection method  - 'custom_bisection'

grid on
x_check=custom_bisection(@example_fun,options);
xlabel('t')

grid on
% x_check_B=custom_bisection(@example_fun_B,options);
% xlabel('t')




