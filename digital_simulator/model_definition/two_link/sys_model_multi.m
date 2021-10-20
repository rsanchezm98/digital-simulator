function [dx] = sys_model_multi(t, x)
u = sys_input_multi(t);

m1=2;l1=1;lc1=0.5;J1=0.5;b1=0.5;
m2=1.5;lc2=0.75;J2=0.25;b2=0.5;g=9.8;

z1=x(1);
z2=x(2);
dz1=x(3);
dz2=x(4);

H(1,1)= m1*lc1^2 + J1 + m2*(l1^2 + lc2^2 + 2*l1*lc2*cos(z2)) + J2;
H(1,2)= m2*l1*lc2*cos(z2) + m2*lc2^2 + J2;
H(2,1)= H(1,2);
H(2,2)= m2*lc2^2 + J2;

h = m2*l1*lc2*sin(z2);

hz = [-h*dz2 + b1 -h*(dz1 + dz2);h*dz1 b2];
g1 = m1*lc1*g*sin(z1) + m2*g*(lc2*sin(z1+z2) + l1*sin(z1));
g2 = m2*lc2*g*sin(z1 + z2);

d2z=H\(u - hz*[dz1;dz2]-[g1;g2]);

dx=[dz1; dz2; d2z(1); d2z(2)];

end