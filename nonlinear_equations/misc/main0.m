% ME3001 - basic methods form finding roots of no lins
%
%
% Tristan Hill


clear all
close all
clc
%% for graphical purposes only
x_plot=0:.1:10;
for i=1:length(x_plot)
    y_plot(i)=my_square(x_plot(i));
end
figure(1)
plot(x_plot,y_plot,'r');hold on
grid on
%% find the root using 'sign change incremental' method
%inital guess
x=0;
%increment
dx=.1;
while sign(my_square(x))==sign(my_square(x+dx))        
    x=x+dx;
    
end

plot(x,my_square(x),'bp')
fprintf('the root was found at x=%f',x)
 

%% find the root using 'fixed point iteration' method
% inital guess
x0=-.1;
while abs(my_square(x0))>.01
    x0=my_gx(x0)
%     plot(x0,my_gx(x0),'ro')
%     pause
    
end

plot(x0,my_square(x0),'bo')
fprintf('the root was found at x=%f',x0)
 

