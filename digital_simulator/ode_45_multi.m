function [t,x] = ode_45_multi(t,x)
    global h error_max error_min

    alfa_2 = 1/5;
    alfa_3 = 3/10;
    alfa_4 = 4/5;
    alfa_5 = 8/9;
    alfa_6 = 1;
    alfa_7 = 1;
    
    beta_21 = 1/5;
    beta_31 = 3/40;
    beta_32 = 9/40;
    beta_41 = 44/45;
    beta_42 = -56/15;
    beta_43 = 32/9;
    beta_51 = 19372/6561;
    beta_52 = -25360/2187;
    beta_53 = 64448/6561;
    beta_54 = -212/729;
    beta_61 = 9017/3168;
    beta_62 = -355/33;
    beta_63 = 46732/5247;
    beta_64 = 49/176;
    beta_65 = -5103/18656;
    beta_71 = 35/384;
    beta_72 = 0;
    beta_73 = 500/1113;
    beta_74 = 125/192;
    beta_75 = -2187/6784;
    beta_76 = 11/84;
    
    w41 = 35/384;
    w42 = 0;
    w43 = 500/1113;
    w44 = 125/192;
    w45 = -2187/6784;
    w46 = 11/84;
    w47 = 0;

    w51 = 5179/57600;
    w52 = 0;
    w53 = 7571/16695;
    w54 = 393/640;
    w55 = -92097/339200;
    w56 = 187/2100;
    w57 = 1/40;
    
    
    while true
        R1 = h*sys_model_multi(t,x);
        R2 = h*sys_model_multi(t + alfa_2.*h, x + beta_21.*R1);
        R3 = h*sys_model_multi(t + alfa_3.*h, x + beta_31.*R1 + beta_32.*R2);
        R4 = h*sys_model_multi(t + alfa_4.*h, x + beta_41.*R1 + beta_42.*R2 + beta_43.*R3);
        R5 = h*sys_model_multi(t + alfa_5.*h, x + beta_51.*R1 + beta_52.*R2 + beta_53.*R3 + beta_54.*R4);
        R6 = h*sys_model_multi(t + alfa_6.*h, x + beta_61.*R1 + beta_62.*R2 + beta_63.*R3 + beta_64.*R4 + beta_65.*R5);
        R7 = h*sys_model_multi(t + alfa_7.*h, x + beta_71.*R1 + beta_72.*R2 + beta_73.*R3 + beta_74.*R4 + beta_75.*R5 + beta_76.*R6);

        x_RK4 = x + w41.*R1 + w42.*R2 + w43.*R3 + w44.*R4 + w45.*R5 + w46.*R6 + w47.*R7;
        x_RK5 = x + w51.*R1 + w52.*R2 + w53.*R3 + w54.*R4 + w55.*R5 + w56.*R6 + w57.*R7;

        %% here we should compute the error
        error = norm(abs(x_RK4) - abs(x_RK5));
        if error < error_max
            break;
        end
        h = h/2;
    end

    x = x_RK5;
    t = t + h;

    if error < error_min
        h = 1.5*h;
    end
end