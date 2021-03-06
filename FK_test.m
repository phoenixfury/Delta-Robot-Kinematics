function [T, T1, T2, T3] = FK_test(Tbase,q,Ttool, L)
%FK_TEST Summary of this function goes here
%   Detailed explanation goes here

l1 =L(1);
l2 = L(2);
% Ttool = eye(4);
Tleg = Ry(q(1))*Tx(l1)*Ry(q(2))*Rz(q(3))*Tx(l2)*Rz(-q(3))*Ry(-(q(2)+q(1)));

T1 = Tbase ;
T2 = T1 * Ry(q(1))*Tx(l1) ;
T3 = T2 * Ry(q(2))*Rz(q(3))*Tx(l2);
T = Tbase * Tleg * Ttool;

end

