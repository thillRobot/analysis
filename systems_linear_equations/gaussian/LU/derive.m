


%%

% lu decomp deriva_tion


clear variables
close all
clc


n=4;

syms l_21 l_31 l_41 l_32 l_42 l_43 one
syms u_11 u_12 u_13 u_14 u_22 u_23 u_24 u_33 u_34 u_44
syms a_11 a_12 a_13 a_14 a_21 a_22 a_23 a_24 a_31 a_32 a_33 a_34 a_41 a_42 a_43 a_44


L=[1    0   0   0 
   l_21  1   0   0
   l_31  l_32 1   0 
   l_41  l_42 l_43 1];

U=[u_11 u_12 u_13 u_14
    0  u_22 u_23 u_24
    0  0   u_33 u_34
    0  0   0   u_44];

a__rhs=[a_11 a_12 a_13 a_14
   a_21 a_22 a_23 a_24
   a_31 a_32 a_33 a_34
   a_41 a_42 a_43 a_44];

a__lhs=L*U


    for i=1:n
        for j=i:n
            str=sprintf('u_%i%i',i,j)
            U_new(i,j)=solve(a__rhs(i,j)-a__lhs(i,j),str);
        end
    end

    U_new
    
    for j=1:n
        for i=j:n
            
            if i==j
                L_new(i,j)=one;
            else
                str=sprintf('l_%i%i',i,j)
                L_new(i,j)=solve(a__rhs(i,j)-a__lhs(i,j),str) 
            end
            
%             L_new(i,j)=solve(a__rhs(i,j)-a__lhs(i,j),str)
        end
    end   
% i=1
% for j=2:n
%     
%     solve(a__rhs(i,j)-a__lhs(i,j),'l_11')
%     
% end



%% pa_rt 2 - test the formu_l_a_s !!!











