%% ME 3001 - Mechanical Engineeing Analysis
% 
% Tristan Hill - 6/22/2014 - 04/12/2017
%
% 1D Heat Equation - Finite Diff. Approx 
% leads to a Tridiagonal System - solve with TMDA
% Problem from Chapra - Applied Numerical Methods w/ MATLAB
%
%% 
close all; clear variables; clc

L = 10;     %length of the bar in meters
n = 10;    %number of nodes in bar
dx = L/n;   %length of a node
x0 = 0;     %location of first node
y0 = .5;
% h = .3;     %height of bar
hp  = .05;  %heat transer coeff (m^-2)
% dT0=200;
Ta=200;
Tn=200;

a=2+hp*dx^2;
b=hp*dx^2*Ta;

%% Solve the System with Naive Gaussian ELimination
% Set Up the Tri-Diagonal Matrix
A(1,1)=a;
A(1,2)=-2;
for i=2:n-1 
    for j=i-1:i+1       
        if j==i
            A(i,j)=a;
        else
            A(i,j)=-1; 
        end     
    end   
end
A(n,n)=a;
A(n,n-1)=-1;

% Set up the vector of knowns
B=ones(n,1)*b;
B(1)=b;
B(n)=b+Tn;

[m,n]=size(A);

%% Solve the System with  
tic
T_GE=ttu_GE(A,B);
toc

%% Solve the System with the Thomas alorithm (TDMA)

tic
T_TDMA=ttu_TDMA(A,B);
toc
   
%% Solve the System with back Divide

tic
T_BD=A\B;
toc

%% Solve with the Matrix Inverse

tic
T_INV=inv(A)*B;
toc

%% Draw a fancy picture
figure(1);hold on

plot(T_GE,'b*')
plot(T_TDMA,'r')
plot(T_BD,'go') 
plot(T_INV,'cd') 

% % %% 
% x = [T0 T_TDMA Tn 0 500] ;
% T=mapminmax(x,1,64);
% axis([0 n+1 0 200])
% 
% wallw=2
% wallh=5
% 
% figure(2);hold on 
% axis([-wallw L+wallw 0 1])
% colormap('hot')
% cmap =colormap;
% 
% for i=1:(length(T-2))
%     if i==1
% %         wall.vertices=[x0-wallw y0-wallh/2
% %                    x0-wallw y0+wallh/2
% %                    x0 y0+wallh/2
% %                    x0 y0-wallh/2
% %                    x0-wallw y0-wallh/2  ];
% %         wall.faces   = 1:length(wall.vertices);
% %         wall.facecolor =cmap(round(T0)+1,:);%cmap(round(T(i)),:);
% %         patch(wall)
%     elseif i==n+2
% %         wall.vertices=[L y0-wallh/2
% %                    L y0+wallh/2
% %                    L+wallw y0+wallh/2
% %                    L+wallw y0-wallh/2
% %                    L y0-wallh/2  ];
% %         wall.faces   = 1:length(wall.vertices);
% %         wall.facecolor =cmap(round(Tn)+1,:);
% %         patch(wall)
%     else
%         node.vertices=[x0+dx*(i-2) y0
%                    x0+dx*(i-2) y0+h
%                    x0+dx*(i-1) y0+h
%                    x0+dx*(i-1) y0
%                    x0+dx*(i-2) y0  ];
%         node.faces   = 1:length(node.vertices);
%         node.facecolor =cmap(round(T(i)),:);
%         node.edgecolor ='white';
%         patch(node)
%     end
% end
