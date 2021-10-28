%%
% ME3001-001 - Spring 2017
% Tristan Hill - 04/19/2017
% 2D Transient Heat w/ the Finite Difference Method
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
