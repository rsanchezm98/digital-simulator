function [t,x] = runge_kutta2(t,x)
    global h
    alfa = 0.5;
    beta = 0.5;
    w1 = 0;
    w2 = 1;
    R1 = h*sys_model(t,x);
    R2 = h*sys_model(t + alfa*h, x + beta*R1);
    x = x + w1*R1 + w2*R2;
    t = t + h;
end