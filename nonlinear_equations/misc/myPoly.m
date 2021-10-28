function out=myPoly(in,opt)
    
    if opt==1
        out=-12-21*in+18*in^2-2.75*in^3;
    elseif opt==2
        out=exp(in)-15;  
    elseif opt==3
        out=sin(1/in);  
    elseif opt==4
        out=cos(in)+sin(in);  

        
    end