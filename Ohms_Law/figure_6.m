% Current as a function of resistance at constant voltage
% Strom in Abhängigkeit vom Widerstand bei konstanter Spannung

% Plot language selection: 'en' for English, 'de' for German
language = 'en';

% Resistor values
resistor_values = [100, 220, 330, 470, 680, 1000];

% Measured current values (in milliamps) at 4/8/12V with different resistor values (100 -> 1000 Ohms)
measured_mA_at_12V = [117.4, 54.4, 36, 25.3, 17.5, 12.1];
measured_mA_at_8V = [78.2, 36.2, 23.9, 16.8, 11.6, 8.1];
measured_mA_at_4V = [39.1, 18, 11.9, 8.4, 5.8, 3.9];

% Calculate theoretical currents in milliamps using Ohm's Law I = V/R
theoretical_mA_12V = (12 ./ resistor_values) * 1000;
theoretical_mA_8V = (8 ./ resistor_values) * 1000;
theoretical_mA_4V = (4 ./ resistor_values) * 1000;

% Set plot labels and title based on language selection
if strcmp(language, 'en')
    xlabel_str = 'Resistance (R) [Ohms]';
    ylabel_str = 'Current [mA]';
    title_str = 'Current as a function of Resistance at constant Voltage';
    legend_labels = {'Measured current at 12V', 'Measured current at 8V', 'Measured current at 4V', ...
                     'Theoretical current at 12V', 'Theoretical current at 8V', 'Theoretical current at 4V'};
else
    xlabel_str = 'Widerstand (R) [Ohm]';
    ylabel_str = 'Strom [mA]';
    title_str = 'Strom in Abhängigkeit vom Widerstand bei konstanter Spannung';
    legend_labels = {'Gemessener Strom bei 12V', 'Gemessener Strom bei 8V', 'Gemessener Strom bei 4V', ...
                     'Theoretischer Strom bei 12V', 'Theoretischer Strom bei 8V', 'Theoretischer Strom bei 4V'};
end

% Plot the measured and theoretical current values
figure;
hold on;
grid on;

% Plot measured values
plot(resistor_values, measured_mA_at_12V, 'o-', 'DisplayName', legend_labels{1});
plot(resistor_values, measured_mA_at_8V, '*-', 'DisplayName', legend_labels{2});
plot(resistor_values, measured_mA_at_4V, 'x-', 'DisplayName', legend_labels{3});

% Plot theoretical values
plot(resistor_values, theoretical_mA_12V, '--', 'DisplayName', legend_labels{4});
plot(resistor_values, theoretical_mA_8V, '--', 'DisplayName', legend_labels{5});
plot(resistor_values, theoretical_mA_4V, '--', 'DisplayName', legend_labels{6});

% Label the plot
xlabel(xlabel_str);
ylabel(ylabel_str);
title(title_str);
legend('show', 'Location', 'northeast');

hold off;

% Save the figure as a PNG image
f = gcf;
exportgraphics(f, 'figure_6.png', 'Resolution', 300);
