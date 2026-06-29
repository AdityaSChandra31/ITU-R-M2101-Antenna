function Gain = verticalCut(theta, params)
% ===============================================================
% verticalCut.m
%
% ITU-R M.2101 Vertical Antenna Pattern
%
% Computes the vertical (elevation) cut of the composite
% antenna gain while keeping azimuth fixed.
%
% INPUT
%   theta   Elevation angle vector (deg)
%   params  Antenna parameter structure
%
% OUTPUT
%   Gain    Composite gain (dBi)
%
% ===============================================================

%% Fixed azimuth

phi = params.phiScan * ones(size(theta));

%% Compute composite gain

Gain = compositeGain(theta, phi, params);

%% Plot

figure;

plot(theta, Gain,'b','LineWidth',2);

grid on;
box on;

xlabel('Elevation Angle (degrees)','FontSize',12);
ylabel('Gain (dBi)','FontSize',12);

title(sprintf('ITU-R M.2101 Vertical Pattern (Steering = %.1f°)',...
    params.thetaScan),'FontSize',13);

xlim([min(theta) max(theta)]);
ylim([-50 params.Gmax+1]);

set(gca,...
    'FontSize',11,...
    'LineWidth',1.2);

%% Mark Peak

[maxGain,idx] = max(Gain);

hold on;

plot(theta(idx),maxGain,...
    'ro',...
    'MarkerSize',8,...
    'LineWidth',2);

text(theta(idx),...
     maxGain+0.8,...
     sprintf('Peak = %.2f dBi',maxGain),...
     'HorizontalAlignment','center');

%% -3 dB Beamwidth

threshold = maxGain - 3;

index = find(Gain >= threshold);

if ~isempty(index)

    BW = theta(index(end)) - theta(index(1));

    yline(threshold,'k--','-3 dB');

    fprintf('\n');
    fprintf('--------------------------------------\n');
    fprintf('Vertical Pattern\n');
    fprintf('Peak Gain        : %.2f dBi\n',maxGain);
    fprintf('3 dB Beamwidth   : %.2f deg\n',BW);
    fprintf('Steering Angle   : %.2f deg\n',params.thetaScan);
    fprintf('--------------------------------------\n');

end

%% ===============================================================
%% Polar Plot
%% ===============================================================

% Convert angle to radians
thetaRad = deg2rad(theta);

figure;

polarplot(thetaRad, Gain, ...
    'b', ...
    'LineWidth',2);

title(sprintf('ITU-R M.2101 Vertical Polar Pattern (Steering = %.1f°)', ...
    params.thetaScan));

rlim([-50 params.Gmax+1]);
rticks(-50:10:params.Gmax);

ax = gca;
ax.ThetaZeroLocation = 'top';     % 0° at top
ax.ThetaDir = 'clockwise';        % clockwise angles
ax.FontSize = 11;

hold on;

% Mark peak
polarplot(thetaRad(idx), maxGain, ...
    'ro', ...
    'MarkerFaceColor','r', ...
    'MarkerSize',8);

% Show -3 dB circle

thetas = linspace(0,2*pi,361);

hold on;
polarplot(thetas, threshold*ones(size(thetas)), ...
    'k--', ...
    'LineWidth',1.2);

legend('Gain Pattern','Peak','-3 dB Level', ...
    'Location','southoutside');

%% Normalized Polar Plot

GainNorm = Gain - maxGain;

figure;

polarplot(thetaRad, GainNorm, ...
    'b', ...
    'LineWidth',2);

title(sprintf('Normalized Vertical Polar Pattern (Steering = %.1f°)', ...
    params.thetaScan));

rlim([-40 0]);
rticks(-40:5:0);

ax = gca;
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise';
ax.FontSize = 11;

hold on;

polarplot(thetaRad(idx),0,...
    'ro',...
    'MarkerFaceColor','r',...
    'MarkerSize',8);

thetas = linspace(0,2*pi,361);
polarplot(thetas,-3*ones(size(thetas)),...
    'k--','LineWidth',1.2);

legend('Normalized Gain','Peak','-3 dB','Location','southoutside');

end