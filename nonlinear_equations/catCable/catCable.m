function y=catCable(x,p)
 
    y = p.TA/p.w*cosh(x*p.w/p.TA)+p.y0-p.TA/p.w;

end
