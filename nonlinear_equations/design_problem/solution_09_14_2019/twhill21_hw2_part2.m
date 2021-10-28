%% ME 3001 - Tennessee Technological University
% Tristan Hill - 6/07/2016 - 09/06/2017 - 09/10/2019
% Roots of Non-Linear Equations
% Incremental Search Method and Newton Raphson Method
% Homework Problem 2 Setup - a mechanical design problem
% part 2 - 2D design
%%
close all; clear variables; clc

%% define global vars(constants)

%s=;       %(m^2) surface area is the var to minimize
%h=;       %(m) height is the firtst design variable to find 
%r=;       %(m) radius is the second design variable to find
p.tol=0.01;   %(m^2) tolerance is given
p.vol=5;     %(m^3) volume is given

%% plot surface for graphical verification

figure(1);hold on

r_range=1:1:5;
h_range=1:1:5;
k=1;% start a separate counter for (x,y,z) triplets
for i=1:length(r_range) % for all elements in r_range
    for j=1:length(h_range) % for all elements in h_range
         
         r_vals(k)=r_range(i);  
         y_vals(k)=h_range(j);  
         [v_vals(k),s_vals(k)]=vs_fun(r_range(i),h_range(j),p);

         v_str=sprintf('%.2f',v_vals(k));   
         text(r_vals(k),y_vals(k),s_vals(k),v_str)

         k=k+1;   % increment a separate counter for (x,y,z) triplets  
    end
end

plot3(r_vals,y_vals,s_vals,'o')
title('Design Space (volume shown on points)')
xlabel('radius')
ylabel('height')
zlabel('surface area')
grid on

