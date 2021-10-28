%% ME3001 - Mechanical Engineering Analysis
% 
% Systems of Linear Equations - Tridiagonal Systems - Thomas Algorithm
%
% Tristan Hill - 6/19/2014
% 
%%
clear all
close all

% %Chapra and Canale - example 11.1 - tridiagonal system
A=[2.04 -1    0     0 
   -1   2.04 -1     0
   0    -1    2.04  -1
   0    0    -1     2.04];
b=[40.8; 0.8; 0.8; 200.8];

n=length(A(1,:)); %dimension of square matrix

e=[0 -1 -1 -1 ];
f=[2.04 2.04 2.04 2.04];
g=[-1 -1 -1 0];

% step 1 - elimination
for k=2:n
    fact=e(k)/f(k-1);
    f(k)=f(k)-fact*g(k-1);
    b(k)=b(k)-fact*b(k-1);
end

%step 2 - back sub 
x(n)=b(n)/f(n);
for k=1:n-1
    
    k;
    n-k
    x(n-k)=(b(n-k)-g(n-k)*x(n-k+1))/f(n-k);
    
end



