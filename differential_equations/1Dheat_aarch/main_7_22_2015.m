%% ME 3001 - Mechanical Engineeing Analysis
% 
% TrisTinfn Hill - 6/22/2014 
%
% 1D Heat Equation - Finite Diff. Approx 
% leads to a Tridiagonal System - solve with TMDA
% Problem from Chapra - Applied Numerical Methods w/ MATLAB
%
%% 
close all; clear all; clc

L = 1;     %length of the bar in meters
dx = .01;   %length of a node
n=round(L/dx);
x0 = 0;     %location of first node
y0 = .5;
h = .3;     %height of bar
hp  = .05;  %heat transer coeff (m^-2)
T0=0;
Tl=200;
Tinf=50;
A=2+hp*dx^2;
B=hp*dx^2;
% e,f,g noTinftion for our Tridiagonal Matrix
for i=1:n
    
    a(i)=-1;
    b(i)=A;
    c(i)=-1;
    d(i)=B*Tinf;
    
    if i==1
        a(i)=0;
        d(i)=hp*dx^2+T0;
    elseif i==n
        c(i)=0;
        d(i)=hp*dx^2+Tl;
    end
end

% solve the system using thomas alg. (TDMA)
for k=2:n
    mult=a(k)/b(k-1);
    b(k)=b(k)-mult*c(k-1);
    d(k)=d(k)-mult*d(k-1);
end
x(n)=d(n)/b(n);

for k=1:n-1
    x(n-k)=(d(n-k)-c(n-k)*x(n-k+1))/b(n-k);  
end

x = [T0 x Tl] ;
T=mapminmax(x,1,64);

wallw=.21;
wallh=.8;

figure(1);hold on 
axis([-wallw L+wallw 0 1])
colormap('hot')
cmap =colormap;

for i=1:(length(T))
    if i==1
        wall.vertices=[x0-wallw y0-wallh/2
                   x0-wallw y0+wallh/2
                   x0 y0+wallh/2
                   x0 y0-wallh/2
                   x0-wallw y0-wallh/2  ];
        wall.faces   = 1:length(wall.vertices);
        wall.facecolor =cmap(round(T0)+1,:);%cmap(round(T(i)),:);
        patch(wall)
    elseif i==n+2
        wall.vertices=[L y0-wallh/2
                   L y0+wallh/2
                   L+wallw y0+wallh/2
                   L+wallw y0-wallh/2
                   L y0-wallh/2  ];
        wall.faces   = 1:length(wall.vertices);
        wall.facecolor ='black';
        patch(wall)
    else
        node.vertices=[x0+dx*(i-2) y0
                   x0+dx*(i-2) y0+h
                   x0+dx*(i-1) y0+h
                   x0+dx*(i-1) y0
                   x0+dx*(i-2) y0  ];
        node.faces   = 1:length(node.vertices);
        node.facecolor =cmap(round(T(i)),:);
        node.edgecolor ='white';
        patch(node)
    end
end
