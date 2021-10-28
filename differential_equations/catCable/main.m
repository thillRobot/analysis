%% ME 3001 - Mechanical Engineering Analysis
%
%  Tristan Hill - Feb. 9 2015
%  The Catenary Cable Curve - Experimental Verification 
%%

clear all
close all
clc

in2m=2.54*10^-2;
% define the constants as global stucture
global con
con.W=(48e-3)*9.8; %kg
con.L=147*in2m;
con.w=con.W/con.L;
con.y0=5*in2m;

% sec 002
% con.x_meas=[0  12 24 36 48 60]*in2m;
% con.y_meas=[12 13 16 23 33 48]*in2m;

% sec001
con.x_meas=[0 23.5 40]*in2m;
con.y_meas=[5 11 22.5]*in2m;

%122b
% con.x_meas=[0 5 10 15 20 25]*in2m;
% con.y_meas=[4 4.1 5.5 8 14 20]*in2m;
%122b
% con.x_meas=[0 5 10 15 20 25]*in2m;
% con.y_meas=[3 3 4 7 11 16]*in2m;

%method 1
theta=60;   
TB=con.W/2/sin(theta*pi/180);
TA=TB*cos(theta*pi/180);

%method 2
%choose a starting value for T0
% T0=.1;
% % options = optimset('MaxIter',1e5);
% % search for the appropriate value for T0
% % TA=fminsearch(@catCable,T0);%,options);
% Tf=2.5e-4
% % Tf=.15;
% 
% TA=Tf

% calculate the Exact Solution y(x)
% A=con.w/Tf;
x=-50*in2m:.1:50*in2m;
for i=1:length(x)

    y(i) = TA/con.w*cosh(x(i)*con.w/TA)+con.y0-TA/con.w;

end

%show measured data and exact data
figure(1)
plot(x,y);hold on
plot(con.x_meas,con.y_meas,'rp-','MarkerSize',15)

% axis([-2 2 0 2])
% axis equal

% TB_check1=TA/cos(theta*pi/180)

% TB_check2=con.W/2/sin(theta*pi/180)




