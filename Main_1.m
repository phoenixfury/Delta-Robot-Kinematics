L_b = 0.37;
L_p = 0.048;

Tbase1 = Rz(pi/6)*Tx(L_b);
Tbase2 = Rz(5*pi/6)*Tx(L_b);
Tbase3 = Rz(9*pi/6)*Tx(L_b);

Ttool1 = Rz(-pi/6)*Tx(-L_p);
Ttool2 = Rz(-5*pi/6)*Tx(-L_p);
Ttool3 = Rz(-9*pi/6)*Tx(-L_p);

L = [0.3, 0.8];
pos = [-0.3795    0.0299   -0.7370]

% syms q1 q2 q3 l1 l2
% Tleg = Ry(q1)*Tx(l1)*Ry(q2)*Rz(q3)*Tx(l2)*Rz(-q3)*Ry(-(q2+q1));
% T = simplify(Tbase1 * Tleg *Ttool1)
% 
% x = T(1,4)
% y = T(2,4)
% z = T(3,4)

q_leg1 = Delta_IK(Tbase1, pos, Ttool1, L );
T1 = FK_test(Tbase1,q_leg1,Ttool1, L)
q_leg2 = Delta_IK(Tbase2, pos, Ttool2, L );
T2 = FK_test(Tbase2,q_leg2,Ttool2, L)
q_leg3 = Delta_IK(Tbase3, pos, Ttool3,L );
T3 = FK_test(Tbase3,q_leg3,Ttool3, L)

q = [q_leg1(1), q_leg2(1), q_leg3(1)];

pos = Delta_FK_num([q], L, [-0.2; -0.4; -0.3])

Singularity