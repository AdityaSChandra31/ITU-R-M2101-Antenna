function pattern3D(params)
% ==============================================================
% pattern3D.m
%
% ITU-R M.2101
% 3D Radiation Pattern
%
% =============================================================

%% Angular Grid

theta = -90:2:90;          % Elevation
phi   = -180:2:180;        % Azimuth

[PHI,THETA] = meshgrid(phi,theta);

%% Composite Gain

Gain = zeros(size(THETA));

fprintf('Computing 3D Pattern...\n');

for i = 1:size(THETA,1)

    for j = 1:size(THETA,2)

        Gain(i,j) = compositeGain( ...
                        THETA(i,j), ...
                        PHI(i,j), ...
                        params);

    end

end

fprintf('Done.\n');

%% Normalize

GainNorm = Gain - max(Gain(:));

%% Convert to Linear Radius

R = 10.^(GainNorm/20);

%% Cartesian Coordinates

X = R .* cosd(THETA) .* cosd(PHI);

Y = R .* cosd(THETA) .* sind(PHI);

Z = R .* sind(THETA);

%% ==========================================================
% 3D Radiation Pattern
%% ==========================================================

figure

surf(X,Y,Z,GainNorm,...
    'EdgeColor','none')

axis equal

grid on

xlabel('X')

ylabel('Y')

zlabel('Z')

title('ITU-R M.2101 3D Radiation Pattern')

colormap jet

colorbar

clim([-40 0])

lighting gouraud

camlight headlight

%% ==========================================================
% Gain Surface
%% ==========================================================

figure

surf(PHI,THETA,Gain)

shading interp

grid on

xlabel('\phi (deg)')

ylabel('\theta (deg)')

zlabel('Gain (dBi)')

title('Composite Antenna Gain')

colorbar

%% ==========================================================
% Contour Plot
%% ==========================================================

figure

contourf(PHI,THETA,GainNorm,40)

xlabel('\phi (deg)')

ylabel('\theta (deg)')

title('Normalized Gain (dB)')

colorbar

%% ==========================================================
% Peak Information
%% ==========================================================

[maxGain,index] = max(Gain(:));

[row,col] = ind2sub(size(Gain),index);

fprintf('\n');

fprintf('=========================================\n');

fprintf('Peak Gain      : %.2f dBi\n',maxGain);

fprintf('Elevation      : %.2f deg\n',THETA(row,col));

fprintf('Azimuth        : %.2f deg\n',PHI(row,col));

fprintf('=========================================\n');

end