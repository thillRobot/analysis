
%% 
% ME3001-001, 6/3/2014, Tristan Hill 
% modified from Mike Renfro, 2014/05/23
% 
% Finding Roots of non-Linear Equations
%
% Several Method to determine the roots of f(x)=-12-21x+18x^2-2.75x^3.
% Methods 1 and 2 are home built, and 3 and 4 are built into MATLAB
% Methods 1b,2b,3 require function 'myPoly.m'

% 1) Graphical with ginput (all roots)
% 2) Incremental search (first root)
% 3) fzero() 
% 4) roots()
%%

clear all;
close all;

% Graphical method (1a)
x=-2:0.01:6; % from -2 to 6, in steps of 0.01
f1=-12-21*x+18*x.^2-2.75*x.^3;% notice the element wise (point wise) operator
figure(1);
plot(x,f1);
grid on;

% Grapical method (1b)
for i=1:length(x)
    f2(i) = myPoly(x(i));
end
figure(2);
plot(x,f2);
grid on;
xlabel('x')
ylabel('f(x)')
[root,fx]=ginput(3);
fprintf('The Graphical method found a root at x=%.3f \n',root);


% Incremental search method (2a)
% starting at x=-1 with a step size of .1
x=-1;
dx=0.001;
f=-12-21*x+18*x^2-2.75*x^3;
x_next=x+dx;
f_next=-12-21*x_next+18*x_next^2-2.75*x_next^3;
while sign(f)==sign(f_next)
    x=x_next;
    f=-12-21*x+18*x^2-2.75*x^3;
    x_next=x+dx;
    f_next=-12-21*x_next+18*x_next^2-2.75*x_next^3;
end
fprintf('Incremental method(1) found a root between x=%.3f and x=%.3f\n',x,x_next);


%incremental search method (2b)
x=-2:0.1:6; % from -2 to 6, in steps of 0.01
idx=1;
while sign(myPoly(x(idx)))==sign(myPoly(x(idx+1)))
    idx=idx+1;
end
fprintf('Incremental method(2) found a root between x=%.3f and x=%.3f\n',x(idx),x(idx+1));

%fzero() method (3)
root=fzero(@myPoly,-2);
fprintf('The fzero() method found a root at x=%.3f \n',root);

%roots() method, polynomial array based (4)
myFun=[-2.75 18 -21 -12];
root=roots(myFun);
fprintf('The roots() method found a root at x=%.3f \n',root);





