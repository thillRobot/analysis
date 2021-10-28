%%
% ME 3001 - Mechanical Engineering Analysis
% Tristan Hill 
%% this function performs partial pivoting on all columns if the matrix A
function [A,b] = partial_pivot(A,b)
    [m,n]=size(A);
    for h=1:n
        
        max_pivot=A(h,h);
        max_row=h;
        for i=h:m  %loop thr rows
       
            if A(i,h)>max_pivot       %compare with left most element
                max_pivot=A(i,h);
                max_row=i;
            end 
            
        end
        
        %now swap after the max pivot element for that col has been found
        for j=1:n   %saw element for each col
            tmp=A(max_row,j);
            A(max_row,j)=A(h,j);
            A(h,j)=tmp;
        end
        tmp=b(max_row); %then swap the elements of b
        b(max_row)=b(h);
        b(h)=tmp;

    end
end
        

