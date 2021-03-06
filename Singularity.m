function [] = Singularity()
L  = [0.3, 0.8];

phi= [pi/6, 5*pi/6, 9*pi/6];

L_b = 0.37;
L_p = 0.048;

Tbase1 = Rz(pi/6)*Tx(L_b);
Tbase2 = Rz(5*pi/6)*Tx(L_b);
Tbase3 = Rz(9*pi/6)*Tx(L_b);

Ttool1 = Rz(-pi/6)*Tx(-L_p);
Ttool2 = Rz(-5*pi/6)*Tx(-L_p);
Ttool3 = Rz(-9*pi/6)*Tx(-L_p);


for th1 = -pi/8 : 0.0015 : pi/8
    for th2 = -pi/8 : 0.0015 :  pi/8
        for th3 = -pi/8 : 0.0015 :  pi/8
            q_a = [th1, th2, th3]
            z_old = [-0.2; -0.3; -0.3];
            
            pos = Delta_FK_num(q_a, L, z_old)

            q1 = Delta_IK(Tbase1, pos, Ttool1, L);
            q2 = Delta_IK(Tbase2, pos, Ttool2, L);
            q3 = Delta_IK(Tbase3, pos, Ttool3, L);
            q = [q3; q2; q1];
            J = Delta_Jac(q, phi, L);

            m = sqrt(det(J* J'));
            m = double(m)

                scatter3(pos(1), pos(2), pos(3), 30, m);
                hold on

         end
    end
end
end
