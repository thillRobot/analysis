% matrix solver performance tests
clear all;
close all;

i=1;
for n=round(logspace(1,4.5))
    % Sparse tridiagonals
    e=ones(n,1);
    As=spdiags([e -2*e e], -1:1, n, n);
    xs=sparse(rand(n,1));
    bs=As*xs;
    tic; xs2=As\bs;
    temp=whos('As');
    Arams(i)=temp.bytes
    Ts(i)=toc
    
    % Full matrices
    Af=full(As);
    bf=full(bs);
    tic; xf2=Af\bf;
    temp=whos('Af');
    Aramf(i)=temp.bytes
    Tf(i)=toc

    % Handwritten TDMA solver
    a=diag(Af);
    b=-[diag(Af,-1); 0];
    c=-[0; diag(Af,1)];
    d=bf;
    tic; xt=thomas(a,b,c,d)';
    Tt(i)=toc;
    temp1=whos('a');
    temp2=whos('b');
    temp3=whos('c');
    Aramt(i)=temp1.bytes+temp2.bytes+temp3.bytes;

    % Downloaded TDMA solver
    a=diag(Af);
    b=diag(Af,-1);
    c=diag(Af,1);
    d=bf;
    tic; xt2=thomas2(a,b,c,d);
    Tt2(i)=toc;
    temp1=whos('a');
    temp2=whos('b');
    temp3=whos('c');
    Aramt2(i)=temp1.bytes+temp2.bytes+temp3.bytes;

    i=i+1;
end
n=round(logspace(1,4.5));
figure(1);
semilogy(n,Ts,n,Tf,n,Tt,n,Tt2);
legend('Sparse mrdivide','Full mrdivide','TDMA solver','Downloaded TDMA solver');
xlabel('Matrix rows');
ylabel('Solution time (s)');
title('Tridiagonal matrix solutions');

figure(2);
semilogy(n,Arams,n,Aramf,n,Aramt,n,Aramt2);
legend('Sparse mrdivide','Full mrdivide','TDMA solver','Downloaded TDMA solver');
xlabel('Matrix rows');
ylabel('Memory required (bytes)');
title('Tridiagonal matrix solutions');

