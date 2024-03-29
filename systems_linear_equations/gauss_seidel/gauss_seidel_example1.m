%%
% TTU - ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - 02/22/2024
% Gauss Siedel Successive Relaxation - Example 1
%%
clear variables;clc

% random test matrix
% A=[1 0 1 0   
%    14 3 -13 0
%    0 12 2  0
%    0 4 0 1]

% random test matrix
% A=[1 0 1 0  
%    14 3 -13 0
%    0 12 2  0
%    0 4 0 1]

%vector of knowns
% b=[4;6;15;2]   
% 
% x_check=inv(A)*b
% 
% Lstar=[A(1,1) 0 0 0  
%        A(2,1) A(2,2) 0 0
%        A(3,1) A(3,2) A(3,3) 0
%        A(4,1) A(4,2) A(4,3) A(4,4)]
% U=[0 A(1,2) A(1,3) A(1,4)
%    0 0      A(2,3) A(2,4)
%    0 0      0      A(3,4)
%    0 0      0      0    ]
% 
% A=[16 3
%     7 -11]
% b=[11;13]

% example from homework 
% define the given constants first
c01=10; c03=20; 
q01=5; q03=15;
q12=3; q15=3;
q23=2; q24=1; q25=2;
q31=1; q34=8;
q40=11;
q50=4; q54=2;

%define the matrix of coefficients
A = [-(q12+q15)  0               q31         0       0; 
     q12         -(q25+q24+q23)  0           0       0; 
     0           q23             -(q31+q34)  0       0; 
     0           q24             q34         -q40    q54; 
     q15         q25             0           0       -(q50+q54)];

%define the vector of knowns
b = [-q01*c01; 
     0 
     -q03*c03
     0 
     0];

% get the size
n=size(A,1);


% use the good ole matrix inverse method 
tic
x_check=inv(A)*b
toc

% use the supposedly faster and more accurate back divide method ???
% tic
% x_check=b\A
% toc


% initial geuss of solution
x0=[1; 1; 1; 1; 1];
tol=.1;

tic
% use gauss seidel matrix inverse based method
[Lstar,U]=getLU(A);

% A_check = Lstar+U
% A_check==A

xprev=x0;
h=1;
while h<5

   xnext=inv(Lstar)*(b-U*xprev);  
   %xnext=(b-U*xprev)\Lstar 
   xprev=xnext; 

   % xnext=-inv(Lstar)*U*xprev+inv(Lstar)*b;
   % xprev=xnext;
   h=h+1;
end
toc

xprev




tic
% gauss seidel equation method
x=solveGaussSeidel(A,b,x0)
toc

x_check



%% user defined function to generate new matrices U and Lstar from A
function [Lstar_, U_]=getLU(A_)
    
    n_=size(A_,1);
    for i=1:n_
        for j=1:n_
            if i>=j
                U_(i,j)=0;
                Lstar_(i,j)=A_(i,j);
    
            else
                U_(i,j)=A_(i,j);
                Lstar_(i,j)=0;
            end
       end
    end

end


%% user defined function to perform gauss seidel element based solution
function x = solveGaussSeidel(A_,b_,x0)

    % gauss seidel equation method
    xprev=x0;
    x=xprev*0;
    % res=1

    n=size(A_,1);
    h=1;
    while h<5

        for i=1:n

            s1=0;
            for j=1:i-1
                s1=s1+A_(i,j)*xprev(j);
            end

            s2=0;
            for j=i+1:n
                s2=s2+A_(i,j)*xprev(j);
            end
            x(i) = 1/A_(i,i)*(b_(i) - s1 - s2);    

            % res=abs(sum(xnext-xprev));
            xprev=x;

        end

        h=h+1;
    end

end







