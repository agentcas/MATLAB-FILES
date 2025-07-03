% Define the original signal parameters
fs = 44100; % Sampling frequency (Hz)
duration = 0.8; % Signal duration (seconds)
t = linspace(0, duration, fs*duration); % Time vector

% Generate the original signal
x = sin(2*pi*440*t) + 0.5*sin(2*pi*880*t); % Sinusoidal signal at 440 Hz and 880 Hz

% Plot the original signal
figure;
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Apply low-pass filtering
cutoff_frequency = 600; % Cutoff frequency for low-pass filter (Hz)
[b,a] = butter(4, cutoff_frequency/(fs/2), 'low'); % Design Butterworth filter
x_filtered = filter(b, a, x);

% Plot the filtered signal
figure;
plot(t, x_filtered);
title('Filtered Signal');
xlabel('Time (s)');
ylabel('Amplitude');

% Interpolate the signal
upsampling_factor = 4;
t_upsampled = linspace(0, duration, length(x)*upsampling_factor);
x_upsampled = interp1(t, x_filtered, t_upsampled, 'spline');

% Plot the interpolated signal
figure;
plot(t_upsampled, x_upsampled);
title('Interpolated Signal');
xlabel('Time (s)');
ylabel('Amplitude');