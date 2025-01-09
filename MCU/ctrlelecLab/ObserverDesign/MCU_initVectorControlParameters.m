%% MCU init file
%% Initilization
% Basic functions
clc
clear all

%% Experiementation initization
FPWM = 20e3;                % Hz    // PWM fequency
Tm = 0.5e-6;                %s      // Dead Time
Ts = 1e-4;                  %s      // Sampling period

%% Motor Parameters
motor.model    = 'Teknic-2310P';                    %           // Manufacturer Model Number
motor.sn       = '003';                             %           // Manufacturer Model Number
motor.p        = 4;                                 %           // Pole Pairs for the motor
motor.R        = 0.656;                             % Ohm       // Stator Resistor
motor.L        = 0.35e-3;                           % H         // Inductance value
motor.Phif     = 6.6e-3;                            % Wb        // PM flux 
motor.J        = 1e-05;                             % Kg-m2     // Inertia in SI units
motor.F        = 1.e-05;                            % Kg-m2/s   // Friction Co-efficient
motor.C0       = 0.01;                              % Kg-m2     // Dry friction
motor.omegaMax    = 350;                            % rad/s     // Max speed
motor.vDC = 24;                                     % V         // DC voltage
motor.iMax = 4.4;                                % A       	// Rated current (phase-peak)

%% Math tools
math.J = [0 -1;1 0];                                % rotation matrix with angle pi/2

%% Controller Parameters
control.trDElec = 3*motor.L/motor.R;
control.zetaDElec = 0.7;
control.trwnDElec = 3;
control.kElec = polePlacement2ndOrder(control.zetaDElec, control.trwnDElec/control.trDElec, motor.L/motor.R, 1/motor.R);

control.trDMeca = 1;
control.zetaDMeca = 1;
control.trwnDMeca = 5;
control.kMeca = polePlacement2ndOrder(control.zetaDMeca, control.trwnDMeca/control.trDMeca, motor.J/motor.F, 3/2*motor.p*motor.Phif/motor.F);


%% tuning observateur de charge luenberger système étendu
Atau=[-motor.F/motor.J -1/motor.J ; 0 0];
Ctau=[1 0];
Ltau=place(Atau',Ctau',[-200 -300]);
Ltau=Ltau';

%%
function K = polePlacement2ndOrder(zeta,wn, tau, k)
    % polePlacement2ndOrder function
    %
    % function K = polePlacement2ndOrder(zeta,wn, tau, k)
    %
    % Desired Carateristc Equation
    %  1         2zeta
    % ---- p^2+ ------- p + 1
    % wn^2        wn
    %
    % overshoot 5%, Trbf x wnbf = 3
    %
    % zeta  : Damping factor
    % wn    : natural frequency
    % tau   : first order time constant
    % k     : static gain

    Desiredpoles = roots([1/wn^2 2*zeta/wn 1]);

    A = [
            -1/tau 0;
            -1 0
        ];
    B = [
            k/tau
            0    
        ];

    K = acker(A,B,Desiredpoles);
end
