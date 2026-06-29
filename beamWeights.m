function W = beamWeights(params)
% ===============================================================
% beamWeights.m
%
% ITU-R M.2101 Beamforming Weights
%
% Generates the complex beamforming weights for an M×N
% Uniform Planar Array.
%
% INPUT
%   params.M
%   params.N
%   params.dv
%   params.dh
%   params.thetaScan
%   params.phiScan
%
% OUTPUT
%   W  -> M×N complex beamforming weight matrix
%
% ===============================================================

%% Array parameters

M = params.M;
N = params.N;

dv = params.dv;
dh = params.dh;

%% Steering angles (degrees)

theta0 = deg2rad(params.thetaScan);
phi0   = deg2rad(params.phiScan);

%% Direction cosines

u0 = sin(theta0)*cos(phi0);
v0 = sin(theta0)*sin(phi0);

%% Weight matrix

W = zeros(M,N);

%% Compute beamforming weights

for m = 0:M-1

    for n = 0:N-1

        phase = -2*pi*( ...
                    m*dv*u0 + ...
                    n*dh*v0 );

        W(m+1,n+1) = exp(1j*phase);

    end

end

%% Normalize

W = W./sqrt(M*N);

end