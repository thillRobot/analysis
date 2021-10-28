%% ME 3001 - Tennessee Technological University
% Tristan Hill - 6/07/2016 - 09/06/2017
% Roots of Non-Linear Equations
% Incremental Search Method
% Lecture Example - a simple polynomial
%%
close all; clear all; clc

%% plot for graphical verification
x=-.1:0.01:.1;
for i=1:length(x)

    y(i)=x(i)^3-0.165*x(i)^2+3.993e-4;
    
end

figure(1)
plot(x,y)
grid on

%% solve with the Newton-Raphson Method
xo=-0.2;
dx=.001;

x_curr=xo;

y_curr=(x_curr^3-0.165*x_curr^2+3.993e-4); 
y_prev=y_curr;

while y_curr*y_prev>0
    
    y_prev=y_curr;
    
    y_curr=(x_curr^3-0.165*x_curr^2+3.993e-4);
    
    x_curr=x_curr+dx;

end

root=x_curr

%% double check with the FZERO function
root_check=fzero(@(x_check) x_check^3-0.165*x_check^2+3.993e-4,xo)
