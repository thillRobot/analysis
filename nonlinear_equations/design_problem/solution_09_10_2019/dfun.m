function [ F ] = dfun( R )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    H=1;
    
    F=pi*(H^2+2*R^2)/((H^2+R^2)^(1/2));

end

