function y = fii(alpha,x)
    
    y = rosen(x - (alpha .* gradrosen(x)));
    
end

