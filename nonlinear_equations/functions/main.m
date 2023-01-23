clear all
close all

%% playing with functions


xmin=-.5;
xmax=10;
xdel=.01;

x=xmin:xdel:xmax;

for i=1:length(x)
    x(i);
    f1(i)=fun1(x(i));
    f2(i)=fun2(x(i));
end


plot(x,f1,'-',x,f2,'-')
grid on

j=1;
s0=sign(f1(j)-f2(j));
while(sign(f1(j)-f2(j))==s0)
    j=j+1;
end

disp('they crossed')

x(j)
f1(j)
f2(j)

