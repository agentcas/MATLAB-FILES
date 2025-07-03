% Start line code here

% Define the time vector for the continuous signal
t = 0:0.01:1; % Sampling at 10,000 Hz

% Define the continuous signal
x_c = sin(2*pi*18*t); 

% Define sampling frequencies
fs1 = 180; % 240 Hz
fs2 = 30; % 1000 Hz

% Calculate sampling intervals
Ts1 = 1/fs1; 
Ts2 = 1/fs2; 

% Generate time vectors for the sampled signals
n1 = 0:1/180:1;
n2 = 0:1/30:1;

% Sample the continuous signal
x_s1 = sin(2*pi*18*n1);
x_s2 = sin(2*pi*18*n2);

% Plotting
figure;

% Plot the continuous signal
subplot(3,1,1);
plot(t, x_c);

title('Continuous');
xlabel('Time (s)');
ylabel('x(t)');
grid on;
text(0.016, -0.5, 'Continuous', 'FontSize', 12);

% Plot the signal sampled at 500 Hz
subplot(3,1,2);
stem(n1, x_s1, 'bo-', 'LineWidth', 1.5);
hold on;
hold off;
title('4 samples/period, fs = 500 Hz');
xlabel('Time (s)');
ylabel('x_{500}[n]');
grid on;
text(0.01, 0.8, '4 samples/period', 'FontSize', 12);

% Plot the signal sampled at 1500 Hz
subplot(3,1,3);
stem(n2, x_s2, 'bo-', 'LineWidth', 1.5);
hold on;
hold off;
title('16.67 samples/period, fs = 1500 Hz');
text(0.01, 0.8, '16.67 samples/period', 'FontSize', 12);
xlabel('Sample Index (n)');
ylabel('x_{1500}[n]');
grid on;

