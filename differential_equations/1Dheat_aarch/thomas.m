function [x]=thomas(a,b,c,d)
%this function solves n-simultaneous equation using tri-diagonal method
n=length(a);
%intialize temporary variables
P=ones(1,n);
Q=ones(1,n);
x=ones(1,n);
%forward substitution
P(1)=b(1)/a(1);
Q(1)=d(1)/a(1);
for i=2:n
    P(i)=b(i)/(a(i)-c(i)*P(i-1));
    Q(i)=(c(i)*Q(i-1)+d(i))/(a(i)-c(i)*P(i-1));
end
%backward substitution
x(n)=Q(n);
for i=n-1:-1:1
    x(i)=P(i)*x(i+1)+Q(i);
end
