%%
% TTU - ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - 6/29/2016 - Updated: 09/28/2020
% Naive Gaussian Elmination - quiz 3 solution code
%%
clear variables;clc

A_b=[ 0 9 1 4
      14 5 -1 6
      3 12 2 15]
  %vector of knowns
A=A_b(:,1:3);
b=A_b(:,4);

x_check=inv(A)*b;

[A,b]=partial_pivot(A,b);
A
b

[m,n]=size(A);
%% perform the forward elimination on A
for h=1:n-1      % h index or subscript of the variable whose coefficients will be zeroed
    
    for i=h+1:n

       xmult=A(i,h)/A(h,h);
       for j=h:n %start at h+1 to save time but the zeros wont show
            A(i,j)=A(i,j)-xmult*A(h,j);
       end
       b(i)=b(i)-xmult*b(h);
    end
    
    
end
A;
    
%% perform the backwards substituion to find x
x(n)=b(n)/A(n,n); %last unknown is different
for i=1:n-1 %notice the (n-1) to count backwards
    ssum=b(n-i);
    for j=(n-i)+1:n
        ssum=ssum-A((n-i),j)*x(j);
    end
    x((n-i))=ssum/A((n-i),(n-i));
end
x;

    
   
