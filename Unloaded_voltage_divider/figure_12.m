% Curve of unloaded voltage divider
% Kennlinie des unbelasteten Spannungsteilers

% Input voltage in volts
V_in = 10;
% Counter from 0 to 10 (corresponds to angles 0° to 300°)
counter = 0:10;

% Measured voltage U2
measured_U2 = [0, 0.4, 1.55, 2.535, 3.53, 4.48, 5.54, 6.5, 7.27, 8.67, 9.57];

% Theoretical values
% Voltage between pin E and S
theoretical_U1 = V_in .* (300 - counter * 30) / 300;
% Voltage between pin S and A
theoretical_U2 = V_in - theoretical_U1;

% Plot the measured and theoretical values for both voltage divisions
figure;
hold on;
grid on;

% Plot for U2
plot(counter, measured_U2, 'x-', 'DisplayName', 'U_2 gemessen');
plot(counter, theoretical_U2, '--', 'DisplayName', 'U_2 theoretisch');

% Label the plot
xlabel('Potentiometerstellung α');
ylabel('Spannung U_2 [V]');
title('Kennlinie unbelasteter Spannungsteiler');
legend('show');
hold off;

% Save the figure as a PNG image
f = gcf;
exportgraphics(f, 'figure_12.png', 'Resolution', 300);
