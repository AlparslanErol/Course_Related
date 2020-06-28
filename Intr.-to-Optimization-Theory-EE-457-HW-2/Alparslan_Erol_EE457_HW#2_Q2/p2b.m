% to close all running codes and its workspace
clc;
clear;
close all;

% ro given arbitrarily
ro = 0.382;
% bo must be greater than a0
a0=-3;
b0=0;

%absolute value is used becasue we used both + and - terms
uncert = abs(b0-a0);
epsilon = 0.02;
%for iteration count
i=0;

while uncert > epsilon
    %Golden Section algorithm
    a1 = a0 + ro*(b0-a0);
    b1 = b0 - ro*(b0-a0);

    if f2(a1)<f2(b1)
        b0 = b1;
    end

    if f2(a1) >= f2(b1)
        a0 = a1;
    end  
    i = i+1;
    uncert = abs(b0 - a0);
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of a&b==> %f-%f ------ Uncertainity Interval ==> %f\n',i,f2(a0),f2(b0),uncert);  
    fprintf('Minimizer %d ==> %f \n' ,i,(b0+a0)/2);
    fprintf('\n');
end   