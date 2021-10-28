%% 
% TTU - ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - 6/29/2016
% 
% LU decomposition - hw 4 helper code
%%

clear variables
close all
clc

n=5
% a=rand(n,n)
b=rand(n,1)

 a=[   0    0.0975    0.1576    0.1419    0.6557
    0.9058    0    0.9706    0    0.0357
    0.1270    0.5469    0    0.9157    0.8491
    0.9134    0.9575    0.4854    0.7922    0.9340
    0.6324    0.9649    0.8003    0.9595    0]

a=partial_pivot(a,b)

%row1 and col1
for i=1:n
    l(i,1)=a(i,1)/a(1,1);
end
for j=1:n
    u(1,j)=a(1,j);
end

for p=2:n %outer loop (o)
    for q=2:n %inner loop (i)
       
        l_sum=0; % start summation
        u_sum=0;
        for k=1:q-1
            l_sum=l_sum+l(p,k)*u(k,q);
            u_sum=u_sum+l(q,k)*u(k,p);
        end        
        u(q,p)=a(q,p)-u_sum;
        l(p,q)=(a(p,q)-l_sum)/u(q,q);
    
        if p==q
            l(p,q)=1;
        elseif p>q
            u(p,q)=0;
        elseif q>p
            l(p,q)=0;
        end
        
    end 
 end

l
u
l*u
