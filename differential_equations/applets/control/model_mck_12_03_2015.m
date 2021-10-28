function model_mck_12_03_2015(obj,event,p,l1h,l2h,bh)

%         if p.j==1
%             ym(p.j)=p.y0;
%         end
%       xm=[xm xm(i)+1];
        
%         event.Type

        
        j=obj.TasksExecuted;
        t=j*p.dt;

        
%         %free response equations
%         if p.dr<1 %underdamped 
%             ym=exp(-p.dr*p.wn*t)*(p.y0*cos(p.wd*t)+(p.ydot0+p.dr*p.wn*p.y0)/p.wd*sin(p.wd*t))
%         elseif p.dr==1 %critically damped
%             ym=p.y0*exp(-p.wn*t)+(p.ydot0+p.wn*p.y0)*t*exp(-p.wn*t)
%         else %overdamped
%             C1=(-p.ydot0+(-p.dr+sqrt(p.dr^2-1))*p.wn*p.y0)/(2*p.wn*sqrt(p.dr^2-1))
%             C2=(p.ydot0+(p.dr+sqrt(p.dr^2-1))*p.wn*p.y0)/(2*p.wn*sqrt(p.dr^2-1))
%             ym=exp(-p.dr*p.wn*t)*(C1*exp(-p.wn*sqrt(p.dr^2-1)*t) + C2*exp(p.wn*sqrt(p.dr^2-1)*t))
%         end
        

        x1=get(l1h,'ydata');
        x2=get(l2h,'ydata');
        
        xerr=p.xref-x1(j);
        p.f=p.kp*xerr;
       
        x1_dot=x2(j);
        x2_dot=-p.c*x2(j)-p.k*x1(j)+p.f;
       
        set(l1h,'ydata',[x1 x1(j)+x1_dot*p.dt]);
        set(l2h,'ydata',[x2 x2(j)+x2_dot*p.dt]);
        
        set(l1h,'xdata',[get(l1h,'xdata') t]);
        set(l2h,'xdata',[get(l2h,'xdata') t]);
        
%         x1_dot(i)=x2(i);
%         x2_dot(i)=-p.c*x2(i)-p.k*x1(i)+p.f;
% 
%         x1(i+1)=x1(i)+x1_dot(i)*dt;
%         x2(i+1)=x2(i)+x2_dot(i)*dt;


% 
        
        bx=[0 p.bwt p.bwt 0]+p.bps;
        by=[0 0 p.bht p.bht]-p.bht/2+x1(j);
%         
        
        set(bh,'xdata',bx);
        set(bh,'ydata',by);
%         
%         set(lh,'xdata',[get(lh,'xdata') t]);
%         set(lh,'ydata',[get(lh,'ydata') ym]);
% 
%         set(l2h,'xdata',[p.bps+p.bwt/2 t]);
%         set(l2h,'ydata',[x1 x1]);

end
