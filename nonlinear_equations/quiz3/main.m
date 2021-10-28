%% ME3001 - Mechanical Engineering Analysis
%
% Tristan Hill - March 24, 2015
%
% (Quiz 3 helper stuff - spring 2015)
% Quiz 1 helper stuff - summer 2015


clear all
close all
clc
% 
% % problem 1
% q3_fun=@(xin) sin(3*xin)-2*xin^2+25;
% q3_dfun=@(xin) 3*cos(3*xin)-4*xin;
% 
% options.xmin=0;
% options.xmax=2*pi;
% options.x0=1.4;
% options.del=.01;
% options.tol=.5;
% 
% x=options.xmin:options.del:options.xmax;
% for i=1:length(x)
% 
%     y(i)=q3_fun(x(i));
% 
% end
% 
% figure(1)
% plot(x,y,'k','LineWidth',1.5);hold on
% plot(x,zeros(1,length(x)),'k','LineWidth',1.5)
% % axis([options.Pmin,options.Pmax,-.25,1.25])
% grid on
% xlabel('X')
% ylabel('Y')
% title('Y=sin(3*X)-2*X^2+25')
% 
% root=myNR(q3_fun,q3_dfun,options);

% problem 2
q3_fun=@(xin) 3/4*xin^3-2*xin^2+3;

options.xmin=-4;
options.xmax=1;
options.x0=-4;
options.del=.01;
options.tol=1;

t=options.xmin:options.del:options.xmax;
for i=1:length(t)

    g(i)=q3_fun(t(i));

end

figure(1)
plot(t,g,'k','LineWidth',1.5);hold on
plot(t,zeros(1,length(t)),'k','LineWidth',1.5)

grid on
root=myBisection(q3_fun,options);
xlabel('t')
ylabel('g(t)')
title('g(t)=3/4*t^3-2*t^2+3')

