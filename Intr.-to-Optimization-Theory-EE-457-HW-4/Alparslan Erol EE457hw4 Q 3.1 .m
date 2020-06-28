%Clear all command window and workspace
clear;
close all;
clc;


A = [0 1;7 1;14 1;21 1;28 1;35 1;42 1;...
      49 1;56 1;63 1;70 1;77 1;84 1;91 1;...
      98 1;105 1;112 1;119 1;119 1;126 1];
A0 = [A(1,1) A(1,2);A(2,1) A(2,2)];

b = [ 2.68242,2.64755,2.68472,2.68472,2.77880,2.77856,2.88432,2.92674,2.92866,3.01290,...
      3.03274,3.00027,3.02782,2.97552,2.91740,2.89356,2.88655,2.85020,2.89398,2.86638]';
a=0;
i=1;
    A0 = [A(1,1) A(1,2);A(2,1) A(2,2)];
    
    b0 = [b(1);b(2)];

    P0 = inv(A0.'*A0);

    x0 = P0*A0.'*b0;

    m(i) = x0(1);
    c(i) = x0(2);
    z = 3;
while( a < 18 )
    
    a1 = [A(z,1) A(z,2)]';
    
    b1 = [b(i)];

    P1 = P0 - ( (P0*a1*(a1.')*P0) / (1 + (a1.')*P0*a1) );

    x1 = x0 + P1*a1*(b1-((a1.')*x0));
    
    i=i+1;
    m(i) = x1(1);
    c(i) = x1(2);
    
    z = z+1;
    a = a + 1;
    P0 = P1;
    x0 = x1;
end

plot(m);
grid on;
legend m;
xlabel('Iteration Number k')
ylabel('m')
figure;
plot(c);
grid on;
legend c;
xlabel('Iteration Number k')
ylabel('c')
