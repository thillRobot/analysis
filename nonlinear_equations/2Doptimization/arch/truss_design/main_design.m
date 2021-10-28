%% ME 3001 -= Tennessee Technological University
% Tristan Hill - June 2016 
% 2D Optimization - truss design
%%

clear variables
close all
clc

%define constant system parameters
p.H=30; %in
p.B=60; %in
p.E=30000; %kpsi
p.den=0.3;%lbs/in^2
p.P=66; %1000 lbs 
% 
%define bounds on design variables radius and diameter
diameter=0:0.1:2; %range of diamter values
thickness=0:0.1:0.5; %range of radius values

%define constraint values
allowable_stress = 50;  % kpsi (yeild stress or ultimate stress), %c1
                        % c2 is d/2<t
figure(1)
title('2D 0ptimization - Truss Design')
hold on

stress=zeros(length(diameter),length(thickness));
weight=zeros(length(diameter),length(thickness));

%use brute force search to find max
min_diameter=diameter(1);
min_thickness=thickness(1);
min_weight=weight_fun(max(diameter),max(thickness),p);

for i=1:length(diameter)
    for j=1:length(thickness)

        stress(i,j)=stress_fun(diameter(i),thickness(j),p);
        weight(i,j)=weight_fun(diameter(i),thickness(j),p);

        if (stress(i,j)<allowable_stress) && (thickness(j)<diameter(i)/2) % meets the constraints
            if (weight(i,j)<min_weight) % save the lightest design 
                min_weight=weight(i,j);
                min_stress=stress(i,j);
                min_diameter=diameter(i);
                min_thickness=thickness(j);
            end
            plot3(thickness(j),diameter(i),stress(i,j),'gp','MarkerSize',15) % acceptable design
        else
            plot3(thickness(j),diameter(i),stress(i,j),'rx','MarkerSize',15) % not acceptable design
        end

    end
end
plot3(min_thickness,min_diameter,min_stress,'gp','MarkerSize',15,'MarkerFaceColor',[255/255 215/255 0]) % best acceptable design

min_diameter
min_thickness
min_stress
min_weight

% show the design space as a surface (or mesh)
surf(thickness,diameter,stress)
xlabel('Thickness')
ylabel('Diameter')
zlabel('Stress')
view(100,30)
grid on

