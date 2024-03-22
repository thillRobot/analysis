% ME3001 - Tennessee Technological University
% Tristan Hill - March 03, 2024
% Euler's Integration, basic second example
% ODE: 2x''+3x'=1, x(0)=1, x'(0)=0

clear variables;clc;close all
x0=1;
xdot0=0;
z1(1)=x0;
z2(1)=xdot0;
dt=.0001;
time(1)=0;

n=15;

% approximate n time steps of the solution
for i=1:n

    z1(i+1)=z1(i)+f1(z2(i))*dt;
    z2(i+1)=z2(i)+f2(z2(i))*dt;
    time(i+1)=time(i)+dt;

end

x=z1;
xdot=z2;

% analytical solutions found with wolfram and alpha
x_analytical=1/9*(3*time+2*exp(-3*time/2)+7);
% derivative of solution
xdot_analytical=1/3-3*exp(-3*time/2);

% show a figure with subplots
figure(1); 
subplot(2,1,1); hold on % dont forget the hold on for each subplot
plot(time,x,'-o')
plot(time,x_analytical,'-d')
ylabel('x')
xlabel('t')
title('Solution x(t)')
subplot(2,1,2); hold on 
plot(time,xdot,'-o')
plot(time,xdot_analytical,'-d')
legend('analytical solution', 'numerical solution')
ylabel('dx(t)/dt')
xlabel('t')
title('Derivative of Solution, dx(t)/dt')


% slope funs below, the ODE is contain here

% the first function just contains the derivative sub
function [z1dot] = f1(z2)

    z1dot=z2;

end

% the second function contains the differential equation we are solving
function [z2dot] = f2(z2)

    z2dot=(1-3*z2)/2;

end