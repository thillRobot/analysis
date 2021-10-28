%%
% ME 3001 
%% - 2D Optimization

clear all
close all
clc

% fun=@(xin,yin) sin(xin)^2*cos(yin)*xin;

[xs,ys]=meshgrid(.01:.01:.1,.001:.001:.01); %range of x vals for the surface
zs=zeros(length(xs(:,1)),length(ys(1,:)));

for p=1:length(xs(:,1))
    for q=1:length(ys(1,:))
        zs(p,q)=cost(xs(p,q),ys(p,q));
    end
end

figure(1)
% mesh(xs,ys,zs)

% %use brute force to find max

% maxz=0;
% for p=1:length(xs)
%     for q=1:length(ys)
%         if zs(p,q)>maxz
%             maxz=zs(p,q);
%             maxx=xs(p,q);
%             maxy=ys(p,q);
%         end
%         mesh(xs,ys,zs)
%         hold on
%         plot3(xs(p,q),ys(p,q),zs(p,q),'ro')   
% %         pause(.01)
%         hold off
%         
%     end
% end
% 
% hold on
% plot3(maxx,maxy,maxz,'kp')

mesh(xs,ys,zs)
% axis([0 .1 0 .1 0 100])
hold on
pause
%8 neighbor steepest accent
% xn=xs(2); 
% yn=ys(2);
atPeak=0;
atBorder=0;

idx=8; %for now, dont start on border
jdx=1;
while ~(atPeak || atBorder)
    
    
    atPeak=1;
    mindel=1e9;
    
    if (idx==1||jdx==1)||(idx==length(xs)||jdx==length(ys))
        atBorder=1;
    else
        
        for m=idx-1:idx+1
            for n=jdx-1:jdx+1
                if zs(m,n)-zs(idx,jdx)<mindel
                    mindel=zs(m,n)-zs(idx,jdx);
                    itmp=m;
                    jtmp=n;
                    atPeak=0;
                end
            end
        end

    
        idx=itmp;
        jdx=jtmp;
    
    
    mesh(xs,ys,zs)
    xlabel('X')
    ylabel('Y')
%     axis([0 .1 0 .1 0 100])
    hold on
    plot3(xs(idx,jdx),ys(idx,jdx),zs(idx,jdx),'ro')
    pause 
    
    end
end



