

%% ME 3001 - Systems of Linear Equations 
% Tristan Hill - 6/16/2014
% Jacobi Iterative Solution Method  
%%

% correct solution with backdivide (for verification purposes)
% A=[-5 -1 2
%     2 6 -3
%     2 1 7 ];
% 
% b=[1; 2; 32];
% 
% A\b;

% manual Jacobi Method

% write the equations above reformatted to solve for the unknowns
clc
clear all
close all

%anonynmous functions (defined in main())
f1=@(u2,u3) (-1/5)*(1+u2-2*u3);   %x1=fn(x2,x3)
f2=@(u1,u3) (1/6)*(2-2*u1+3*u3);  %x2=fn(x1,x3)
f3=@(u1,u2) (1/7)*(32-2*u1-u2);   %x3=fn(x1,x2)

% make the initial guess for x1,x2,x3
xi=0;
x1=f1(xi,xi);
x2=f2(xi,xi);
x3=f3(xi,xi);

x1_prev=xi;
x2_prev=xi;
x3_prev=xi;


tol=.00001;

%dummy vals to start loop
d1=1;d2=1;d3=1;

searching=1;
idx=1; 
while(d1>tol&&d2>tol&&d3>tol) %loop until deltas are less than tol
    
    x1=f1(x2,x3); % compute the improved estimate of the solution
    x2=f2(x1,x3);
    x3=f3(x1,x2);
    
    d1=abs(x1-x1_prev); % compute the delta, (differnce btwn interation)
    d2=abs(x2-x2_prev);
    d3=abs(x3-x3_prev);
    
    x1_prev=x1; % record x1 for next interation
    x2_prev=x2; % record x1 for next interation
    x3_prev=x3; % record x1 for next interation
    
    
    idx=idx+1; % index is used for counting purposes only
end




