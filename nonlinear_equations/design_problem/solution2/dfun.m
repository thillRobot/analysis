function [ f ] = dfun( r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    global h
    
    f=pi*(h^2+2*r^2)/((h^2+r^2)^(1/2));

end

