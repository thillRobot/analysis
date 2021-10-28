%% 
% ME3001 - Tennessee Technological University
% Tristan Hill, September 21, 2020
% Module 3 - Systems of Linear Equations
% Topic 2 - Matrix Mulitplication - Example 1
% This program demonstrates the O(n^3) nature of matrix multiplication
%%
clear variables 
clc

F=[23 45 17
    12 3 9]

G=[13 67
    5 18
    6 1]

% MATLAB can do matrix multiplication with *
E_check=F*G 


% this requires THREE nest loops to accomplish this 
% (but you usually dont see them)

m=2; % this is slightly goofy notation from TH
p=2;

n=3; % inner dimension

              
for i=1:m % this loop is for each row of result, E
   for j=1:p % this loop is for each column of result, E
      
      esum=0; % initialize the sum
       
      for k=1:n % the inner loop is the summation
          
          esum=esum+F(i,k)*G(k,j); % multilply ith row by jth col
                  
      end
      
      E(i,j)=esum; % save the sum as the element of E
       
   end
end
E 




