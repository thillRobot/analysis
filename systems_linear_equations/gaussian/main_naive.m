%%
% ME 3001 - Mechanical Engineering Analysis
%
%% Naive Gaussian Elmination 

clear all
close all 
clc

%% Test Matrix A
A=[-15  10  5
    -5 -13  7
    13   4  2];

b=[10;12;23];

[n,n]=size(A);

%% perform the forward elimination on A
for k=1:n-1      % k index or subscript of the variable whose coefficients will be zeroed
    for i=k+1:n
       xmult=A(i,k)/A(k,k);
       for j=k:n %start at k+1 to save time
            A(i,j)=A(i,j)-xmult*A(k,j);
       end
       b(i)=b(i)-xmult*b(k);
    end
    
end

 %% perform the backwards substituion to find x
 
x(n)=b(n)/A(n,n);

for i=n-1:-1:1 %notice the backwards indexing
    ssum=b(i);
    for j=i+1:n
        ssum=ssum-A(i,j)*x(j);
    end
    x(i)=ssum/A(i,i);
end


    

