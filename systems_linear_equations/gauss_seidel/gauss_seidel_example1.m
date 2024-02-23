%%
% TTU - ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - 02/21/2024
% Gauss Siedel Successive Relaxation - Example 1
%%
clear variables;clc

A=[1 0 1 0  %test matrix
   14 3 -13 0
   0 12 2  0
   0 4 0 1]
b=[4;6;15;2]   %vector of knowns

x_check=inv(A)*b

Lstar=[A(1,1) 0 0 0  
       A(2,1) A(2,2) 0 0
       A(3,1) A(3,2) A(3,3) 0
       A(4,1) A(4,2) A(4,3) A(4,4)]
U=[0 A(1,2) A(1,3) A(1,4)
   0 0      A(2,3) A(2,4)
   0 0      0      A(3,4)
   0 0      0      0    ]

A_check = Lstar+U

A_check==A


x0=[2;-1;1;1]

% x1=inv(Lstar)*(b-U*x0)
% 
% x2=inv(Lstar)*(b-U*x1)
% 
% x3=inv(Lstar)*(b-U*x2)
% 
% x4=inv(Lstar)*(b-U*x3)

xprev=x0
for i=1:100000

%    xnext=inv(Lstar)*(b-U*xprev)  
   xnext=(b-U*xprev)\Lstar 
   xprev=xnext'; 

end




