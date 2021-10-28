function [ answ ] = fv( z,v,factor)

% 
% k_nl=[255 149 4.88   %non linear spring force from cord (N/m)
%       204 111 4.88    %[k1 k2 x1] piecewise of two linear springs
%       162 77  4.88 ];
%   

    if (z-L)<k_nl(type,3)
        
        kforce=factor*(k_nl(type,1)/m)*(z-L);
    else
        kforce=factor*(k_nl(type,1)*4.88)+k_nl(type,2)(z-L-x);
    end

    answ= g- kforce - factor*(c/m)*v -sign(v)*(Cd/m)*v^2; %dv/dt= g - ...


end

