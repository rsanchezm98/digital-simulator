function [t,x, error] = adaptive_step_multi(t,x)
    global h error_max error_min

    f = sys_model_multi(t, x);
    
    % iterate till find an error less than the max error in that iteration
    while true
        x0 = x + f*h;
        f0 = sys_model_multi(t + h, x0);
        x1 = x + (h/2)*(f + f0);
        error = norm(x0-x1); 
        if error < error_max
            break;
        end
        h = h/2;
    end
    t = t + h;
    x = x1;

    if error < error_min
        h = 1.5*h;
    end
    
end