function [ w ] = weight_fun( d,t,p )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
      
    w=p.den*2*pi*d*t*sqrt((p.B/2)^2+p.H^2);

end

