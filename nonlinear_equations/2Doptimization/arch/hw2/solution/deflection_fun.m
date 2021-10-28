function [ d ] = deflection_fun( theta,p )

       H=tan(theta)*p.B/2;

       d=p.P*sqrt((p.B/2)^2+H^2)^(3/2)/(2*p.t*pi*p.d*H^2*p.E);

end

