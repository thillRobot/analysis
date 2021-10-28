
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Bisection Method%
%%

clear all;
close all;

pnum=4;


myFun=@(in) -12-21*in+18*in^2-2.75*in^3;

% Bisection Method
x=-2:0.01:6; % from -2 to 6, in steps of 0.01
% evaluate the function at every x
% for plotting purposes only

for i=1:length(x)
    f(i)=myFun(x(i));
end

xmin=-2;   %search from xmin to xmax
xmax=4;
tol=.001;
hold on 
figure(1);
plot(x,f);
grid on
searching=1;

idx=1;
while(searching)

    % Step 1 - calculate center of interval
    xcen=(xmax+xmin)/2;
    plot(xmin,myFun(xmin),'r*')
    plot(xcen,myFun(xcen),'g*')
    plot(xmax,myFun(xmax),'b*')
    
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
    pause
end

