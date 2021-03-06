function [pos] = Delta_FK_num(q_a, L, z_old)
%DELTA_FK_NUM Summary of this function goes here
%   Detailed explanation goes here
syms x y z L_b L_p phi q real

q11 = q_a(1);
q12 = q_a(2);
q13 = q_a(3);

L_b_num = 0.37;
L_p_num = 0.048;

Tbase1 = Rz(pi/6)*Tx(L_b_num);
phi1 = pi/6;
Tbase2 = Rz(5*pi/6)*Tx(L_b_num);
phi2 = 5*pi/6;
Tbase3 = Rz(9*pi/6)*Tx(L_b_num);
phi3 = 9*pi/6;

Ttool1 = Rz(-pi/6)*Tx(-L_p_num);

Ttool2 = Rz(-5*pi/6)*Tx(-L_p_num);

Ttool3 = Rz(-9*pi/6)*Tx(-L_p_num);


[J1_sym, F1_sym] = Delta_FK_sym(q11, L);
J1_sym(x ,y ,z, L_b, L_p, phi, q) = J1_sym;
F1_sym(x,y,z, L_b, L_p, phi, q) = F1_sym;

[J2_sym, F2_sym] = Delta_FK_sym(q12, L);
J2_sym(x,y,z, L_b, L_p, phi, q) = J2_sym;
F2_sym(x,y,z, L_b, L_p, phi, q) = F2_sym;

[J3_sym, F3_sym] = Delta_FK_sym(q13, L);
J3_sym(x,y,z, L_b, L_p, phi, q) = J3_sym;
F3_sym(x,y,z, L_b, L_p, phi, q) = F3_sym;

xd = z_old(1);
yd = z_old(2);
zd = z_old(3);

counter = 0;
z_new = z_old + 5;

while norm(z_new - z_old) > 1e-012
%    disp(norm(z_new - z_old))
   if counter == 0
    z_old = z_old;
   else
    z_old = z_new;
   end
   counter = counter+1;
%    disp(counter)

   F1 = F1_sym(xd, yd, zd, L_b_num, L_p_num, phi1, q11); 
   J1 = J1_sym(xd, yd, zd,  L_b_num, L_p_num, phi1, q11);
   
   F2 = F2_sym(xd, yd, zd, L_b_num, L_p_num, phi2, q12); 
   J2 = J2_sym(xd, yd, zd,  L_b_num, L_p_num, phi2, q12);
   
   F3 = F3_sym(xd, yd, zd,  L_b_num, L_p_num, phi3, q13); 
   J3 = J3_sym(xd, yd, zd,  L_b_num, L_p_num, phi3, q13);
   
   JF = double([J1; J2; J3]);
   
   F = double([F1; F2; F3]);
   
   z_new = z_old - JF\F;
   
   xd = double(z_new(1));
   yd = double(z_new(2));
   zd = double(z_new(3));
end

pos = [xd, yd, zd];
end

