function du = myPendulum(t,u)

    p.g=9.8;
    p.m=2;
    p.l=42*(1/100); %(cm)
    p.c=2; 
    
    du = zeros(2,1); 
    du(1)=u(2);
    du(2)=-p.g/p.l*sin(u(1))-p.c*u(2);
