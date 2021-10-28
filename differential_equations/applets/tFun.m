function tFun()
        

        pos = read_position(h);
        Fx=pos(1)*Ffct;
        Fy=pos(2)*Ffct;
        fricx=mu*Nf*cos(theta(i));
        fricy=mu*Nf*sin(theta(i));
        if(Fx>=fricx) 
            sumFx=Fx-fricx;
            Fhx=fricx;
        end
        if(Fx<fricx) 
            sumFx=0;
            Fhx=-Fx;
        end;
        ax=sumFx/mass;
        
        if(Fy>=fricy) 
            sumFy=Fy-fricy;
            Fhy=fricy;
        end;
        if(Fy<fricy) 
            sumFy=0;
            Fhy=-Fy;
        end;
        
        ay=sumFy/mass;
        vx(i+1)=vx(i)+ax*dt;
        vy(i+1)=vy(i)+ay*dt;
        xm=[xm xm(i)+vx(i)*dt];
        ym=[ym ym(i)+vy(i)*dt];
        theta(i+1)=atan2(ym(i+1)-ym(i),xm(i+1)-xm(i));
        t=t+dt;
        i=i+1;
        write(h,[Fhx Fhy 0]);
        set(lm,''ydata'',ym);
        set(lm,''xdata'',xm);

end

