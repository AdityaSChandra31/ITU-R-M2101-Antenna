function AF = arrayFactor(theta, phi, W, params)
% ==============================================================
% arrayFactor.m
%
% ITU-R M.2101 Array Factor
%
% Computes the normalized array factor of an M×N
% Uniform Planar Array.
%
% INPUTS
%   theta  : Elevation angle(s) [deg]
%   phi    : Azimuth angle(s) [deg]
%   W      : Beamforming weights (M×N)
%   params : Antenna parameters
%
% OUTPUT
%   AF     : Array Factor (linear)
%
% ===============================================================

%% Parameters

M = params.M;
N = params.N;

dv = params.dv;
dh = params.dh;

%% Convert to radians

theta = deg2rad(theta);
phi = deg2rad(phi);

%% Direction cosines

u = sin(theta).*cos(phi);
v = sin(theta).*sin(phi);

%% Allocate output

AF = zeros(size(theta));

%% Compute Array Factor

for k = 1:numel(theta)

    field = 0;

    for m = 0:M-1

        for n = 0:N-1

            %% Progressive phase

            psi = 2*pi*( ...
                    m*dv*u(k) + ...
                    n*dh*v(k));

            %% Sum field

            field = field + ...
                W(m+1,n+1) .* exp(1j*psi);

        end

    end

    AF(k) = abs(field);

end

%% Normalize

AF = AF ./ max(AF);

end