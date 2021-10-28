function [r,h] = tntech_g( r,h )
    % This is the function g(x) that we found in step 1
    global v
    
    r=(3*v/(r*pi*h));
    h=3*v/(pi*r^2);
    
end

