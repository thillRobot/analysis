%% ME 3001 - Mechanical Engineering Analysis
% 
% Tristan Hill - modified from Dr. Han - 7/21/2014
%
% Euler's and Crank-Nicolson Runga-Kutta methods
%
% Example 1 
%% 

clear all
close all 
clc

% ODE to solve: dy/dx=(1-x)y, initial condition y=1 at x=0
slopeFun=@(x,y) (1-x)*y;

h=.5; % independent variable step size
he=.001; %step size for exact
xmax=5;
x=0:h:xmax;
xe=0:he:xmax;

y(1)=1; %initial condition

ye=exp(xe-xe.^2/2);

figure(1); hold on
plot(xe,ye)
axis([0 1 .8 1.8])

tol=1e-3;
maxidx=100;
%Crank-Nicolson Method
for i=1:length(x)-1
   yp=y(i);% initial guess for next y val. y(i+1) (predicted)
   idx=0;
   search=1;
   plot(x(i),y(i),'bo')
   
   fact=sqrt(1+slopeFun(x(i),y(i))^2);
   pause
   quiver(x(i),y(i),1/fact,slopeFun(x(i),y(i))/fact,0)
       
   while search && idx<maxidx
       
       avgSlope=(slopeFun(x(i),y(i))+slopeFun(x(i+1),yp))/2; 
       yc=y(i)+avgSlope*h; %corrected val for y(i+1)
       error=abs(yc-yp)/yp;
       
       plot(x(i+1),yp,'rp')
       plot(x(i+1),yc,'gp')
       quiver(x(i+1),yp,1,slopeFun(x(i+1),yp),0)
       pause
       quiver(x(i),y(i),1,avgSlope,0)
       pause 
       if error<tol
           y(i+1)=yc;
           search=0;
           hold off
           plot(xe,ye);hold on
           axis([0 xmax -.2 2])
       else
           yp=0.5*(yp+yc);
           idx=idx+1;
       end
       pause    
   end
  
end
    
% figure(1)
% plot(x,y,'x',x,ye)
legend('C-N','exact')
xlabel('x');ylabel('y')

