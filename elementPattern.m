function GE = elementPattern(theta, phi, params)
% ==============================================================
% elementPattern.m
%
% ITU-R M.2101 Element Radiation Pattern
%
% Inputs:
%   theta  -> Elevation angle (deg)
%   phi    -> Azimuth angle (deg)
%   params -> Structure containing antenna parameters
%
% Output:
%   GE     -> Element Gain (dBi)
%
% ==============================================================

%% Parameters

theta3dB = params.theta3dB;
phi3dB   = params.phi3dB;

SLAv = params.SLAv;
Am   = params.Am;

GEmax = params.elementGain;

%% ------------------------------------------------------------
% Vertical Element Pattern
%
% AEV(theta) = -min(12*(theta/theta3dB)^2 , SLAv)
%% ------------------------------------------------------------

AEV = -min(12 .* (theta./theta3dB).^2, SLAv);

%% ------------------------------------------------------------
% Horizontal Element Pattern
%
% AEH(phi) = -min(12*(phi/phi3dB)^2 , Am)
%% ------------------------------------------------------------

AEH = -min(12 .* (phi./phi3dB).^2, Am);

%% -----------------------------------------------------------
AE = min( ...
    min(12*(theta./theta3dB).^2, SLAv) + ...
    min(12*(phi./phi3dB).^2, Am), ...
    Am);

GE = GEmax - AE;

end