function [t,x] = euler_integration_multi(t,x)
    global h
    f = sys_model_multi(t,x);
    x = x + f*h;
    t = t + h;
end