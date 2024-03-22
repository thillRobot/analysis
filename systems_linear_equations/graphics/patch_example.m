% ME3001-002 - Tennessee Technological University
% Tristan Hill - February 29, 2024
% simple graphics with plot and patch

clear variables; close all; clc


  clear variables;clc;close all
   s=1;
   cube.vertices=[0, 0, 0 
                s, 0, 0
                  s, s, 0
                  0, s, 0
                 0, 0, s 
                  s, 0, s 
                  s, s, s
                 0, s, s];
  
   cube.faces=[1, 2, 3, 4
           5, 6, 7, 8
               1, 2, 6, 5
               2, 3, 7, 6
               3, 4, 8, 7
               4, 1, 5, 8];
 
  figure(1); hold on
  ph1=patch(cube);
  ph1.EdgeColor=[1.0000,0.8667,0];
  ph1.FaceColor=[0.3098,0.1608,0.5176];
  ph1.LineWidth=2;
  axis equal
  view(3) 
 
  alpha=10 % angle about x
  beta=0   % angle about y
  gamma=0  % angle about z

  Rx=[1 0 0 ; 0 cos(alpha) -sin(alpha); 0 sin(alpha) cos(alpha)]
  Ry=[cos(beta) 0 sin(beta); 0 1 0 ; -sin(beta) 0 cos(beta)]
  Rz=[cos(gamma) -sin(gamma) 0; sin(alpha) cos(alpha) 0; 0 0 1]

  pause(2)
  ph2=ph1
  
  ph2.Vertices=cube.vertices*Rx
  
 




