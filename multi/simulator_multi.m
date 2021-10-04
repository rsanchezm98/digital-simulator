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
x = initial_state_multi;
y = sys_output_multi(t, x);
Y(1,:) = y';
X(1,:) = x';

%% select the method
method = "runge kutta4";

if method == "adaptive trapezoidal"
    step = h;
    tolerance = 0.001;
end

global A B

% define the model state matrixes
A = [-4 1; -5 0];
B = [3 0; 6 2];

%% main loop
index = 1;
time_start = tic;
while t < t_max
    switch method
        case "euler"
            [t,x] = euler_integration_multi(t, x);
        case "trapezoidal"
            [t,x] = trapezoidal_integration_multi(t, x);
        case "adaptive trapezoidal"
            [t,x, error] = adaptive_step_multi(t,x,step);
            step = interpolate_step(h_max, error, tolerance);
        case "adams"
            [t,x] = adams_bashford_multi(t,x);
        case "runge kutta2"
            [t,x] = runge_kutta2_multi(t,x);
        case "runge kutta4"
            [t,x] = runge_kutta4_multi(t,x);
    end
    y = sys_output_multi(t,x);
    index = index + 1;
    T(index) = t;
    Y(index,:) = y';
    X(index, :) = x';
    
end
time_out = toc(time_start);

disp("Elapsed computation time: " + string(time_out*1000) + " ms");

%% section to plot results
figure;
hold on;
plot(T,Y, 'linewidth',2, 'DisplayName', string(method));
title("Output");
xlabel("Time [s]");
grid on;legend;


figure;
hold on; grid on;
title("State evolution");
xlabel("Time [s]");
for i = 1:size(X,2)
    plot(T,X(:,i),'linewidth',2, 'DisplayName', 'X' + string(i));
end
legend;