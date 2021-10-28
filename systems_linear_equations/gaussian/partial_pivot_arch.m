%%
% ME 3001 - Mechanical Engineering Analysis
% Tristan Hill 
%%
function [A,b] = partial_pivot(A,b)

    [m,n]=size(A);
    max_pivot=A(1,1);
    for i=1:n  %loop thr rows
        if A(i,1)>max_pivot       %compare with left most element
            max_pivot=A(i,1);
    %       swap row 1 and row i
            for j=1:n   %loop thr cols
                tmp=A(i,j);
                A(i,j)=A(1,j);
                A(1,j)=tmp;
            end
            tmp=b(i);
            b(i)=b(1);
            b(1)=tmp;
        end 
    end

end
        

