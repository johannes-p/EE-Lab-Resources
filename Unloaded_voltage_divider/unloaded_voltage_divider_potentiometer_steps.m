% Curve of unloaded voltage divider (U_1 and U_2)
% Kennlinie des unbelasteten Spannungsteilers (U_1 und U_2)

% Input voltage in volts
V_in = 10;
% Counter from 0 to 10 (corresponds to angles 0° to 300°)
counter = 0:10;

% Measured voltages pin 1/2 and pin 2/3
measured_V_1_2 = [9.93, 9.53, 8.37, 7.39, 6.39, 5.43, 4.37, 3.42, 2.65, 1.246, 0.356];
measured_V_2_3 = [0, 0.4, 1.55, 2.535, 3.53, 4.48, 5.54, 6.5, 7.27, 8.67, 9.57];

% Theoretical values
% Voltage between pin 1 and 2
theoretical_V_1_2 = V_in .* (300 - counter * 30) / 300;
% Voltage between pin 2 and 3
theoretical_V_2_3 = V_in - theoretical_V_1_2;

% Plot the measured and theoretical values for both voltage divisions
figure;
hold on;
grid on;

% Plot for V_1-2
plot(counter, measured_V_1_2, 'o-', 'DisplayName', 'Measured V_{1-2}');
plot(counter, theoretical_V_1_2, '--', 'DisplayName', 'Theoretical V_{1-2}');

% Plot for V_2-3
plot(counter, measured_V_2_3, 'x-', 'DisplayName', 'Measured V_{2-3}');
plot(counter, theoretical_V_2_3, ':', 'DisplayName', 'Theoretical V_{2-3}');

% Label the plot
xlabel('Potentiometer position');
ylabel('Voltage (U) [V]');
title('Voltage Divider Output Between Potentiometer Terminals');
legend('show');
hold off;