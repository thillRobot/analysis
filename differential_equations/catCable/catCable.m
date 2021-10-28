% objective function for Caten

function err=catCable(T)
    global con
    errSum=0;
    for k=1:length(con.x_meas)
        ytest=T/con.w*cosh(con.w/T*con.x_meas(k))+con.y0-T/con.w;
        err=(con.y_meas(k)-ytest)^2;
        errSum=errSum+err;
    end
    err=sqrt(err);    
end
