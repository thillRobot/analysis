%% ME 3001 -001 Mechanical Engineering Analysis
%
% Tristan Hill - 7/1/2014
%
% Simple Truss Problem  
%%

P=100; % single point load on the truss

% compute reactin forces

RAx=0;
RAy=(1/5)*P;

dtr=pi/180;

% coefficient matrix

A=[ -cos(35*dtr) 0           -1
    -sin(35*dtr) 0           0 
    0            cos(45*dtr) 1 ];

B=[-RAx; -RAy; 0]

x=A\B