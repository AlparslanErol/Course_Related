% to close all running codes and its workspace
clc;
clear;
close all;

% bo must be greater than a0
a0=2;
b0=10;

uncert = b0-a0;
epsilon = 0.02;

%set i=0 and increase before printf...
i=0;

while uncert > epsilon
    %In bisection method we have only some if conditions
    %But main difference is we use derivative of the main function
    %you can find derivative version of the function from "fm.m"
    %we update x0 value after each iteration then continue
    x0 = (a0+b0)/2;

    if  fp(x0) > 0
        b0 = x0;
    elseif fp(x0) < 0
            a0 = x0;    
    else
        fprintf('Minimizer is %f',x0)
    end
    
    i = i+1;
    uncert = b0-a0;
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of a&b==> %f-%f ------ Uncertainity Interval ==> %f\n',i,f(a0),f(b0),uncert);
    fprintf('Minimizer %d ==> %f \n' ,i,(b0+a0)/2);
    fprintf('\n');
end