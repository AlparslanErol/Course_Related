function y = fi(alpha,x)
    
    y = (-gradrosen(x)') * gradrosen(x - (alpha .* gradrosen(x)));
    
end

