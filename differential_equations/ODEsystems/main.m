

%% ME 3001 - Spring 2015
% Tristan Hill - solving a system of 1st order ODEs 
% 
%%
close all
clear all
clc

xrange=[0 10]; % range of IND. var
iv=[0 0];     % intitial dependent var vals

[xs ys]=ode45(@mySys,xrange,iv);

plot(xs,ys)