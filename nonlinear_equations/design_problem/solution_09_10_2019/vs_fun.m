function [V, S ] = vs_fun( R , H, P)
    
    S=pi*R.*(H.^2+R.^2).^(1/2);
    V=pi*R.^2*H/3;

end

