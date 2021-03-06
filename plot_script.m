%% Defining the Transformations of the bases and Tools
L_b = 0.37;
L_p = 0.048;

Tbase1 = Rz(pi/6)*Tx(L_b);
Tbase2 = Rz(5*pi/6)*Tx(L_b);
Tbase3 = Rz(9*pi/6)*Tx(L_b);

Ttool1 = inv(Rz(pi/6)*Tx(L_p));
Ttool2 = inv(Rz(5*pi/6)*Tx(L_p));
Ttool3 = inv(Rz(9*pi/6)*Tx(L_p));


L  = [0.3, 0.8];
%% forward and inverse kinematics 2

p_global = [-.2, -.1, -.5];
q1 = Delta_IK(Tbase1, p_global, Ttool1, L);

q2 = Delta_IK(Tbase2, p_global, Ttool2, L);

q3 = Delta_IK(Tbase3, p_global, Ttool3, L);

[Tleg1,T11, T12, T13] = FK_test(Tbase1,q1,Ttool1, L);

[Tleg2,T21, T22, T23] = FK_test(Tbase2,q2,Ttool2, L);

[Tleg3,T31, T32, T33] = FK_test(Tbase3,q3,Ttool3, L);

%% plotting
Visualize_robot(Tleg1,T11, T12, T13, Tbase1, Ttool1, 'blue')
Visualize_robot(Tleg2,T21, T22, T23, Tbase2, Ttool2, 'black')
Visualize_robot(Tleg3,T31, T32, T33, Tbase3, Ttool3, 'green')
