function [t,x] = runge_kutta4_multi(t,x)
    global h
    
    alfa_2 = 0.5;
    alfa_3 = 0.5;
    alfa_4 = 1;
    
    beta_21 = 0.5;
    beta_31 = 0;
    beta_32 = 0.5;
    beta_41 = 0;
    beta_42 = 0;
    beta_43 = 1;
    
    w1 = 1/6;
    w2 = 2/6;
    w3 = 2/6;
    w4 = 1/6;
    
    R1 = h*sys_model_multi(t,x);
    R2 = h*sys_model_multi(t + alfa_2*h, x + beta_21*R1);
    R3 = h*sys_model_multi(t + alfa_3*h, x + beta_31*R1 + beta_32*R2);
    R4 = h*sys_model_multi(t + alfa_4*h, x + beta_41*R1 + beta_42*R2 + beta_43*R3);
    x = x + w1*R1 + w2*R2 + w3*R3 + w4*R4;
    t = t + h;
end