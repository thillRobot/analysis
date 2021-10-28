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

% sec 002
param.x_meas=[0  12 24 36 48 60]*in2m;
param.y_meas=[12 13 16 23 33 48]*in2m;

% sec001
% param.x_meas=[0  12 24 36 48 59]*in2m;
% param.y_meas=[16 17 21 27 35 48]*in2m;

param.W=(48e-3)*9.8; %kg
param.L=147*in2m;
param.w=param.W/param.L;
param.y0=param.y_meas(1);


% method 1
theta=55;   
param.TB=param.W/2/sin(theta*pi/180);
param.TA=param.TB*cos(theta*pi/180);

% calculate the Exact Solution y(x)
% A=con.w/Tf;
x=-50*in2m:.1:50*in2m;
for i=1:length(x)

    y(i) = catCable(x(i),param);

end

%show measured data and exact data
figure(1)
plot(x,y);hold on
plot(param.x_meas,param.y_meas,'rp-')

% axis([-2 2 0 2])
% axis equal

% TB_check1=TA/cos(theta*pi/180)

% TB_check2=con.W/2/sin(theta*pi/180)




