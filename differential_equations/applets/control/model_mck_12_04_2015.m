function model_mck_12_04_2015(obj,event,p,l1h,l2h,l3h,bh,ah)
  
        j=obj.TasksExecuted;
        t=j*p.dt;
            
        set(ah,'xlim',[-5 15]+t)
        
        x1=get(l1h,'ydata');
        x2=get(l2h,'ydata');
        
        xerr=p.xref-x1(j);
        
        p.f=p.kp*xerr;
        
        x1_dot=x2(j);
        x2_dot=-p.c*x2(j)-p.k*x1(j)+p.f;
       
        set(l1h,'ydata',[x1 x1(j)+x1_dot*p.dt]);
        set(l2h,'ydata',[x2 x2(j)+x2_dot*p.dt]);
        set(l3h,'ydata',[p.xref p.xref]);
        
        set(l1h,'xdata',[get(l1h,'xdata') t]);
        set(l2h,'xdata',[get(l2h,'xdata') t]);
        set(l3h,'xdata',[0 p.bps+t]);
        
                
        bx=[0 p.bwt p.bwt 0]+p.bps+t;
        by=[0 0 p.bht p.bht]-p.bht/2+x1(j);
                 
        set(bh,'xdata',bx);
        set(bh,'ydata',by);

end
