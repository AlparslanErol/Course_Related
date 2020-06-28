% to close all running codes and its workspace
clc;
clear;
close all;

% bo must be greater than a0
a0=2;
b0=10;

uncert = b0 - a0;
epsilon = 0.02;
%N is number of steps required to fibonacci search
N=0;
%Find N
while (1 + 2*epsilon)/(epsilon/2) >= fibonacci(N+1)
    N = N+1;
end
%I made k from 1 to N+1 because in N steps, algorithm
%convergance end and after N+1, start to give same results
%you can easily observe this process when you run my code
k = 1:N+1;

%Let i=1, but dont worry in while loop I increase i after
%fprintf functions, so we have no wrong iteration number in while loop
i=1;

while uncert >  epsilon
    %Fibonacci search algorith starts 
    ro = 1 - (fibonacci(N-k(i)+1+1)/fibonacci(N-k(i)+2+1));
    %Since Fibonacci is a improved version of Golden Section
    %We have again same algorithm in remaining part
    %Difference is we update ro value after each iteration
    %Them contiue iteration since we reach epsilon
    a1 = a0 + ro*(b0-a0);
    b1 = b0 - ro*(b0-a0);

    if f(a1)<f(b1)
        b0 = b1;
    end

    if f(a1) >= f(b1)
        a0 = a1;
    end
    
    uncert = b0 - a0;
    fprintf('Number of Iteration is ==> %d ------ Fucntion Value of a&b==> %f-%f ------ Uncertainity Interval ==> %f\n',i,f(a0),f(b0),uncert);
    fprintf('Minimizer %d ==> %f \n' ,i,(b0+a0)/2);
    fprintf('\n');
    i = i+1;
end