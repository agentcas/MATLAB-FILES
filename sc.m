% Define the time vector for the continuous signal
t = 0:0.0001:0.02; % Sampling at 10,000 Hz

% Define the continuous signal
x_c = sin(2*pi*15*t); 

% Define sampling frequencies
fs1 = 150; 
fs2 = 25; 

% Calculate sampling intervals
Ts1 = 1/fs1; 
Ts2 = 1/fs2; 

% Generate time vectors for the sampled signals
n1 = 0:1/150:1;
n2 = 0:1/25:1;

% Sample the continuous signal
x_s1 = sin(2*pi*15*n1);
x_s2 = sin(2*pi*15*n2);

% Plotting
figure;

% Plot the continuous signal
subplot(3,1,1);
plot(t, x_c);

title('Continuous-Time Signal');
xlabel('Time (s)');
ylabel('x5(t)');
grid on;
text(0.016, -0.5, 'Continuous', 'FontSize', 12);

% Plot the signal sampled at 150 Hz
subplot(3,1,2);
stem(n1, x_s1, 'bo-', 'LineWidth', 1.5);
hold on;
plot(t, x_c, 'k--'); % Plot continuous for reference
hold off;
title('0.4 samples/period, fs = 150 Hz');
xlabel('Proper Sampling Rate');
ylabel('x_{150}[n]');
grid on;
text(0.01, 0.8, '0.4 samples/period', 'FontSize', 12);

% Plot the signal sampled at 25 Hz
subplot(3,1,3);
stem(n2, x_s2, 'bo-', 'LineWidth', 1.5);
hold on;
plot(t, x_c, 'k--'); % Plot continuous for reference
hold off;
title('2.4 samples/period, fs = 25 Hz');
text(0.01, 0.8, '2.4 samples/period', 'FontSize', 12);
xlabel('Under Sampled Rate');
ylabel('x_{25}[n]');
grid on;

% End line Code here