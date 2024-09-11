clear all;
clc;
%%
% Grid parameters
V_grms = 80;
f_g = 60;

% DC-link
V_dc = 250;

%%
% Grid side converter
S_n = 1200;
P_n = S_n/sqrt(2);
Q_n = S_n/sqrt(2);
f_sw = 10e3;
Ts = 1/f_sw;
Td = Ts;

% LCL filter design
L_f1 = 1.5e-3;
R_f1 = 0.1;
L_f2 = L_f1;
R_f2 = 0.1;
C_f = 10e-6;
Rcf = 0.1;

% Performance
V_nom = V_grms;
V_min_pu = 0.95;
w_nom = 2*pi*60;
D_w = 2*pi*0.5;
t_rise = 120e-3;
tau = 40e-3;

Xnom = 1;
Kappa_v = V_nom;
Kappa_i = 3*V_nom/S_n;

xi = 15;
C = sqrt(2)/xi/4/V_min_pu^2/(1-V_min_pu^2);
L = 1/C/(w_nom^2);
PHI = pi/2;

% Initial state:
vCinit_1 = 0.6;
iLinit_1 = 0.8;

Pref = 000;
Qref = 000;
%sim('dispatchable_VOC.slx');