function [V, S ] = fun( R , H)

%     H=1;  %(m)
%     S=25; %(m^2)
    
    S=pi*R.*(H.^2+R.^2).^(1/2);
    V=pi*R.^2*H/3;

end

