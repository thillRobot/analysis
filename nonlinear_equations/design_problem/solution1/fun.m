function [ F ] = fun( R )

    H=1;  %(m)
    S=25; %(m^2)
    
    F=pi*R*(H^2+R^2)^(1/2)-S;

end

