% ME3001 - basic methods form finding roots of no lins
%
%
% Tristan Hill
%
% root finding for statically indeterminate compression

clear all
close all
clc

%% find the root using 'sign change incremental' method

L=1; 
P=100;

E1=69e9;
E2=200e9;

R1=3e-2;
R2=5e-2;

A1=pi*R1^2; 
A2=pi*R2^2-A1;

%inital guess
x=0;
%increment
dx=.001;
while sign(my_statics(x,L,P,E1,E2,A1,A2))==sign(my_statics(x+dx,L,P,E1,E2,A1,A2))        
    
    x=x+dx;
    
end

% plot(x,my_statics(x,param),'bp')
fprintf('the root was found at P1=%f',x)
 
%verify through algebra
% 
% P1=param.P*param.A1*param.E1/(param.A1*param.E1+param.A2*param.E2)
% P2=param.P-P1



