%% ME 3001 -= Tennessee Technological University
% Tristan Hill - June 2016 
% 2D Optimization - truss design
% Homework 2 Starter Code
%%

clear all
close all
clc


%% part 1 - find theta such that the height is minimized and truss is not broken

%define constant system parameters
p.B=250; %in
p.E=30000; %kpsi
p.den=0.3;%lbs/in^2
p.P=50; %1000 lbs 
p.t=.25;
p.d=3;

stress_yeild=50; %kpsi


theta=.1:.1:89*pi/180;
for i = 1:length(theta)
    stress(i)=stress_fun(theta(i),p);
    def(i)=deflection_fun(theta(i),p);
    buck(i)=buckling_fun(theta(i),p);
end

figure(1);hold on
plot(theta,def)



% use brute force to find theta that gives min H

min_height=height_fun(theta(length(theta)),p);
for i=1:length(theta)
    
    if (stress_fun(theta(i),p)<stress_yeild) && (stress_fun(theta(i),p)<buckling_fun(theta(i),p))
       
        if height_fun(theta(i),p)<min_height
            
            min_height=height_fun(theta(i),p);
            min_theta=theta(i);
            min_stress=stress_fun(theta(i),p);
            buck_lim=buckling_fun(theta(i),p);
            
        end
       
    end
    
end

min_theta*180/pi

figure(2)
subplot(2,1,1);hold on
plot(theta,stress)
plot(min_theta,stress_fun(min_theta,p),'r*')

subplot(2,1,2);hold on
plot(theta,buck)
plot(min_theta,buckling_fun(min_theta,p),'r*')

%% Part 2


min_diameter=diameter(1,1);
min_thickness=thickness(1,1);

for i=1:length(diameter)
    for j=1:length(thickness)
       
        if (stress(i,j)<allowable_stress) && (thickness(j)<diameter(i)/2)
           if(weight(i,j)<min_weight)  
            min_weight=weight(i,j);
            min_stress=stress(i,j);
            min_diameter=diameter(i);
            min_thickness=thickness(j);
           end
            plot3(thickness(j),diameter(i),stress(i,j),'gp','MarkerSize',15)
        else
            plot3(thickness(j),diameter(i),stress(i,j),'rx','MarkerSize',15)
        end
        
    end
end











%define constant system parameters
p.H=30; %in
p.B=60; %in
p.E=30000; %kpsi
p.den=0.3;%lbs/in^2
p.P=50; %1000 lbs 
% 
%define bounds on design variables radius and diameter
diameter_min=0; % all spatial dimensions must be positive
thickness_min=0;

diameter_max=2; % all spatial dimensions must be positive
thickness_max=.5;

diameter=diameter_min:0.1:diameter_max; %range of diamter values
thickness=thickness_min:0.1:thickness_max; %range of radius values 

% define constraint values
allowable_stress = 50;% kpsi (yeild stress or ultimate stress), %c1
    % c2 is d/2<t

% show the design space as a surface (or mesh)
% [xs,ys]=meshgrid(radius,diameter); 
stress=zeros(length(diameter),length(thickness));
weight=zeros(length(diameter),length(thickness));

for i=1:length(diameter)
    for j=1:length(thickness)
        stress(i,j)=stress_fun(diameter(i),thickness(j),p);
        weight(i,j)=weight_fun(diameter(i),thickness(j),p);
    end
end

figure(1)
surf(thickness,diameter,stress)
xlabel('t')
ylabel('d')

title('Stress')
hold on

% figure(2)
% surf(thickness,diameter,weight)
% hold on
% title('weight')

%use brute force to find max
min_weight=weight(length(diameter),length(thickness));
min_diameter=diameter(1,1);
min_thickness=thickness(1,1);

for i=1:length(diameter)
    for j=1:length(thickness)
       
        if (stress(i,j)<allowable_stress) && (thickness(j)<diameter(i)/2)
           if(weight(i,j)<min_weight)  
            min_weight=weight(i,j);
            min_stress=stress(i,j);
            min_diameter=diameter(i);
            min_thickness=thickness(j);
           end
            plot3(thickness(j),diameter(i),stress(i,j),'gp','MarkerSize',15)
        else
            plot3(thickness(j),diameter(i),stress(i,j),'rx','MarkerSize',15)
        end
        
    end
end
plot3(min_thickness,min_diameter,min_stress,'kp','MarkerSize',15,'MarkerFaceColor',[255/255 215/255 0])

% min_diameter
% min_thickness
% min_stress
% min_weight

% 
% 
% 
% 
% figure(2)
% surf(thickness,diameter,weight)
% hold on
% plot3(min_thickness,min_diameter,min_weight,'rp','MarkerSize',15)
% title('weight')
% % % 
% 
