%% ME 3001 - Roots of Non- Linear Equations
%
% Tristan Hill

clear all
close all
clc

options.xmin=0;
options.xmax=2;
options.x0=0;
options.del=.1;
options.tol=.001;

P=options.xmin:options.del:options.xmax;
for i=1:length(P)

    stress(i)=myBeam(P(i));

end

figure(1)
plot(P,stress);hold on
pause
% axis([options.Pmin,options.Pmax,-.25,1.25])
% grid on
root=mySecant(@myBeam,options);
% 
% root=fzero(@myBeam,[0 6e4])

