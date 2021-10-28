
%%
% ME 3001 
%% - 2D Optimization

clear all
close all
clc

fun=@(xin,yin) sin(xin)^2*cos(yin)*xin;

[xs,ys]=meshgrid(0:.1:pi,-pi/2:.1:pi/2); %range of x vals for the surface
zs=zeros(length(xs(:,1)),length(ys(1,:)));

for p=1:length(xs(:,1))
    for q=1:length(ys(1,:))
        zs(p,q)=fun(xs(p,q),ys(p,q));
    end
end
% 
figure(1)
mesh(xs,ys,zs)
% % 
%use brute force to find max
maxz=0;
for p=1:length(xs)
    for q=1:length(ys)
        if zs(p,q)>maxz
            maxz=zs(p,q);
            maxx=xs(p,q);
            maxy=ys(p,q);
        end
        mesh(xs,ys,zs)
        hold on
        plot3(xs(p,q),ys(p,q),zs(p,q),'ro')   
%         pause(.1)
        hold off
        
    end
end
% % 
hold on
plot3(maxx,maxy,maxz,'kp','MarkerSize',15)
% 

