function [x,A,B] = ttu_TDMA(A,B)
% TDMA Thomas Algorithm aka Tridiagonal Matrix Algorithm
%   Tristan Hill 

    [m,n]=size(A);

    e(1)=0;
    f(1)=A(1,1);
    g(1)=A(1,2);
    for i=2:n-1

        e(i)=A(i,i-1);
        f(i)=A(i,i);
        g(i)=A(i,i+1);

    end
    e(n)=A(n,n-1);
    f(n)=A(n,n);
    g(n)=0;

    % solve the system using thomas alg. (TDMA)
    % forward elimination
    for k=2:n
        fact=e(k)/f(k-1);
        f(k)=f(k)-fact*g(k-1);
        B(k)=B(k)-fact*B(k-1);
    end
    x(n)=B(n)/f(n);

    for k=1:n-1
        x(n-k)=(B(n-k)-g(n-k)*x(n-k+1))/f(n-k);  
    end
end

