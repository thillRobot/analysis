function [ s ] = stress_fun_arch(d,t,p)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    
    s=(p.P*sqrt((p.B/2)^2+p.H^2))/(2*t*pi*d*p.H);

end

