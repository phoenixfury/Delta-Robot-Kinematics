function [J, F] = Delta_FK_sym(q, L)
%DELTA_FK Summary of this function goes here
%   Detailed explanation goes here

L1 = L(1);
L2 = L(2);

syms x y z L_b L_p phi q real
% F = (x - L_b*cos(phi) +L_p - L1*cos(phi)*cos(q) + L2 * sin(phi)* y/L2 )^2 +...
%     (y - L_b*sin(phi)  - L1*sin(phi)*cos(q) - L2 * cos(phi)* y/L2 )^2 +...
%     (z + L1*sin(q))^2 - ((L2^2) * (sqrt(L2^2 - y^2)/L2)^2);
F = (x - L_b*cos(phi) +L_p - L1*cos(phi)*cos(q) )^2 +...
    (y - L_b*sin(phi)  - L1*sin(phi)*cos(q) )^2 +...
    (z + L1*sin(q))^2 - (L2^2);
J= [diff(F, x), diff(F, y), diff(F,z)]; 

end

