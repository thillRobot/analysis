function y=catCablePrime(T)
    w=10;
    y0=5;
    x=6;
    y = -(w*x*sinh(w*x/T)+T*(-cosh(w*x/T))+T)/(T*w);
end

