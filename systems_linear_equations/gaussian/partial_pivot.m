%%
% ME 3001 - Mechanical Engineering Analysis
% Tristan Hill - with Will added Comments 
%% this function performs partial pivoting on all columns of the matrix A
function [A,b] = partial_pivot(A,b)
    [m,n]=size(A);
    for h=1:n %run a loop for the numbre of columns of A
        
        max_pivot=A(h,h);%identifies pivots as n x n entry on each row
        max_row=h;%by default row is set to standard forward process
        for i=h:m  %loop through the rows
       
            if abs(A(i,h)) > abs(max_pivot)       %compare with left most element
                max_pivot=A(i,h); %identifies new pivot if higher value found in other row
                max_row=i; %identifies max row number 
            end 
            
        end
        
        %swap rows after maximum pivot in column is found
        for j=1:n   %saw element for each col
            tmp=A(max_row,j); %temporarily save max row values to tmp
            A(max_row,j)=A(h,j); %move previous values to original pivot row
            A(h,j)=tmp;% %move pivot values to required new locations
        end
        %then swap the elements of b
        tmp=b(max_row); %temporarily save max row b value to tmp
        b(max_row)=b(h); %move previous b value to original pivot b location
        b(h)=tmp; %move pivot b value to required new

    end
end   

