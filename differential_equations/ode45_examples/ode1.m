%% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014
%
% Euler's and Crank-Nicolson Runga-Kutta methods
%
% Example 1 
%% 

clear all
close all 
clc

% ODE to solve: dy/dx=(1-x)y, initial condition y=1 at x=0
slopeFun=@(x,y) (1-x)*y;

h=0.1; %independent variable step size
xmin=0;
xmax=1;
x=xmin:h:xmax; %range of independent variable values

y(1)=1; %initial condition (crank nicolson)
y_eu(1)=1; %initial condition (eulers)


ye=exp(x-x.^2/2); %exact solution 

%% Euler's Method

for i=1:length(x)-1
   y_eu(i+1)=y_eu(i)+slopeFun(x(i),y_eu(i))*h; 
end

subplot(1,2,1)
plot(x,y,'x',x,ye)
title('dy/dx=(1-x)y')
legend('Euler','exact')
xlabel('x');ylabel('y')

tol=1e-5;
maxidx=100;

%% Crank-Nicolson Method

for i=1:length(x)-1
   yp=y(i);% initial guess for next y val. y(i+1) (predicted)
   idx=0;
   search=1;
   while search && idx<maxidx
       avgSlope=(slopeFun(x(i),y(i))+slopeFun(x(i+1),yp))/2; 
       yc=y(i)+avgSlope*h;  %corrected val for y(i+1)
       error=abs(yc-yp)/yp; 
       if error<tol         %if guess was good enough, move on
           y(i+1)=yc;
           search=0;
       else                 %if not, take the average of yp,yc, try again
           yp=0.5*(yp+yc);
           idx=idx+1;
       end
   end
end
    
subplot(1,2,2)
plot(x,y,'x',x,ye)
legend('C-N','exact')
xlabel('x');ylabel('y')

