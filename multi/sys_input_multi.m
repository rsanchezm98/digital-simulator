function [u] = sys_input_multi(t)

u1 = 0;
    if t >= 1
        u1 = 1;
    end

u2 = 0;
    if t >= 2
        u2 = 1;
    end
    
u = [u1;u2];
end