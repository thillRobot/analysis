function err=catCable25(T,con)
    
    errSum=0;
    for k=1:length(con.x_meas)
        ytest=T/w*cosh(con.w/T*con.x_meas(k))+con.y0-T/con.w;
        err=(con.y_meas(k)-ytest);
        errSum=errSum+err^2;
    end
    err=sqrt(err);
end
