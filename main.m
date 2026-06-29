%% ============================================================
% main.m
%
% ITU-R M.2101 Active Antenna System (AAS)
% Driver Script
%
% Array Configuration:
% 16 x 16 Uniform Planar Array
%
% Frequency : 28 GHz
% Element Gain : 5 dBi
% Peak Gain : 29 dBi
%
% ============================================================

clear;
clc;
close all;

%% ============================================================
% ANTENNA PARAMETERS
% ============================================================

params.M = 4;                  % Vertical elements
params.N = 4;                  % Horizontal elements

params.dv = 0.5;                % Vertical spacing (lambda)
params.dh = 0.5;                % Horizontal spacing (lambda)

params.elementGain = 5;

params.theta3dB = 65;
params.phi3dB   = 65;

params.SLAv = 30;
params.Am   = 30;             

%% Automatically Compute Peak Antenna Gain
params.arrayGain = 10*log10(params.M*params.N);

params.Gmax = params.elementGain + params.arrayGain;
%% ============================================================
% BEAM STEERING
% ============================================================

params.thetaScan = 0;           % Elevation steering (deg)
params.phiScan   = 0;           % Azimuth steering (deg)

%% ============================================================
% ANGLE GRID
% ============================================================

theta = -90:0.2:90;
phi   = -180:0.2:180;

%% ============================================================
% VERTICAL CUT
% ============================================================

disp('Computing Vertical Pattern...')

verticalCut(theta,params);

%% ============================================================
% HORIZONTAL CUT
% ============================================================

disp('Computing Horizontal Pattern...')

horizontalCut(phi,params);

%% ============================================================
% 3D PATTERN
% ============================================================

disp('Computing 3D Pattern...')

pattern3D(params);

disp('Finished.')
