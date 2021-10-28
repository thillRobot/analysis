
function [F ] = f_fun( R , P)

    H=P.h;  %(m)
    S=P.s;
    
    F=pi*R.*(H.^2+R.^2).^(1/2)-S;
    V=pi*R.^2*H/3;

end

