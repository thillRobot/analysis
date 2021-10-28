function [ s ] = stress_fun( theta,p )

       H=tan(theta)*p.B/2;

       s=(p.P*sqrt((p.B/2)^2+H^2))/(2*p.t*pi*p.d*H);
        
end

