%%
% ME 3001 - Mechanical Engineering Analysis
%
%% Naive Gaussian Elmination 

function [A_reduc b_reduc]=ge_naive_nobacksub(A,b)

    [n,n]=size(A);
    %% perform the forward elimination on A
    for k=1:n-1      % k index or subscript of the variable whose coefficients will be zeroed
        for i=k+1:n
           xmult=A(i,k)/A(k,k);
           for j=k:n %start at k+1 to save time
                A(i,j)=A(i,j)-xmult*A(k,j);
           end
           b(i)=b(i)-xmult*b(k);
        end

    end
    A_reduc=A;
    b_reduc=b;
%     %% perform the backwards substituion to find x
% 
%     x(n)=b(n)/A(n,n);
% 
%     for i=n-1:-1:1 %notice the backwards indexing
%         ssum=b(i);
%         for j=i+1:n
%             ssum=ssum-A(i,j)*x(j);
%         end
%         x(i)=ssum/A(i,i);
%     end
% 
% 
%     

    
   
