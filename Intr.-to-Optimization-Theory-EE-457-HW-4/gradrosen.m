function [y] = gradrosen(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% GRADIENT OF ROSENBROCK FUNCTION
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    y   = [ (400 * x(1).^3) + ( x(1) * (2 - (400*x(2))))-2,...
        (400*x(2).^3) + ( x(2) * (202-(400*x(3)))) - (200*x(1).^2)-2,...
        (200*x(3)) - (200*x(2).^2) ]';
    
end