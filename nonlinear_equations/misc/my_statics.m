function h=my_statics(P1,L,P,E1,E2,A1,A2)
    
    h=P1*L/(A1*E1)-(P-P1)*L/(A2*E2);
    
end