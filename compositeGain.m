function Gain = compositeGain(theta, phi, params)
% ===============================================================
% compositeGain.m
%
% ITU-R M.2101 Composite Antenna Gain
%
% Gain = Element Pattern + Array Factor
%
% INPUT
%   theta   Observation elevation angle (deg)
%   phi     Observation azimuth angle (deg)
%   params  Antenna parameter structure
%
% OUTPUT
%   Gain    Composite antenna gain (dBi)
%
% ===============================================================

%% -------------------------------------------------------------
% Compute element pattern
%% -------------------------------------------------------------

GE = elementPattern(theta, phi, params);

%% -------------------------------------------------------------
% Compute beamforming weights
%% -------------------------------------------------------------

W = beamWeights(params);

%% -------------------------------------------------------------
% Compute array factor
%% -------------------------------------------------------------

AF = arrayFactor(theta, phi, W, params);

%% -------------------------------------------------------------
% Convert AF to dB
%% -------------------------------------------------------------

AFdB = 20*log10(AF + eps);

%% Limit numerical floor

AFdB(AFdB < -100) = -100;

%% -------------------------------------------------------------
% Composite Gain
%% -------------------------------------------------------------
Gain = params.Gmax ...
      + (GE - params.elementGain) ...
      + AFdB;

end