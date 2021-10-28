%%
% ME 3001 
%% - optimization using Root Finding

clear all
close all
clc

%example 3
cost=@(win) 60*win^2+800/win
dcost=@(win) 120*win - 800/win^2

options.xmin=0;
options.xmax=10;
options.x0=0;
options.del=.1;
options.tol=.001;

w=options.xmin:options.del:options.xmax;

for i=1:length(w)
    C(i)=cost(w(i))
    dC(i)=dcost(w(i))
    
end



figure(1)
plot(w,C,'r');hold on
plot(w,dC,'b')

tic
root=myBisection(dcost,options);
toc

