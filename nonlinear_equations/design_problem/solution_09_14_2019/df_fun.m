function [ dF ] = df_fun( R , P)

    H=P.h;  %(m)
    S=P.s;
    
    dF=pi*(H^2+2*R^2)/((H^2+R^2)^(1/2));

end

