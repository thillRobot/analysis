%%
% TTU - ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - 6/29/2016
% Naive Gaussian Elmination - homework 3 helper
%%
clear variables;clc

A=[2.04 -1    0     0 
   -1   2.04 -1     0
   0    -1    2.04  -1
   0    0    -1     2.04]
b=[40.8; 0.8; 0.8; 200.8];
  %vector of knowns

x_check = A\b      %use built in method to check results
tic

[n,n]=size(A);
%% perform the forward elimination on A
for h=1:n-1      % h index or subscript of the variable whose coefficients will be zeroed
    
    [A(h:n,h:n),b(h:n)]=partial_pivot(A(h:n,h:n),b(h:n));
    
    for i=h+1:n

       xmult=A(i,h)/A(h,h);
       for j=h:n %start at h+1 to save time but the zeros wont show
            A(i,j)=A(i,j)-xmult*A(h,j);
       end
       b(i)=b(i)-xmult*b(h);
    end

end
A
    
%% perform the backwards substituion to find x
x(n)=b(n)/A(n,n);

for i=1:n-1 %notice the (n-1) to count backwards
    ssum=b(n-i);
    for j=(n-i)+1:n
        ssum=ssum-A((n-i),j)*x(j);
    end
    x((n-i))=ssum/A((n-i),(n-i));
end

toc
% for i=n-1:-1:1 % or you could use backwards indexing
%     ssum=b(i);
%     for j=i+1:n
%         ssum=ssum-A(i,j)*x(j);
%     end
%     x(i)=ssum/A(i,i);
% end

x
    

    
   
