function y=catCable(T)
    w=10;
    y0=5;
    x=6;
    y = T/w*cosh(w/T*x)+y0-T/w-5;
end
