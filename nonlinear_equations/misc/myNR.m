
%% 
% ME3001-001, 6/5/2014, Tristan Hill 
% 
% Finding Roots of non-Linear Equations
% 
% Newton Raphson Method Function%
%%

function root=myNR(han,dhan,xmin,xmax,x0,tol)

% pnum=4;

% xmin=-1;   %search from xmin to xmax
% xmax=0;
delx=.01;
x=xmin:delx:xmax; % from xmin to xmax, in steps of delx
for i=1:length(x)
    f(i)=han(x(i));
end

hold on 
figure(1);
plot(x,f);
grid on
% axis([xmin xmax -2 2])
searching=1;

% x0=(xmax-xmin)/2; %initital guess
x0=.20;
xn=x0;

idx=1;
while(searching)

    xnn=xn-han(xn)/dhan(xn);
    plot(xn,han(xn),'b*')
    plot(xnn,han(xnn),'g*')
    plot([xn xnn],[han(xn) han(xnn)],'r')
   
    xn=xnn; %prev=curr

    if abs(han(xn))<tol;
        searching=0;
        root=xn;
        disp('tolerance reached, ending the search')
        fprintf('the root was found at x=%.3f',root)
    end
    
end