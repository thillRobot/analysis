function [ f ] = fun( r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    global h s
    
    f=pi*r*(h^2+r^2)^(1/2)-s;

end

