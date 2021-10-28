function vout = vfun(hin,p)
    
    vout=tanh((p.t/(2*p.l)*(2*p.g*hin)^.5))*(2*p.g*hin)^.5-p.v;


