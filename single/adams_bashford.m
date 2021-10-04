function [t,x] = adams_bashford(t,x)
    global h
    persistent fr_2 fr_1 fr
    if isempty(fr_2)
        fr_2 = sys_model(t,x);
        [t,x] = euler_integration(t,x);
        return;
    end   
    if isempty(fr_1)
        fr_1 = sys_model(t,x);
        [t,x] = euler_integration(t,x);
        return;
    end 
    if isempty(fr)
        fr = sys_model(t,x);
        [t,x] = euler_integration(t,x);
        return;
    end 
    fr_3 = fr_2;
    fr_2 = fr_1;
    fr_1 = fr;
    fr = sys_model(t,x);
    x = x + h/24*(55*fr - 59*fr_1 + 37*fr_2 - 9*fr_3);
    t = t + h;
end