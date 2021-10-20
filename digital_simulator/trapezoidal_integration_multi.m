function [t,x] = trapezoidal_integration_multi(t, x)
    global h
    f = sys_model_multi(t, x);
    x0 = x + f*h;
    f0 = sys_model_multi(t + h, x0);
    x = x + (h/2)*(f + f0);
    t = t + h;
end