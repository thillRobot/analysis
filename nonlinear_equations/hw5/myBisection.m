
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Bisection Method 
%%

function root=myBisection(fun,ps,os)

    searching=1;
    idx=1;
    while(searching)
          
       
        
        if os.paus
            pause
        end
       
        if os.plt
            plot(os.xmin,fun(os.xmin,ps),'rp','MarkerSize',20)
            plot(os.xcen,fun(os.xcen,ps),'kp','MarkerSize',20)
            plot(os.xmax,fun(os.xmax,ps),'bp','MarkerSize',20)
        end
 
        
        
        
        
        
        
         % Step 1 - calculate center of interval
        os.xcen=(os.xmax+os.xmin)/2;
        % determine which side of xcen the root is on
        % and reset the window to that side
        if fun(os.xcen,ps)*fun(os.xmin,ps)>0;
            os.xmin=os.xcen;
        else
            os.xmax=os.xcen;
        end
        
        % if xcen is close enough to root, within tolerance
        % turn off the flag so that loop doesnt fire again
        
        
        
        
        
        if abs(fun(os.xcen,ps))<tol;
            searching=0;
            root=os.xcen;
            fprintf('tolerance reached, ending the search\n')
            fprintf('the function value at x=%.5f is %.5f\n',root,fun(root,ps))
            fprintf('it took %i iterations\n',idx)
        end
        % increment the index, this is for counting purposes only
        idx=idx+1
        if idx==3
            x=uuu;
        end
    end

