function [t,x, error] = adaptive_step_multi(t,x, h)
    f = sys_model_multi(t, x);
    x0 = x + f*h;
    f0 = sys_model_multi(t + h, x0);
    x = x + (h/2)*(f + f0);
    t = t + h;

    y_0 = sys_output_multi(t,x0);
    y = sys_output_multi(t,x);

    error = norm(y-y_0);
    
end