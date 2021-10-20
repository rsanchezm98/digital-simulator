function [dx] = sys_model_multi(t, x)
u = sys_input_multi(t);

A = [-4 1; -5 0];
B = [3 0; 6 2];

dx = A*x + B*u;
end