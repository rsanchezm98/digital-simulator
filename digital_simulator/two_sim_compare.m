%% clear data
clearvars
close all
% the persistent vars must be cleared with clear all
clear all

%% chose the model definition
dir = pwd;
folder = 'model_definition/two_link';
dir = [dir '\' folder];
userpath(dir);

global h error_max error_min
methods = ["euler"; "ode45"];
 figure;
for i = 1:size(methods, 1)
    X = [];
    Y = [];
    T = [];
    method = methods(i);
    disp(['Current method' method]);
    t = 0;
    t_max = 5;
    T(1) = t;
    h = 0.05;

    if(method == "ode45")
        error_max = 1e-8;
        error_min = 1e-10;
    else
        error_max = 1e-3;
        error_min = 1e-4;
    end
    
    %% state and output variables
    x = initial_state_multi;
    y = sys_output_multi(t, x);
    Y(1,:) = y';
    X(1,:) = x';
    
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
                [t,x] = adaptive_step_multi(t,x);
            case "adams"
                [t,x] = adams_bashford_multi(t,x);
            case "runge kutta2"
                [t,x] = runge_kutta2_multi(t,x);
            case "runge kutta4"
                [t,x] = runge_kutta4_multi(t,x);
            case "ode45"
                [t,x] = ode_45_multi(t,x);
        end
        y = sys_output_multi(t,x);
        index = index + 1;
        T(index) = t;
        Y(index,:) = y';
        X(index, :) = x';
        
    end
    time_out = toc(time_start);
    
    disp("Elapsed computation time: " + string(time_out*1000) + " ms");
    
    %% plot results
    % output
   
    subplot(2,1,1);hold on;grid on;
    for i = 1:size(Y,2)
        plot(T,Y(:,i), 'linewidth',2, 'DisplayName', 'Y' + string(i) + ' - ' + method);
    end
    title('Output with method: ' + method);
    xlabel("Time [s]");
    legend;
    
    % states
    subplot(2,1,2);
    grid on; hold on;
    title("State evolution");
    xlabel("Time [s]");
    for i = 1:size(X,2)
        plot(T,X(:,i),'linewidth',2, 'DisplayName', 'X' + string(i) + ' - ' + method);
    end
    legend;

    drawnow;
end
%% remove the current path
rmpath(dir);