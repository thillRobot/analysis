%%
%
%Jacobi and Gauss Seidel Iterative Method
%
%%

clear all
close all
clc

A=[ 17 -2 -3
    -5 21 -2
    -5 -5 22 ];
b=[1;1;2];
n=length(b);
% b=[1;2;32];

x=zeros(n,1);

%solve the system using the Jacobi Method
N=3; %number of iterations
 
for i=1:N
   for j=1:n
       RHS=b(j); 
       for k=1:n
            if j~=k
                RHS=RHS-A(j,k)*x(k,i);
            end
       end
       x(j,i+1)=RHS/A(j,j)
   end 
end

% for i=1:N
%     for j=1:n
%        RHS=b(j); 
%        for k=1:n
%             if j~=k
%                 RHS=RHS-A(j,k)*x(k);
%             end
%        end
%        x(j)=RHS/A(j,j);
%     end 
%     x
% end

% make a plot to show convergence
x_direct=A\b;

cmap=colormap;
figure(1);hold on
cinc=round(64/n);
ccnt=1;
for j=1:n
    plot([0 N],[x_direct(j) x_direct(j)],':','Color',cmap(ccnt,:))
    plot(x(j,:),'Color',cmap(ccnt,:))
    ccnt=ccnt+cinc;
end


