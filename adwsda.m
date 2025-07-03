% Define the time vector
t = linspace(0, 0.02, 1000);

% Define the continuous signal
x_t = sin(2*pi*50*t);

% Define the sampling frequencies
fs_1 = 500;
fs_2 = 1500;

% Define the sampling intervals
T_1 = 1/fs_1;
T_2 = 1/fs_2;

% Sample the continuous signal
x_500 = x_t(1:fs_1:end);
x_1500 = x_t(1:fs_2:end);

% Calculate the FFTs
X_500 = fft(x_500);
X_1500 = fft(x_1500);

% Calculate the frequency vectors
f_500 = (0:length(X_500)-1)*fs_1/length(X_500);
f_1500 = (0:length(X_1500)-1)*fs_2/length(X_1500);

% Plot the magnitudes of the FFTs
figure;
subplot(2,1,1);
plot(f_500, abs(X_500));
title('Magnitude of FFT for fs = 500 Hz');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
plot(f_1500, abs(X_1500));
title('Magnitude of FFT for fs = 1500 Hz');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Display the plots
sgtitle('Comparison of Frequency Content');