function [q] = Delta_IK(Tbase, pos, Ttool, L)
%DELTA_IK Summary of this function goes here
%   Detailed explanation goes here
T = eye(4);
T(1:3,4) = pos;

Tleg = Tbase \ T / Ttool;

l1 = L(1);
l2 = L(2);

x = Tleg(1,4);
y = Tleg(2,4);
z = Tleg(3,4);

% Passive angle number 3
q3 = asin(y / l2);

% active angle number 1

a = (l2^2 * (cos(q3))^2 - x^2 - z^2 -l1^2) / (2*l1);

phi = atan2(z,x);
% phi + q1 = acos(-a/ sqrt(z^2 + x^2))

q1 = - acos(-a/ sqrt(z^2 + x^2)) - phi;


% passive angle number 2

% q2 = acos( (x - l1*cos(q1)) / (l2*cos(q3))) + q1
co = (x - l1*cos(q1)) / (l2*cos(q3));
si = (z + l1*sin(q1)) / (-l2*cos(q3));
q2 = atan2(si,co) - q1 ;
q = [q1, q2, q3];

end

