X=0:.1:10

Y1=sin(X)
Y2=.1*sin(5*X)
Y3=Y1+Y2
close all
plot(Y1,'r');hold on
plot(Y2,'g')
plot(Y3,'k')