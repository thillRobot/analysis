
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Bisection Method 
%%

function root=myBisection(han,opts)


    for i=1:length(x)
        f(i)=han(x(i));
    end

    xmin=opts.xmin;   %search from xmin to xmax
    xmax=opts.xmax;
    tol=opts.tol;
    hold on 
    figure(1);
%     plot(x,f);
%     grid on
    searching=1;

    idx=1;
    while(searching)
        pause
        % Step 1 - calculate center of interval
        xcen=(xmax+xmin)/2;
        plot(xmin,myFun(xmin),'rp','MarkerSize',20)
        plot(xcen,myFun(xcen),'kp','MarkerSize',20)
        plot(xmax,myFun(xmax),'bp','MarkerSize',20)

        % determine which side of xcen the root is on
        % and reset the window to that side
        if sign(myFun(xcen))==sign(myFun(xmin));
            xmin=xcen;
        else
            xmax=xcen;
        end

        % if xcen is close enough to root, within tolerance
        % turn off the flag so that loop doesnt fire again
        if abs(myFun(xcen))<tol;
            searching=0;
            root=xcen;
            disp('tolerance reached, ending the search')
            fprintf('the root was found at x=%.3f',root)
        end
        % increment the index, this is for counting purposes only
        idx=idx+1;
    end

