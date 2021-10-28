function [x,A,B] = ttu_GE(A,B)
%UNTITLED Naive Gaussian Elimination
%   Tristan Hill 
    [m,n]=size(A);

    % perform the forward elimination on A
    for h=1:n-1      % h index or subscript of the variable whose coefficients will be zeroed
        for i=h+1:n
           xmult=A(i,h)/A(h,h);
           for j=h:n %start at h+1 to save time but the zeros wont show
                A(i,j)=A(i,j)-xmult*A(h,j);
           end
           B(i)=B(i)-xmult*B(h);
        end

    end

    % perform the backwards substituion to find x
    x(n)=B(n)/A(n,n); %last unknown is different
    for i=1:n-1 %notice the (n-1) to count backwards
        ssum=B(n-i);
        for j=(n-i)+1:n
            ssum=ssum-A((n-i),j)*x(j);
        end
        x((n-i))=ssum/A((n-i),(n-i));
    end
end

