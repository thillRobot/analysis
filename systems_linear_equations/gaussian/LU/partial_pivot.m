%%
% ME 3001 - Mechanical Engineering Analysis
% Tristan Hill 
%% this function performs partial pivoting on all columns if the matrix A
function [A,b] = partial_pivot(A,b)
    [m,n]=size(A);
    for h=1:n
    
        max_pivot=A(h,h);
        for i=h:n  %loop thr rows
            if A(i,h)>max_pivot       %compare with left most element
                max_pivot=A(i,h);

                for j=h:n   %loop thr cols
                    tmp=A(i,j);
                    A(i,j)=A(h,j);
                    A(h,j)=tmp;
                end
                tmp=b(i);
                b(i)=b(h);
                b(h)=tmp;
            end 
        end

    end
end
        

