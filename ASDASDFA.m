% Define the original signal parameters
fs_original = 45200;  % Original sampling frequency (Hz)
t_original = 0:1/fs_original:1;  % Time vector (s)
f_original = 1000;  % Original signal frequency (Hz)
x_original = sin(2*pi*f_original*t_original);  % Original signal

% Upsample the signal with zero filling
fs_upsampled = 7156000;  % Upsampled sampling frequency (Hz)
t_upsampled = 0:1/fs_upsampled:1;  % Time vector (s)
x_upsampled = zeros(size(t_upsampled));  % Initialize upsampled signal
x_upsampled(1:fs_upsampled/fs_original:end) = x_original;  % Zero filling

% Apply a low-pass filter
f_pass = 20000;  % Passband frequency (Hz)
[b,a] = butter(4, f_pass/(fs_upsampled/2), 'low');  % Low-pass filter design
x_filtered = filter(b, a, x_upsampled);  % Filter the upsampled signal

% Interpolate the filtered signal
x_interpolated = interp1(t_upsampled, x_filtered, 10*t_upsampled);  % Interpolate by a factor of 10

% Plot the original and interpolated signals
figure;
subplot(2,1,1);
plot(t_original,x_original);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');

subplot(2,1,2);
plot(10*t_upsampled,x_interpolated);
xlabel('Time (s)');
ylabel('Amplitude');
title('Interpolated Signal');