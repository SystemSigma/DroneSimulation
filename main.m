
% external library for contacts (REQUIRE R2018b or higher!!)
addpath('lib\SM_Contact_Forces_Lib_R19a_v4p1')

%% Drone Mech Parameters

M_body = 4;
M_prop = 0.1;

M_rotor = 0.01;
R_rotor = 0.01;
L_rotor = 0.05;
R_prop = 0.1;

L = 0.5;
B = L*sqrt(2)/2;
I = ones(3);

RPM_max = 1e3;
RPM_ACC_max = 2e3;

rads2rpm = 30/pi;
rpm2rads = pi/30;

propeller_data = load('propeller_data.mat');
propeller_data = propeller_data.val;

f_thrust    = fit(propeller_data.rpm*rpm2rads, propeller_data.thrust*9.81, 'poly2');
f_drag      = fit(propeller_data.rpm*rpm2rads, propeller_data.torque, 'poly2');

k = f_thrust.p1;
b = f_drag.p1;


%% Drone Simulation
open('model.slx');
sim('model.slx');
