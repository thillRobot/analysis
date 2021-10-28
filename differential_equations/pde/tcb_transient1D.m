function tcb_transient1D(obj,event,l)
    global L n x alpha M dt 

    t=obj.TasksExecuted*dt;
    
    sum=0;
    for n=1:100
        sum=sum+(1/n)*(1-cos(n*pi))*sin(n*pi*x/L)*exp(-(alpha*n*pi/L)^2*t);
    end

    T=2*M/pi*sum;

    set(l,'xdata',x);
    set(l,'ydata',T);
    
    
    
    
    show_1d(T)
                 
end

