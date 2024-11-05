%% ME 3001 - Spring 2024
% Tristan Hill - solving a system of 1st order ODEs 
% 
%%
close all
clear all
clc

p.g=9.8;
p.m=2;
p.l=42*(1/100); %(cm)
p.c=2; 

trange=[0 10]; % range of IND. var
iv=[1 0];     % intitial vals for dependent var

opts=odeset('Stats','off');
[ts,ys]=ode45(@myPendulum,trange,iv,opts);

plot(ts,ys)