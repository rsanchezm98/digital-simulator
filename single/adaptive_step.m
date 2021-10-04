function [t,x, error] = adaptive_step(t,x, h)
    f = sys_model(t, x);
    x0 = x + f*h;
    f0 = sys_model(t + h, x0);
    x = x + (h/2)*(f + f0);
    t = t + h;

    y_0 = sys_output(t,x0);
    y = sys_output(t,x);

    error = norm(y-y_0);
    
end