
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Bisection Method 
%%

function root=custom_bisection(fun,opts)

    xmin=opts.xmin;   %search from xmin to xmax
    xmax=opts.xmax;
    tol=opts.tol;
    
    searching=1;
    idx=1;
    while(searching)
%         pause
        % Step 1 - calculate center of interval
        xcen=(xmax+xmin)/2;
        plot(xmin,fun(xmin),'rp','MarkerSize',20)
        plot(xcen,fun(xcen),'kp','MarkerSize',20)
        plot(xmax,fun(xmax),'bp','MarkerSize',20)

        % determine which side of xcen the root is on
        % and reset the window to that side
%         fun(xmin) % show for debugging only
%         fun(xcen)
        
        if sign(fun(xcen))==sign(fun(xmin))
            xmin=xcen;
        else
            xmax=xcen;
        end
        
        % if xcen is close enough to root, within tolerance
        % turn off the flag so that loop doesnt fire again
        if abs(fun(xcen))<tol
            searching=0;
            root=xcen;
            fprintf('tolerance reached, ending the search\n')
            fprintf('the function value at x=%.5f is %.5f\n',root,fun(root))
            fprintf('it took %i iterations\n',idx)
        end
        % increment the index, this is for counting purposes only
        idx=idx+1;
    end

