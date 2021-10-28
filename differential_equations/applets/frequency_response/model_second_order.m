function model_second_order(obj,event,p,lh1,lh2)

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
        
        y1=p.A*sin(p.w*t);
        y2=p.M*p.A*sin(p.w*t+p.phi);
        
        set(lh1,'xdata',[get(lh1,'xdata') t]);
        set(lh1,'ydata',[get(lh1,'ydata') y1]);
        
        set(lh2,'xdata',[get(lh2,'xdata') t]);
        set(lh2,'ydata',[get(lh2,'ydata') y2]);
%         
end

