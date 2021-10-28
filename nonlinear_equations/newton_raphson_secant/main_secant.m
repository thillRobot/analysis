
%% 
% ME3001-001, 6/5/2014, Tristan Hill, Tennessee Technological University
% 
% Finding Roots of non-Linear Equations
% 
% Secant Method (modified Newton Raphson Method)%
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


hold on 
figure(1);
plot(x,y);
grid on


%% find the root using the Secant method 
tol=.00001;

x_curr=-.5;
x_prev=-.6; % need 2 inital guess (diff method)
x_curr=x_prev+.01;

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
