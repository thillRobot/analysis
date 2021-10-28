%% ME 3001 - Mechanical Engineeing Analysis
% 
% Tristan Hill - 6/22/2014 
%
% 1D Heat Equation - Finite Diff. Approx 
% leads to a Tridiagonal System - solve with TMDA
% Problem from Chapra - Applied Numerical Methods w/ MATLAB
%
%% 
close all; clear all; clc

L = 10;     %length of the bar in meters
n = 100;    %number of nodes in bar
dx = L/n;   %length of a node
x0 = 0;     %location of first node
y0 = .5;
h = .3;     %height of bar
hp  = .05;  %heat transer coeff (m^-2)
T0=0;
Tn=100;
Ta=100;
a=2+hp*dx^2;

% e,f,g notation for our Tridiagonal Matrix
for i=1:n
    
    e(i)=-1;
    f(i)=a;
    g(i)=-1;
    b(i)=hp*dx^2*Ta;
    
    if i==1
        e(i)=0;
        b(i)=hp*dx^2+T0;
    elseif i==n
        g(i)=0;
        b(i)=hp*dx^2+Tn;
    end
end

% solve the system using thomas alg. (TDMA)
for k=2:n
    fact=e(k)/f(k-1);
    f(k)=f(k)-fact*g(k-1);
    b(k)=b(k)-fact*b(k-1);
end
x(n)=b(n)/f(n);

for k=1:n-1
    x(n-k)=(b(n-k)-g(n-k)*x(n-k+1))/f(n-k);  
end

x = [T0 x Tn] ;
T=mapminmax(x,1,64);



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
        wall.facecolor =cmap(round(Tn)+1,:);
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
