function [ bs ] = buckling_fun( theta,p )

       p.H=tan(theta)*p.B/2;

       bs=pi^2*p.E*(p.d^2+p.t^2)/(8*((p.B/2)^2+p.H^2));
        
end

