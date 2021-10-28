%% 
% ME 3001-001 , Tristan Hill, 6/9/2014, Summer 2014
%
% Systems of Simulataneous Linear Equations 
%
% Scafolding Tension Example - Applied Numerical Methods - Rao - pg.144
%% 

% sum of vertical forces, and sum of moments applied to all three bars 
% 6 linear equations - 6 unknowns
% knowns - P1,P2,P3, unknowns - TA,TB,TC,TD,TE,TF
% equations cast into matrix form

P1=2000; %lb
P2=1000; %lb
P3=500;  %lb

A = [0 0  0  0  1 1
     0 0  0  0  0 4
     0 0  1  1 -1 0
     0 0  0  3 -2 0 
     1 1 -1 -1  0 -1
     0 9 -1 -4 0 -7];
 
b = [ P3
      P3
      P2
      P2
      P1
      5*P1 ];

              %two matlab methods for sovling for unknowns  
% x = A\b       %backdivide method
x = inv(A)*b  %inv() method    

  
  
 