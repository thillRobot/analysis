
dx= 0.1
al=0.35
TS=365
T1=70

T2=al*dx^2*(T1-TS)+2*T1


% T3=al*dx^2*(T-TS)+2*T1

T(1)=T1
T(2)=T2


for i = 2:5
   
    T(i+1)=-al*dx^2*(T(i)-TS)+2*T(i)-T(i-1)
    
end


