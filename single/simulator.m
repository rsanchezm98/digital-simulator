clearvars
close all
% the persistent vars must be cleared with clear all
clear all

%% timing variables
t = 0;
t_max = 5;
T(1) = t;

%% some step global values
global h
% the lower the preciser but slower. Tune it
h = 0.1;
h_max = 0.3;


%% state and output variables
x = initial_state;
y = sys_output(t, x);
Y(1) = y;

%% select the method
method = "adaptive trapezoidal";

if method == "adaptive trapezoidal"
    step = h;
    tolerance = 0.001;
end

%% main loop
index = 1;
time_start = tic;
while t < t_max
    switch method
        case "euler"
            [t,x] = euler_integration(t, x);
        case "trapezoidal"
            [t,x] = trapezoidal_integration(t, x);
        case "adaptive trapezoidal"
            [t,x, error] = adaptive_step(t,x,step);
            step = interpolate_step(h_max, error, tolerance);
        case "adams"
            [t,x] = adams_bashford(t,x);
        case "runge kutta2"
            [t,x] = runge_kutta2(t,x);
        case "runge kutta4"
            [t,x] = runge_kutta4(t,x);
    end
    y = sys_output(t,x);
    index = index + 1;
    T(index) = t;
    Y(index) = y;
    
end
time_out = toc(time_start);

disp("Elapsed computation time: " + string(time_out*1000) + " ms");

%% section to plot results
figure;
hold on;
plot(T,Y, 'linewidth',2);
title("Output");
xlabel("Time [s]");
grid on;

Y_calculated = 1 - exp(-T);
plot(T, Y_calculated, 'linewidth', 2);

legend({method, 'formula'}, 'Location', 'NorthEast');