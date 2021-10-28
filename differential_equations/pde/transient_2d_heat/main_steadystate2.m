%%
% ME3001-001 - Spring 2017
% Tristan Hill - 04/19/2017
% 2D Steady State Heat w/ the Finite Difference Method
%%
clear variables;close all;clc

%% define constant params

% Pure Aluminum @ 300K from Incropera H.T. - pg. 68
rho=2702; %(kg/m^3) 
cp=903;   %(J/kg-K)
k=237;    %(W/m-K)  

alpha=k/(rho*cp); %(m^2/s)

dx=0.1;
dz=0.1;
dt=0.1;

sx=k*dt/dx^2;
sz=k*dt/dz^2;

% boundary conditions 
Tl=100; %temp of left boundary (x=0)
Tr=500;
Tb=100;
Tt=500;

A=[ 4 -1  0  0 -2  0  0  0  0  0  0  0  0  0  0  0
   -1  4 -1  0  0 -2  0  0  0  0  0  0  0  0  0  0
    0 -1  4 -1  0  0 -2  0  0  0  0  0  0  0  0  0
    0  0 -1  4  0  0  0 -2  0  0  0  0  0  0  0  0 
   -1  0  0  0  4 -1  0  0 -1  0  0  0  0  0  0  0 
    0 -1  0  0 -1  4 -1  0  0 -1  0  0  0  0  0  0 
    0  0 -1  0  0 -1  4 -1  0  0 -1  0  0  0  0  0 
    0  0  0 -1  0  0 -1  4  0  0  0 -1  0  0  0  0
    0  0  0  0 -1  0  0  0  4 -1  0  0 -1  0  0  0 
    0  0  0  0  0 -1  0  0 -1  4 -1  0  0 -1  0  0 
    0  0  0  0  0  0 -1  0  0 -1  4 -1  0  0 -1  0  
    0  0  0  0  0  0  0 -1  0  0 -1  4  0  0  0 -1
    0  0  0  0  0  0  0  0 -2  0  0  0  4 -1  0  0 
    0  0  0  0  0  0  0  0  0 -2  0  0 -1  4 -1  0  
    0  0  0  0  0  0  0  0  0  0 -2  0  0 -1  4 -1 
    0  0  0  0  0  0  0  0  0  0  0 -2  0  0 -1  4 ];

B=[Tl;0;0;Tr ; Tl;0;0;Tr ; Tl;0;0;Tr ; Tl;0;0;Tr];

T=inv(A)*B;

m=4;  %number rows
n=4;  %number cols


figure(1);hold on 

T= [T' Tl Tr Tt Tb];
T_color= mapminmax(T,1,64);

axis([0 n+1 0 200])
colormap('hot')
cmap =colormap;

k=1;
for i=1:m
    for j=1:n
    
        T_grid(m-i+1,j)=T(k);
        
        plot(j,i,'ko','MarkerFaceColor',cmap(round(T_color(k)),:))
        
        k=k+1;
    end
end

axis([0 n+1 0 m+1])
grid on

