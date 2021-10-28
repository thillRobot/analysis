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
   0    0    -1     2.04]
b=[40.8; 0.8; 0.8; 200.8];
x_check=inv(A)*b

tic
n=length(A(1,:)); %dimension of square matrix

e(1)=0;
f(1)=A(1,1);
g(1)=A(1,2);
for p=2:n-1
    
    e(p)=A(p,p-1);
    f(p)=A(p,p);
    g(p)=A(p,p+1);
    
end
e(n)=A(n,n-1);
f(n)=A(n,n);
g(n)=0;





% step 1 - elimination
for k=2:n
    fact=e(k)/f(k-1);
    f(k)=f(k)-fact*g(k-1);
    b(k)=b(k)-fact*b(k-1);
end


%show the new matrix
% C=zeros(n,n);
% C(1,1)=f(1);
% C(1,2)=g(1);
% for p=2:n-1
%     
%     C(p,p-1)=e(p);
%     C(p,p)=f(p);
%     C(p,p+1)=g(p);
% 
% end
% C(n,n-1)=e(n);
% C(n,n)=f(n);
% C

% ttu_lu(C)



%step 3 - back sub 
x(n)=b(n)/f(n);
for k=1:n-1
  
    x(n-k)=(b(n-k)-g(n-k)*x(n-k+1))/f(n-k);
    
end
toc

x'

