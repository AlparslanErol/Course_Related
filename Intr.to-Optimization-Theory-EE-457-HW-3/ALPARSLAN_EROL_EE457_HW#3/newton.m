function x1 = newton()

    epsilon = 0.02;
    %for Newton's Method, we need x0 initial value to iterate next steps
    x0 =   [3,-1,0]';
    %first iteration is made out of while loop because of to 
    %have condition of while loop (x1-x0)
    %first and second derivate of main function is used
    x1 = x0 - (rosenprime(x0)/hessianrosen(x0));
    uncert = abs(x1 - x0);
    %since we iterate first one, i=1
    i=1;

    while uncert > epsilon

        %Newton's method algorithm
        %First and Second derivation are used
        x0 = x1;
        x1 = x0 - (rosenprime(x0)/hessianrosen(x0));
        uncert = abs(x1 - x0);
        i = i+1;
    end
    
end

