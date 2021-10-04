function [u] = sys_input(t)
    if t < 0
        u = 0;
    else
        u = 1;
    end
end