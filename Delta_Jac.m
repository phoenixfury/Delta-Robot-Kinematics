function [J] = Delta_Jac(q, phi, L)
%DELTA_JAC Summary of this function goes here
%   Detailed explanation goes here
q11 = q(1,1);
q12 = q(1,2);
q13 = q(1,3);

q21 = q(2,1);
q22 = q(2,2);
q23 = q(2,3);

q31 = q(3,1);
q32 = q(3,2);
q33 = q(3,3);

phi1 = phi(1);
phi2 = phi(2);
phi3 = phi(3);

L1 = L(1);
L2 = L(2);

% beta1 = cos(q11+q12);
% beta2 = cos(q11+q12);
% beta3 = -2*sin(q11+q12);
% 
% beta4 = cos(q21+q22);
% beta5 = cos(q21+q22);
% beta6 = -2*sin(q21+q22);
% 
% beta7 = cos(q31+q32);
% beta8 = cos(q31+q32);
% beta9 = -2*sin(q31+q32);
expression = L2 * tan(q13) * sin(phi1) + sin(q11) * sin(q12) * cos(phi1) - cos(q11) * cos(12) * cos(phi1);
beta1 = - sin(phi1) * expression;

beta2 = cos(q11+q12)+ cos(phi1)*expression;

beta3 = - sin(q11+q12) * sin(phi1);

expression2 = L2 * tan(q23) * sin(phi2) + sin(q21) * sin(q22) * cos(phi2) - cos(q21) * cos(22) * cos(phi2);
beta4 = - sin(phi2) * expression2;

beta5 = cos(q21+q22)+ cos(phi2)*expression2;

beta6 = - sin(q21+q22) * sin(phi2);

expression3 = L2 * tan(q33) * sin(phi3) + sin(q31) * sin(q32) * cos(phi3) - cos(q31) * cos(32) * cos(phi3);
beta7 = - sin(phi3) * expression3;

beta8 = cos(q31+q32)+ cos(phi3)*expression3;

beta9 = - sin(q31+q32) * sin(phi3);
% beta1 = sin(q13)* cos(q12 + q11) * cos(phi1) + cos(q13)*sin(phi1);
% beta2 = -sin(q13)* cos(q12 + q11) * sin(phi1) + cos(q13)*cos(phi1);
% beta3 = sin(q13)*sin(q12+q11);
% 
% beta4 = sin(q23)* cos(q22 + q21) * cos(phi2) + cos(q23)*sin(phi2);
% beta5 = -sin(q23)* cos(q22 + q21) * sin(phi2) + cos(q23)*cos(phi2);
% beta6 = sin(q23)*sin(q22+q21);
% 
% beta7 = sin(q33)* cos(q32 + q31) * cos(phi3) + cos(q33)*sin(phi3);
% beta8 = -sin(q33)* cos(q32 + q31) * sin(phi3) + cos(q33)*cos(phi3);
% beta9 = sin(q33)*sin(q32+q31);

J_z = [ beta1 beta2 beta3;
        beta4 beta5 beta6;
        beta7 beta8 beta9];
    
% theta1 = 2*cos(q11)^2 * sin(q12) + sin(q11)^2 * sin(q12) * cos(phi1) + 2*cos(q11)*cos(q12)*sin(q11) + sin(q11)^2 * sin(q12) * sin(phi1)...
%         - cos(q11) * cos(q12) * sin(q11) * cos(phi1) - cos(q11) * cos(q12) * sin(q11) * sin(phi1);
% 
% theta2 = 2*cos(q21)^2 * sin(q22) + sin(q21)^2 * sin(q22) * cos(phi2) + 2*cos(q21)*cos(q22)*sin(q21) + sin(q21)^2 * sin(q22) * sin(phi2)...
%         - cos(q21) * cos(q22) * sin(q21) * cos(phi2) - cos(q21) * cos(q22) * sin(q21) * sin(phi2);
%     
% theta3 = 2*cos(q31)^2 * sin(q32) + sin(q31)^2 * sin(q32) * cos(phi3) + 2*cos(q31)*cos(q32)*sin(q31) + sin(q31)^2 * sin(q32) * sin(phi3)...
%         - cos(q31) * cos(q32) * sin(q31) * cos(phi3) - cos(q31) * cos(q32) * sin(q31) * sin(phi3);
theta1 = L1 * sin(q12) * sin(phi1);
theta2 = L1 * sin(q22) * sin(phi2);
theta3 = L1 * sin(q32) * sin(phi3);
% theta1 = sin(q12)*sin(q13);
% theta2 = sin(q22)*sin(q23);
% theta3 = sin(q32)*sin(q33);
J_theta = diag([theta1, theta2, theta3]);

J =  J_z \ J_theta  ;

end

