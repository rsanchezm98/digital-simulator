function [t,x] = euler_integration(t,x)
    global h
    f = sys_model(t,x);
    x = x + f*h;
    t = t + h;
end