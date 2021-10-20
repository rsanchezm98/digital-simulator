function [dx] = sys_model_multi(t, x)
u = sys_input_multi(t);
dx = -x + u;
end