% Current as a function of voltage at two resistances (100 Ohms and 300 Ohms)
% Strom als Funktion der Spannung für zwei Widerstände (100 Ohm und 300 Ohm) 

% Plot language selection: 'en' for English, 'de' for German
language = 'en';

% Given voltage array (in volts)
voltage = linspace(0, 12, 7);

% Measured current values (in milliamps) at 100 ohms and 300 ohms
measured_mA_at_100ohms = [0.3, 19.3, 39.8, 59.6, 79.1, 98.7, 118.4];
measured_mA_at_300ohms = [0.08, 5.9, 12.25, 18.3, 24.2, 30.2, 36.3];

% Define resistor values in ohms
R_100ohms = 100;
R_300ohms = 300;

% Calculate theoretical currents in milliamps using Ohm's Law I = V/R
theoretical_mA_100ohms = (voltage / R_100ohms) * 1000; % Current for 100 ohms
theoretical_mA_300ohms = (voltage / R_300ohms) * 1000; % Current for 300 ohms


% Set plot labels and title based on language selection
if strcmp(language, 'en')
    xlabel_str = 'Voltage (U) [V]';
    ylabel_str = 'Current [mA]';
    title_str = 'Current as a function of voltage at 100 and 300 ohms';
    legend_labels = {'Measured current at 100 ohms', 'Measured current at 300 ohms', ...
                     'Theoretical current at 100 ohms', 'Theoretical current at 300 ohms'};
else
    xlabel_str = 'Spannung (U) [V]';
    ylabel_str = 'Strom [mA]';
    title_str = 'Strom in Abhängigkeit der Spannung bei Widerstand 100 und 300 Ohm';
    legend_labels = {'Gemessener Strom bei 100 Ohm', 'Gemessener Strom bei 300 Ohm', ...
                     'Theoretischer Strom bei 100 Ohm', 'Theoretischer Strom bei 300 Ohm'};
end


% Plot the measured and theoretical values with striped lines for theoretical values
figure;
hold on;
grid on;

% Plot measured values
plot(voltage, measured_mA_at_100ohms, 'o-', 'DisplayName', legend_labels{1});
plot(voltage, measured_mA_at_300ohms, '*-', 'DisplayName', legend_labels{2});

% Plot theoretical values with striped lines
plot(voltage, theoretical_mA_100ohms, '--', 'DisplayName', legend_labels{3});
plot(voltage, theoretical_mA_300ohms, ':', 'DisplayName', legend_labels{4});

% Label the plot
xlabel(xlabel_str);
ylabel(ylabel_str);
title(title_str);
legend('show', location='northwest');
hold off;

f = gcf;
exportgraphics(f, 'figure_5.png',"Resolution",300);