function [S ] = s_fun( R )

    H=1;  %(m)
    
    S=pi*R.*(H.^2+R.^2).^(1/2);
    V=pi*R.^2*H/3;

end

