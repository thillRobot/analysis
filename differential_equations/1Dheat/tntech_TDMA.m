function [x] = tntech_TDMA(e,f,g,b)
% TDMA Thomas Algorithm aka Tridiagonal Matrix Algorithm
%   Tristan Hill 

    n=length(f);

    % solve the system using thomas alg. (TDMA)
    % forward elimination
    for k=2:n
        fact=e(k)/f(k-1);
        f(k)=f(k)-fact*g(k-1);
        b(k)=b(k)-fact*b(k-1);
    end
    x(n)=b(n)/f(n);

    for k=1:n-1
        x(n-k)=(b(n-k)-g(n-k)*x(n-k+1))/f(n-k);  
    end
    
end

