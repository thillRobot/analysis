function S=myBeam(P)

    L=5; %m
    
    t=1e-2;%m
    s=1e-2;%m
    d=10e-2;%m
    h=d-2*s;
    b=d;
    
    I=(b*d^3-h^3*(b-t))/12;
    
    M=P*L/4;
    
    c=d/2;
    
    S=M*c/I-520e6;
    
    