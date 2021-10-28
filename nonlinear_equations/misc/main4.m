%%
% ME 3001 - 001 Mechanical Enigineering Analysis\
% Tristan Hill
% 
% Finding roots of Non-Linear Equations
%
% Catenary Cable example
%
%%
clear all
close all

xmin=0;
xmax=10;
xdel=.1;

x=xmin:xdel:xmax;
T=[188450 200 300 400];
w=10;
y0=5;

figure(1);hold on 
for j=1:length(T)
    
    for i=1:length(x)
        y(i,j)=T(j)/w*cosh(w/T(j)*x(i))+y0-T(j)/w;
    end
      
end

plot(x,y(:,1),'r')
plot(x,y(:,2),'g')
plot(x,y(:,3),'b')


% calculate tension to make cable height 6m at x = 5m;

myRoot=myNR(@catCable,@catCablePrime,0,15,0,.01);

axis([0 10 0 10 ])
grid on