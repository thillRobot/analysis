
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Newton Raphson Method Function%
%%

function root=mySecant(fun,opts)

    searching=1;

    x0=opts.x0;
    x1=x0+opts.del;
    idx=1;
    while(searching)

        x2=x0-fun(x0)*(x1-x0)/(fun(x1)-fun(x0));
        
        plot(x0,fun(x0),'rp','MarkerSize',8)
        plot(x1,fun(x1),'bp','MarkerSize',8)
        plot(x2,fun(x2),'gp','MarkerSize',8)
        
        plot(x0,0,'r*','MarkerSize',8)
        plot(x1,0,'b*','MarkerSize',8)
        plot(x2,0,'g*','MarkerSize',8)
        
       
        plot([x0 x0],[0 fun(x0)],'k:','LineWidth',2)
        plot([x1 x1],[0 fun(x1)],'k:','LineWidth',2)
        
        plot([x0 x2],[fun(x0) 0],'k:','LineWidth',2)
        plot([x2 x2],[0 fun(x2)],'k:','LineWidth',2)
        pause
        x0=x1; %prev=curr
        x1=x2;
        idx=idx+1;
        
        if abs(fun(x0))<opts.tol;
            searching=0;
            root=x0;
            fprintf('tolerance of %.5f reached, ending the search\n',opts.tol)
            fprintf('the function value at x=%.5f is %.5f\n',root,fun(root))
            fprintf('it took %i iterations\n',idx)
        end
        
    end