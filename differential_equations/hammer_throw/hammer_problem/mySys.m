function du = mySys(x,u)
    du = zeros(2,1); 
    du(1)=u(2);
    du(2)=-u(1)*u(2)-3*u(1)+sin(x);
