% cubic spline interpolation - example 1
% ME3001, TNTech
% Tristan Hill, November 4, 2024
% method and notation is from Applied Numerical Methods with MATLAB,
% Chapra and Canale 6th, example from pg. 482

clear; clc; close all
format long

% define x values
x=[3.0, 4.5, 7.0, 9.0];
n=length(x); 

% calculate h values (x steps)
for i=1:n-1
    h(i)=x(i+1)-x(i);
end

% define function values (y)
f=[2.5, 1.0, 2.5, 0.5];

% equation 18.27 (tri-diagonal matrix system)
A_tridiag=[1, 0, 0, 0    % coefs matrix to solve for the Cs
   h(1), 2*(h(1)+h(2)), h(2), 0
   0,  h(2), 2*(h(2)+h(3)), h(3)
   0,  0,         0,  1];
b_tridiag=[0             % knowns   
   3*(fdiff(f(3),f(2),x(3),x(2))-fdiff(f(2),f(1),x(2),x(1)))
   3*(fdiff(f(4),f(3),x(4),x(3))-fdiff(f(3),f(2),x(3),x(2)))
   0];

c=inv(A_tridiag)*b_tridiag; % solve for the Cs of all eqs simulaneously

% solve for each b and each d
for i=1:n-1
    b(i)=(f(i+1)-f(i))/h(i)-h(i)/3*(2*c(i)+c(i+1));
    d(i)=(c(i+1)-c(i))/(3*h(i));
end

a=f;
% the as are known as the fs, now all coefs are known
coefficients=[a(1:n-1)',b',c(1:n-1),d']; % put the ceofficients in a matrix as collumns

show_spline(x,f,coefficients,[02:.001:10])


% user defined functions below 

% first order finite difference method
function df=fdiff(fi,fj,xi,xj)
    
    df=(fi-fj)/(xi-xj);

end


% show spline function
function show_spline(xdata,fdata,coefs,range)

    % coefs
    figure(1); hold on; grid on
    % show the experimental points (nodes)
    plot(xdata,fdata,'bo')
    % show the spline interpolation curve
    a=coefs(:,1); % unpack the coefs for convenience
    b=coefs(:,2);
    c=coefs(:,3);
    d=coefs(:,4);
    
    xinterp=range(1):.001:range(end); % x interpolation range

    n=length(xdata);

    i=1; % reset the spline index manually 
    for j=1:length(xinterp)
        
        if xinterp(j)>xdata(i+1) && i<n-1
            i=i+1; % move to the next function on the first data point in next interval
        end

        finterp(j) = a(i) ...
                   + b(i)*(xinterp(j)-xdata(i)) ...
                   + c(i)*(xinterp(j)-xdata(i)).^2 ...
                   + d(i)*(xinterp(j)-xdata(i)).^3;
 
    end

    plot(xinterp,finterp,'r')
    title('cubic polynomial spline')

end