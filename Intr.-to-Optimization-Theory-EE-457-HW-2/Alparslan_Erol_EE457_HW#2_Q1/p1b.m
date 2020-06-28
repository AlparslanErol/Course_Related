% to close all running codes and its workspace
clc;
clear;
close all;

% ro given arbitrerily
ro = 0.382;
% bo must be greater than a0
a0=2;
b0=10;


uncert = b0-a0;
epsilon = 0.02; %% given
i=0; % count iterations

while uncert > epsilon
    
    a1 = a0 + ro*(b0-a0);
    b1 = b0 - ro*(b0-a0);
    %Golden section algorithm
    if f(a1)<f(b1)
        b0 = b1;
    end

    if f(a1) >= f(b1)
        a0 = a1;
    end
    i = i+1;
    uncert = b0 - a0;
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of a&b==> %f-%f ------ Uncertainity Interval ==> %f\n',i,f(a0),f(b0),uncert);  
    fprintf('Minimizer %d ==> %f \n' ,i,(b0+a0)/2);
    fprintf('\n');
end   