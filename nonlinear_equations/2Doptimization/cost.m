function fval=cost(d,t)
    
    E=69e9;      %Pa
    Sy=400e6;    %Pa
    rho=2.7e-3*(100^3);  %kg/m^3
    
    I=pi/8*d*t*(d^2+t^2);
    
    H=2.75; %m
    
    W=pi*(t^2+d*t)*H*rho;
    
    P=1000*9.8; %1000kg* grav (N)
    A=pi*(t^+d*t);
    S=P/A;
    
    
    fval=4*W+2*d-.1*(Sy-S);