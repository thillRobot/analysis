
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Newton Raphson Method%
%%
clear all
close all
clc

%% Show the Curve Graphically 

xmin=-.5;   %show curve from xmin to xmax
xmax=.5;
delx=.01;
x=xmin:delx:xmax; % from xmin to xmax, in steps of delx


for i=1:length(x)
    y(i)=fun(x(i));
end



figure(1);hold on 
plot(x,y);
title('Newton Raphson Method')
grid on

% %% find the root using the Newton Raphson method 
searching=1;
tol=.00001;

x_curr=-.5;

cnt=1;
while(abs(fun(x_curr))>tol)

    x_next=x_curr-fun(x_curr)/dfun(x_curr);
    
    plot(x_curr,fun(x_curr),'b*')
    plot(x_next,0,'g*')
    plot([x_curr x_next],[fun(x_curr) 0],'r')
   
    x_curr=x_next; % move x to improved guess
    cnt=cnt+1;
    pause
end

disp('tolerance reached, ending the search')
fprintf('the root was found at x=%.3f',x_curr)

%% find the root using the Secant method 
searching=1;

x_prev=-.5; % need 2 inital guess (diff method)
x_curr=x_prev+.01;


figure(2);hold on 
title('Secant Method')
plot(x,y);
grid on

idx=1;
while(abs(fun(x_curr))>tol)

    x_next=x_curr-fun(x_curr)*(x_curr-x_prev)/(fun(x_curr)-fun(x_prev));
    
    plot(x_curr,fun(x_curr),'mo')
    plot(x_next,0,'co')
    plot([x_curr x_next],[fun(x_curr) 0],'r')
    plot([x_prev x_curr],[fun(x_prev) fun(x_curr) ],':r')
   
    
    x_prev=x_curr;
    x_curr=x_next; %prev=curr
    
    idx=idx+1
    pause
end

root=x_curr;
disp('tolerance reached, ending the search')
fprintf('the root was found at x=%.3f',root)
