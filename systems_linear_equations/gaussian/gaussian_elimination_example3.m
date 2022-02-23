%%
% ME 3001 - Mechanical Engineering Analysis
% THIS DOES NOT APPEAR TO BE WORKING CURRENTLY - fix pivoting
%%

clear all
close all 
clc

% Gaussian Elmination With Scaled Partial Pivoting 
% Also we will use pivoting index to avoid moving rows
% compare to method that moves rows if we have time

%% Test Matrix A
A=[3 -13 9 3
   -6 4 1 -18
   6 -2 2 4
   12 -8 6 10];

b=[-19
    -34
    16
    26];

x_check=inv(A)*b

[n,n]=size(A);
%% setup the 'index' and 'scale' arrays
for i=1:n
    smax=0;
    l(i)=i;  % this is the index array
    for j=1:n
        if abs(A(i,j))>smax %find the max in each row
            smax=abs(A(i,j));
        end   
    end
    S(i)=smax; % this is the scale array
end

%% perform the forward elimination on A
for k=1:n-1      % k index or subscript of the variable whose coefficients will be zeroed
    rmax=0;
    for i=k:n
        r=abs(A(l(i),k)/S(l(i))); % find the row with max ratio 
        if r>rmax                 % to use as pivot equation
            rmax=r;
            j=i;                  %save the position as j
        end
    end
   
    tmp=l(j);   %swap the values in the index array
    l(j)=l(k);
    l(k)=tmp;

    for i=k+1:n
       xmult=A(l(i),k)/A(l(k),k); 
%        A(l(i),k)=xmult;     % store the multiplier for later use in the zeros spots
       for j=k+1:n
            A(l(i),j)=A(l(i),j)-xmult*A(l(k),j);
       end
    end
    
end

A

%% perform the forward elimination on b
for k=1:n-1
    for i=k+1:n % use the stored multipliers to modify the b vector
        b(l(i))=b(l(i))-A(l(i),k)*b(l(k));
    end
end
x(n)=b(l(n))/A(l(n),n);

%% perform the backwards substitution to find x
for i=n-1:-1:1 %notice the backwards indexing
    ssum=b(l(i));
    for j=i+1:n
        ssum=ssum-A(l(i),j)*x(j);
    end
    x(i)=ssum/A(l(i),i);
end

x

    

