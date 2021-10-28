function tFun2D(src,evt)
        
        global prt
        global t
        global i
        global h
        global lm
     
        mu=0.5;      %coefficient of friction
        Nf=prt.mass*9.8; %Normal force
        dt=0.05;

        pos = read_position(h);
        Fx=pos(1)*1/6; %exteral force
        Fy=pos(2)*1/6;
        Fmag=sqrt(Fx^2+Fy^2);
        
        fric=mu*Nf;
        fricx=mu*Nf*cos(prt.theta(i));
        fricy=mu*Nf*sin(prt.theta(i));
%         fricx=0;
%         fricy=0;
        prt
        if prt.stopped && Fmag<fric
    
            fprintf('test')
            prt.sumFx=0;
            prt.sumFy=0;
            prt.vx(i)=0;
            prt.vy(i)=0;
            fbFx=-Fx;
            fbFy=-Fy;
      
        else
            prt.sumFx=Fx-fricx*sign(Fx);
            prt.sumFy=Fy-fricy*sign(Fy);
            fbFx=-fricx*sign(Fx);
            fbFy=-fricy*sign(Fy);
            prt.stopped=0;
        end
        
        fbFx
        fbFy
        
        prt.ax=prt.sumFx/prt.mass;
        prt.ay=prt.sumFy/prt.mass;
%         fbFx=-(prt.mass*prt.ax+fricx);
%         fbFy=-(prt.mass*prt.ay+fricy);
        
        prt.vx(i+1)=prt.vx(i)+prt.ax*dt;
        prt.vy(i+1)=prt.vy(i)+prt.ay*dt;
        prt.xm=[prt.xm prt.xm(i)+prt.vx(i)*dt];
        prt.ym=[prt.ym prt.ym(i)+prt.vy(i)*dt];
        prt.theta(i+1)=atan2(prt.ym(i+1)-prt.ym(i),prt.xm(i+1)-prt.xm(i));
        theta=prt.theta(i)
        %checked if the particle is prt.stopped
        if ~prt.stopped
            if sqrt((prt.xm(i+1)-prt.xm(i))^2+(prt.ym(i+1)-prt.ym(i))^2)<.01
                prt.stopped=1;
            else
                prt.stopped=0;
            end
        end
        t=t+dt;
        i=i+1;
        write(h,[fbFx fbFy 0]);
%         write(h,[0 0 0]);
        set(lm,'ydata',prt.ym);
        set(lm,'xdata',prt.xm);

end

