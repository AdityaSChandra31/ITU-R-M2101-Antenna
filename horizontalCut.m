function Gain = horizontalCut(phi, params)
% ===============================================================
% horizontalCut.m
%
% ITU-R M.2101 Horizontal Antenna Pattern
%
% Computes the horizontal (azimuth) cut of the composite
% antenna gain while keeping elevation fixed.
%
% INPUT
%   phi     Azimuth angle vector (deg)
%   params  Antenna parameter structure
%
% OUTPUT
%   Gain    Composite antenna gain (dBi)
%
% ===============================================================

%% Fixed elevation

theta = params.thetaScan * ones(size(phi));

%% Compute composite gain

Gain = compositeGain(theta, phi, params);

%% Plot

figure;

plot(phi, Gain,'r','LineWidth',2);

grid on;
box on;

xlabel('Azimuth Angle (degrees)','FontSize',12);
ylabel('Gain (dBi)','FontSize',12);

title(sprintf('ITU-R M.2101 Horizontal Pattern (Steering = %.1f°)',...
    params.phiScan),'FontSize',13);

xlim([min(phi) max(phi)]);
ylim([-50 params.Gmax+1]);

set(gca,...
    'FontSize',11,...
    'LineWidth',1.2);

%% Peak Gain

[maxGain,idx] = max(Gain);

hold on;

plot(phi(idx),maxGain,...
    'bo',...
    'MarkerSize',8,...
    'LineWidth',2);

text(phi(idx),...
     maxGain+0.8,...
     sprintf('Peak = %.2f dBi',maxGain),...
     'HorizontalAlignment','center');

%% 3 dB Beamwidth

threshold = maxGain - 3;

index = find(Gain >= threshold);

if ~isempty(index)

    BW = phi(index(end)) - phi(index(1));

    yline(threshold,'k--','-3 dB');

    fprintf('\n');
    fprintf('--------------------------------------\n');
    fprintf('Horizontal Pattern\n');
    fprintf('Peak Gain        : %.2f dBi\n',maxGain);
    fprintf('3 dB Beamwidth   : %.2f deg\n',BW);
    fprintf('Steering Azimuth : %.2f deg\n',params.phiScan);
    fprintf('--------------------------------------\n');

end

%% Polar Plot

figure;

polarplot(deg2rad(phi), Gain-maxGain,'LineWidth',2);

title(sprintf('Horizontal Polar Pattern (%.1f°)',...
    params.phiScan));

rlim([-40 0]);

thetaticks(-180:30:180);

grid on;

end