function [step] = interpolate_step(h_max, error, tolerance)
    
    step = min(h_max, tolerance/error);
    
end