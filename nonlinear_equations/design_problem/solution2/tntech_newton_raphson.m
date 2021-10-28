
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Newton Raphson Method Function%
%%

function root=tntech_newton_raphson(han,dhan,x0,tol)

xmin=0;   %search from xmin to xmax
xmax=10;
delx=.01;
x=xmin:delx:xmax; % from xmin to xmax, in steps of delx
for i=1:length(x)
    f(i)=han(x(i));
end

searching=1;

xn=x0;

idx=1;
while(searching)

    xnn=xn-han(xn)/dhan(xn);
    xn=xnn; %prev=curr

    if abs(han(xn))<tol;
        searching=0;
        root=xn;
    end
    
end