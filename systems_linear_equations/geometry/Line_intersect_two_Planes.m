% Equation to find a line as an intersection of two plane
% SCanfield, Feb 2018
% input: 2 planes in standard form
% output, equations of the line vs. variable s (scalar displacement along
% the line)

%input two planes;
A1=2.5; B1=-1.2; C1=1; D1=-5;
                A2=1; B2=1; C2=-1; D2=-1;

                %Find unit vector parallel to the line: L
                v1=[A1;B1;C1]; v2=[A2;B2;C2];
                L_vec=[B1*C2-C1*B2;C1*A2-A1*C2; A1*B2-B1*A2];
                L=L_vec/(sqrt(L_vec(1)^2+L_vec(2)^2+L_vec(3)^2));

% find a point P on the line: assume z=0 (THIS IS NOT GENERAL)
if (L_vec(1)~=0)
    A=[A1,B1;A2,B2];b=-[D1;D2];
    ans=inv(A)*b;
    P=[ans(1);ans(2);0];
else
    %need alt code here
end

%Now the equation of the line is:
%x=P(1)+L(1)*s; y=P(2)+L(2)*s; z=P(3)+L(3)*s;
idx=1;
for s=1:100;
    x(idx)=P(1)+L(1)*s;
    y(idx)=P(2)+L(2)*s;
    z(idx)=P(3)+L(3)*s;
    idx=idx+1;
end



