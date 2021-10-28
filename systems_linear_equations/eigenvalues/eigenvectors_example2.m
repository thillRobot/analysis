%%
% ME3001 - 001 - Tennessee Technological University - Fall 2016 - Fall 2017
% Tristan Hill - 10/03/2016 - 09/28/2017
% Eigenvectors and Eigenvalues - Demo Code - Otto ch 6.5
%%
clear variables;close all;clc


%% a very basic example (on the axis)
% Otto page 204

% A=[3 0
%    0 2];
% 
% x=0;
% y=3;
% 
% p=[x; y]
% 
% p_prime=A*p
% 
% % show in a figure
% figure(1);
% hold on
% h=plot([0 p(1)],[0 p(2)],'-','LineWidth',2,'Color',[112, 217, 169]/255 );
% plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
% legend('p','p''')
% title('Example 1')

%% a more complex example (pg205)
%Otto page 204

A=[1 2
   3 2];

lam1=-1;
lam2=4;

% lam1, -1
x=1.5;
y=-1;

p=[x; y]

p_prime=A*p

% show in a figure
figure(2);
subplot(2,1,2);hold on
ph=plot([0 p(1)],[0 p(2)],'b-','LineWidth',2)
plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
legend('p','p''')
title('Example 2 - lambda=-1')
% % 
% lam2, 4
x=1;
y=3/2;

p=[x; y]

p_prime=A*p

% show in a figure

subplot(2,1,1);hold on
ph=plot([0 p(1)],[0 p(2)],'b-','LineWidth',2)
plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
legend('p','p''')
title('Example 2 - lambda=4')
% % 
% % 
% % 
% % %% a twist on example 2 (scaled)
% % %Otto page 204
% % 
% % A=[1 2
% %    3 2];
% % 
% % lam1=4;
% % lam2=-1;
% % % lam1, -1
% % x=1;
% % y=-1;
% % 
% % p=[x; y]
% % 
% % p_prime=A*p
% % 
% % % show in a figure
% % figure(3);
% % subplot(2,1,2);hold on
% % plot([0 p(1)],[0 p(2)],'b-')
% % plot([0 p_prime(1)],[0 p_prime(2)],'g:')
% % legend('p','p''')
% % title('Example 2 (mod)- lambda=-1')
% % 
% % % lam2, 4
% % x=2;
% % y=3;
% % 
% % p=[x; y]/sqrt(x^2+y^2)
% % 
% % 
% % p_prime=A*p
% % 
% % % show in a figure
% % 
% % subplot(2,1,1);hold on
% % plot([0 p(1)],[0 p(2)],'b-')
% % plot([0 p_prime(1)],[0 p_prime(2)],'g:')
% % legend('p','p''')
% % title('Example 2 (mod)- lambda=4')
% % 
% 
% %% automate example 2 
% %Otto page 204
% 
% A=[1 2
%    3 2];
% 
% [V,D]=eig(A)
% 
% % lam1, 4
% lam1=D(1,1);
% lam2=D(2,2);
% 
% x=V(1,2)
% y=V(2,2)
% 
% p=[x; y]*-1
% 
% p_prime=A*p
% 
% % show in a figure
% figure(4);
% subplot(2,1,1);hold on
% plot([0 p(1)],[0 p(2)],'b-','LineWidth',2);
% plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
% legend('p','p''');
% title('Example 2 (mod)- lambda=4')
% 
% % lam1, -1
% x=V(1,1)
% y=V(2,1)
% 
% p=[x; y]*-1
% 
% p_prime=A*p
% 
% % show in a figure
% subplot(2,1,2);hold on
% plot([0 p(1)],[0 p(2)],'b-','LineWidth',2);
% plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
% legend('p','p''');
% title('Example 2 (mod)- lambda=-1')
% 
% %% automate example 2 
% %Otto page 204
% 
% A=[1 2
%    3 2];
% 
% [V,D]=eig(A)
% 
% % lam1, 4
% lam1=D(1,1);
% lam2=D(2,2);
% 
% x=V(1,2)
% y=V(2,2)
% 
% p=[x; y]*-1
% 
% p_prime=A*p
% 
% % show in a figure
% figure(5);
% subplot(2,1,1);hold on
% plot([0 p(1)],[0 p(2)],'-','LineWidth',2,'Color',[112, 217, 169]/255 );
% plot([0 p_prime(1)],[0 p_prime(2)],'m:','LineWidth',2)
% legend('p','p''')
% title('Example 2 (mod)- lambda=4')
% 
% % lam1, -1
% x=V(1,1)
% y=V(2,1)
% 
% p=[x; y]*-1
% 
% p_prime=A*p
% 
% % show in a figure
% subplot(2,1,2);hold on
% plot([0 p(1)],[0 p(2)],'b-','LineWidth',2);
% plot([0 p_prime(1)],[0 p_prime(2)],'k','LineWidth',2)
% legend('p','p''')
% title('Example 2 (mod)- lambda=-1')
% 
% 
% 
