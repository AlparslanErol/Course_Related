% to close all running codes and its workspace
clc;
clear;
close all;

epsilon = 0.02;
%for Newton's Method, we need x0 initial value to iterate next steps
x0 = 1;
%first iteration is made out of while loop because of to 
%have condition of while loop (x1-x0)
%first and second derivate of main function is used
x1 = x0 - (f2p(x0)/f2sp(x0));
uncert = abs(x1 - x0);
%since we iterate first one, i=1
i=1;

while uncert > epsilon
    
    %print funtions before starting algorithm, because
    %we already made first iteration out of while loop
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of X(k) ==> %f ------ Uncertainity Interval ==> %f\n',i,f2(x0),uncert);  
    fprintf('Minimizer %d ==> %f \n' ,i,(x1+x0)/2);
    fprintf('\n');
    %Newton's method algorithm
    %First and Second derivation are used
    x0 = x1;
    x1 = x0 - (f2p(x0)/f2sp(x0));
    uncert = abs(x1 - x0);
    i = i+1;
end
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of X(k) ==> %f ------ Uncertainity Interval ==> %f\n',i,f2(x0),uncert);  
    fprintf('Minimizer %d ==> %f \n' ,i,(x1+x0)/2);
    fprintf('\n');