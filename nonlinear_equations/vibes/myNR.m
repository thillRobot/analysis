
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Newton Raphson Method Function%
%%

function root=myNR(fun,dfun,opts)

    searching=1;

    xn=opts.t0;
    idx=1;
    while(searching)
        pause
        xnn=xn-fun(xn)/dfun(xn);
        
        plot(xn,fun(xn),'b*')
        plot(xnn,fun(xnn),'g*')
        plot([xn xnn],[fun(xn) 0],'k:')
        plot([xnn xnn],[0 fun(xnn)],'k:')
        plot([xn xnn],[fun(xn) fun(xnn)],'r')

        xn=xnn; %prev=curr
        idx=idx+1
        if abs(fun(xn))<opts.tol;
            searching=0;
            root=xn;
            fprintf('tolerance of %.5f reached, ending the search\n',opts.tol)
            fprintf('the function value at x=%.5f is %.5f\n',root,fun(root))
            fprintf('it took %i iterations\n',idx)
        end
        
    end