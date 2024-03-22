%%
% TTU - ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - 6/29/2016 - 02/22/2024
% Gaussian Elmination - with Pivoting - Example 2
%%
clear variables;clc

A=[1 2.6 1 5  %test matrix
   14 3 -13 12
   3 12 2  23
   3 4 67 1]
b=[4;6;15;2]   %vector of knowns

x = A\b      %use built in method to check results

[A,b]=partial_pivot(A,b)


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
A
    
%% perform the backwards substituion to find x
x(n)=b(n)/A(n,n); %last unknown is different
for i=1:n-1 %notice the (n-1) to count backwards
    ssum=b(n-i);
    for j=(n-i)+1:n
        ssum=ssum-A((n-i),j)*x(j);
    end
    x((n-i))=ssum/A((n-i),(n-i));
end


% for i=n-1:-1:1 % or you could use backwards indexing
%     ssum=b(i);
%     for j=i+1:n
%         ssum=ssum-A(i,j)*x(j);
%     end
%     x(i)=ssum/A(i,i);
% end

x
    

    
   
