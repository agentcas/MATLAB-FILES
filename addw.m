% Define the original signal parameters
fs = 44100; % Sampling frequency (Hz)
duration = 0.8; % Signal duration (seconds)
t = linspace(0, duration, fs*duration); % Time vector

% Generate the original signal
x = sin(2*pi*440*t); % Sinusoidal signal at 440 Hz

% Upsample the signal with zero filling
upsampling_factor = 8;
x_upsampled = zeros(1, length(x)*upsampling_factor);
x_upsampled(1:upsampling_factor:end) = x;

% Apply low-pass filtering
cutoff_frequency = 1000; % Cutoff frequency for low-pass filter (Hz)
[b,a] = butter(4, cutoff_frequency/(fs*upsampling_factor/2), 'low'); % Design Butterworth filter
x_filtered = filter(b, a, x_upsampled);

% Plot the results
figure;
subplot(4,1,1);
plot(t, x);
title('Original Signal (44.1 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
t_upsampled = linspace(0, duration, length(x_upsampled));
plot(t_upsampled, x_upsampled);
title('Upsampled Signal with Zero Filling (352800 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t_upsampled, x_filtered);
title('Interpolated Signal After Low-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
freqz(b, a, 1024, fs*upsampling_factor);
title('Low-pass Filter Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude');