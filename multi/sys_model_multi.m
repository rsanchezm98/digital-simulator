function [dx] = sys_model_multi(t, x)
u = sys_input_multi(t);
global A B
dx = A*x + B*u;
end