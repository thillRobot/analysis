function [ answ ] = fv(zlocal,vlocal,factor)

    global L k_nl type m c Cd g
% k_nl=[255 149 4.88   %non linear spring force from cord (N/m)
%       204 111 4.88    %[k1 k2 x1] piecewise of two linear springs
%       162 77  4.88 ];
%     zlocal
%     L
%     factor
%     k_nl(type,1)
%     m

    k_nl(type,1)/m
    
    factor*(k_nl(type,1)/m)
    if (zlocal-L)<k_nl(type,3)
        
        kforce=factor*(k_nl(type,1)/m)*(zlocal-L);
    else
        kforce=factor*((k_nl(type,1)*k_nl(type,3))+k_nl(type,2)*(zlocal-L-k_nl(type,3)))/m;
    end


    answ= g- kforce - factor*(c/m)*vlocal -sign(vlocal)*(Cd/m)*vlocal^2; %dvlocal/dt= g - ...


end

