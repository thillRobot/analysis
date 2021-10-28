
clear variables

A= [ 23 5 3 45 324 34 2 65 65 34 3223 11]
[min_val,min_idx]=min(A)

min_A=A(1)

for k=1:12
   if (A(k)<min_A)
        min_A=A(k)
   end
end

