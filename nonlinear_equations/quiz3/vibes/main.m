%% ME 3001 - Roots of Non- Linear Equations
%
% Tristan Hill

clear all
close all
clc

options.tmin=0;
options.tmax=3;
options.t0=.4;
options.delt=.1;
options.tol=.001;

t=options.tmin:options.delt:options.tmax;
for i=1:length(t)

    x(i)=vibe(t(i));

end

figure(1)
subplot(2,1,1)
plot(t,x);hold on
axis([options.tmin,options.tmax,-.25,1.25])
grid on
root=myNR(@vibe,@vibe_prime,options);

% subplot(2,1,2)
% plot(t,x);hold on
% axis([options.tmin,options.tmax,-.25,1.25])
% grid on
% 
% root=myBisection(@vibe,options);


