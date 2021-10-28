function [ B ] = lin_map(A,Bmin,Bmax)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    B=(A-min(A))./(max(A)-min(A))*(Bmax-Bmin);


end

