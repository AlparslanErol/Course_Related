clc;
clear;
close all;

% bo must be greater than a0
a0=-3;
b0=0;

uncert = abs(b0-a0);
epsilon = 0.02;
%for iteration count
i=0;

while uncert > epsilon
    %Bisection algorithm
    x0 = (a0+b0)/2;

    if  f2p(x0) > 0
        b0 = x0;
    elseif f2p(x0) < 0
            a0 = x0;    
    else
        fprintf('Minimizer is %f',x0)
    end
    
    i = i+1;
    uncert = abs(b0-a0);
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of a&b==> %f-%f ------ Uncertainity Interval ==> %f\n',i,f2(a0),f2(b0),uncert);
    fprintf('Minimizer %d ==> %f \n' ,i,(b0+a0)/2);
    fprintf('\n');
end