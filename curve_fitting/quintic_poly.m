% ME3001, Tennessee Technological University
% Tristan Hill, April 03, 2024
% cubic polynomial interpolation

clear variables;close all;clc

% define the end point conditions
% start position
x0=1;
y0=2;
% start slope
y0p=0;

% mid positions
x1=2
y1=2.5

x2=3
y2=5

% end position
x3=4;
y3=5.5;
% end slope
y1p=0;

% put points in array for plotting
xpoints=[x0 x1 x2 x3];
ypoints=[y0 y1 y2 y3];

% % start and end conditions as linear system
% A=[1 x0 x0^2 x0^3
%    0 1 2*x0 3*x0^2
%    1 x1 x1^2 x1^3
%    0 1 2*x1 3*x1^2];
% % known values at start and end as known vector
% b=[y0 ;y0p ;y1 ;y1p];
% 
% % solve for the coefficients of the cubic interpolation polynomial
% C=inv(A)*b;
% 
% % compute points on the curve with resulting coefficients
% xpoly=x0:.1:x1;
% ypoly=C(4)*xpoly.^3+C(3)*xpoly.^2+C(2)*xpoly+C(1);

% show the resulting polynomial 
figure(1);hold on

% plot(xpoly,ypoly)
plot(xpoints,ypoints,'o')
grid on 
xlabel('x')
ylabel('y')
title('Cubic Polynomial Interpolation')
axis([x0-1 x3+1 y0-1 y3+1]) % set axis range with some buffer
