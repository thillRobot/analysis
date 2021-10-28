%%
% ME3001 - Tennessee Technological University
% Tristan Hill - September 13, 2017
% Systems of Linear Equations - Geometry Explanation
%%
clear variables;close all;clc


% define a range of x and y values
x_range=-5:.1:5;
y_range=-5:.1:5;

% define the coefficients in the plane equations
a1=-3;
b1=200;
c1=-35;
d1=-14;

a2=12;
b2=-20;
c2=14;
d2=14;

a3=10;
b3=5;
c3=1;
d3=4;

% calculate the z values of each plane
k=1;
for i=1:length(x_range)
    for j=1:length(y_range)
       
        
        x_eq1(k)=x_range(i);
        y_eq1(k)=y_range(j);       
        z_eq1(k)=(a1*x_range(i)+b1*y_range(j)-d1)/c1;
        
        x_eq2(k)=x_range(i); %these lines are redundant
        y_eq2(k)=y_range(j); %these lines are redundant 
        z_eq2(k)=(a2*x_range(i)+b2*y_range(j)-d2)/c2;
        
        x_eq3(k)=x_range(i); %these lines are redundant
        y_eq3(k)=y_range(j); %these lines are redundant
        z_eq3(k)=(a3*x_range(i)+b3*y_range(j)-d3)/c3;
        
        k=k+1;
    end 
end

% solve for the intersection as a linear system
A=[a1 b1 c1
   a2 b2 c2
   a3 b3 c3];
B=[d1;d2;d3];

x=inv(A)*B;

figure(1);hold on
%plot the planes
plot3(x_eq1,y_eq1,z_eq1,'r.')
plot3(x_eq2,y_eq2,z_eq2,'g.')
plot3(x_eq3,y_eq3,z_eq3,'b.')
%plot the solution
plot3(x(1),x(2),x(3),'kp','MarkerSize',20,'MarkerFaceColor','red')

