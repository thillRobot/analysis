function model_mk(obj,event,p,lh,bh)

%         global g m k x0 xdot0 i t dt
        if p.j==1
            ym(p.j)=p.y0;
        end
%       xm=[xm xm(i)+1];
        
%         p.t=p.t+p.dt;
%         p.j=p.j+1
        event.Type
%         lh
        
        j=obj.TasksExecuted;
        t=j*p.dt;

        ym=p.ydot0/p.wn*sin(p.wn*t)+p.y0*cos(p.wn*t)

        bx=[0 p.bwt p.bwt 0]+p.bps;
        by=[0 0 p.bht p.bht]+ym;
        
        set(bh,'xdata',bx);
        set(bh,'ydata',by);
        
        set(lh,'xdata',[get(lh,'xdata') t]);
        set(lh,'ydata',[get(lh,'ydata') ym]);
%         
end

