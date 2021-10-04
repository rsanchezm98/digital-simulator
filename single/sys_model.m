function [dx] = sys_model(t, x)
u = sys_input(t);
dx = -x + u;
end