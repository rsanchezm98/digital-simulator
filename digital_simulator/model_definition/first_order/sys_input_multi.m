function [u] = sys_input_multi(t)
    if t < 0
        u = 0;
    else
        u = 1;
    end
end