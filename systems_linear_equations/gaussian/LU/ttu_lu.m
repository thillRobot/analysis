function [l,u]=ttu_lu(a)

[m,n]=size(a);
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
