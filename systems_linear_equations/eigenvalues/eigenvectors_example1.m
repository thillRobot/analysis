%%
% ME3001 - 001 - Tennessee Technological University - Fall 2016 - Fall 2017
% Tristan Hill - 10/03/2016 - 09/28/2017 - 10/28/2020
% Eigenvectors and Eigenvalues - Demo Code - Otto ch 6.5
%%
clear variables;close all;clc

%% a very basic example (on the axis)
% Otto page 204

A=[3 0
   0 2];

p=[0
   3];

p_prime=A*p;

% show in a figure
figure(1);
hold on
plot([0 p(1)],[0 p(2)],'-','LineWidth',2,'Color',[112, 217, 169]/255 );
plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
legend('p','p''')
title('Example 1')
grid on

%% a more complex example (pg205)
%Otto page 204

A=[1 2
   3 2];

lam1=-1;
lam2=4;

% First Eigen Value - lambda=-1

% p is an eigenvector of A
p=[1.5 
   -1.5];
p_prime=A*p;

% Second Eigen Value - lambda=4

% q is an eigenvector of A
q=[1
   3/2];
q_prime=A*q;

% r is NOT an eigenvector of A
r=[3
   4];
r_prime=A*r;



% show in a figure
figure(2);
subplot(2,1,1);hold on
plot([0 p(1)],[0 p(2)],'b-','LineWidth',2);
plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
plot([0 r(1)],[0 r(2)],'b-','LineWidth',2);
plot([0 r_prime(1)],[0 r_prime(2)],'c:','LineWidth',2)

legend('p','p''','r','r''')
title('Example 2 - lambda=-1')
grid on

% show the second subplot
subplot(2,1,2);hold on
plot([0 q(1)],[0 q(2)],'b-','LineWidth',2)
plot([0 q_prime(1)],[0 q_prime(2)],'m:','LineWidth',2)

legend('q','q''')
title('Example 2 - lambda=4')
grid on
 