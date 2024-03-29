%%
% ME 3001-001 , Mechanical Engineering Analysis, Summer 2014, 
% Tristan Hill, 6/12/2014
%
% Systems of Linear Equations 
%
% A Simple Truss Example, Static Analysis
%%
clear all
close all

% define useful conversion factors 
deg2rad=pi/180;
rad2deg=1/deg2rad;

% define knowns 
l=10; % length of truss member
P=150; %load in kN (N*10^3) 
t= 40*deg2rad;% truss angle
tp=90*deg2rad;% angle of load
% calculate reaction forces at pins on pylons
Ry1=P/2;
Rx1=0;

maxStr=0;
minStr=1000;

for t=0:.1:pi/4
    %this is a shortcut, to save space
    ct=cos(t);
    st=sin(t);

    % define Coefficient matrix
    A=[-st  0   0  0   0  0   0 
       -ct -1   0  0   0  0   0 
        ct  0 -ct -1   0  0   0
        st  0  st  0   0  0   0
        0 0 -st  0 -st  0   0
        0  1   ct  0 -ct -1   0
        0  0   0  1  ct  0  -ct ];
 
     % define vector of knowns, b
 
    b=[-Ry1 ;Rx1 ; 0; P*cos(tp); P*sin(tp); 0; 0] ;
    x= A\b
    
    if abs(max(x))>abs(maxStr)
        maxStr=max(x);
        maxT=t;
    end
    
    if abs(min(x))<abs(minStr)
        minStr=min(x);
        minT=t;
    end
    
end