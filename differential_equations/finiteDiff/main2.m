%% ME 3001 - Mechanical Enigineering Analysis
%
%  Tristan Hill - 6/24/2014
%
%  Finite Difference Method 
%  Example Problem - free motion of mass spring
%
%%
close all;
clear all; 
clc

n =10; % number of values in function 
t=linspace(0,4*pi,n); 
h=t(2)-t(1); % distance between x values , remains constant
x=zeros(size(t));
k=5; %kg/m
m=10; %kg
w=sqrt(k/m);

% compute value at intitial condition
x(1)=1;
x(2)=(2-(k/m)*h^2)*x(1)/2;

for i=2:n-1
    x(i+1)=(2-(k/m)*h^2)*x(i)-x(i-1);
end

for i=1:n
    xe(i)=cos(w*t(i));
end

figure(1);hold on 
plot(t,xe,'r')
plot(t,x,'b')



