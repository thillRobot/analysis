


%%

% lu decomp derivation


clear variables
close all
clc

% 
n=5;
for i=1:n
    for j=1:n       
        str=sprintf('a_%i%i',i,j)
        A_rhs(i,j)=sym(str)   
    end
end

for i=1:n
    for j=1:i
        if i==j
            str=sprintf('1')
            L(i,j)=sym(str)   
        else
            str=sprintf('l_%i%i',i,j)
            L(i,j)=sym(str)    
        end
    end
end

for i=1:n
    for j=i:n    
        str=sprintf('u_%i%i',i,j)
        U(i,j)=sym(str)           
    end
end



A_lhs=L*U
for i=1:n
    for j=i:n
        str=sprintf('u_%i%i',i,j);
        U_new(i,j)=solve(A_rhs(i,j)-A_lhs(i,j),str);
    end
end

U_new

for i=1:n
    for j=1:i

        if i==j
            str=sprintf('1');
            L_new(i,j)=sym(str) 
        else
            str=sprintf('l_%i%i',i,j)
            L_new(i,j)=solve(A_rhs(i,j)-A_lhs(i,j),str); 
        end
        
    end
end   

L_new


%% part 2 - test the formulas !!!

n=4

% a=[12 3 4
%     3 5 1
%     5 17 7]
n=5
a=rand(n,n)
%1 row and 1 col
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
            u_sum=l_sum+l(q,k)*u(k,p);
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


