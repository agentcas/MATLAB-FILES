% Original signal parameters
fs = 100;  % Sampling frequency
t = 0:1/fs:1;  % Time vector
f = 10;  % Frequency of the signal
x = sin(2*pi*f*t);  % Original signal

% Interpolation factor
L = 3;

% Zero-filling interpolation
x_up = zeros(1, L*length(x));  % Initialize the upsampled signal
x_up(1:L:end) = x;  % Insert zeros between the original samples

% Low-pass filter design
cutoff_frequency = f / (L/2);  % Cutoff frequency for the low-pass filter
[b, a] = butter(6, cutoff_frequency/(fs*L/2), 'low');  % Design a 6th-order Butterworth low-pass filter

% Apply the low-pass filter
x_filtered = filter(b, a, x_up);

% Plot the results
figure;
subplot(3, 1, 1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(x_up);
title('Upsampled Signal (Zero-Filling)');
xlabel('Sample Index');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(x_filtered);
title('Filtered Upsampled Signal');
xlabel('Sample Index');
ylabel('Amplitude');
% Original signal parameters
fs = 100;  % Sampling frequency
t = 0:1/fs:1;  % Time vector
f = 10;  % Frequency of the signal
x = sin(2*pi*f*t);  % Original signal

% Interpolation factor
L = 3;

% Zero-filling interpolation
x_up = zeros(1, L*length(x));  % Initialize the upsampled signal
x_up(1:L:end) = x;  % Insert zeros between the original samples

% Low-pass filter design
cutoff_frequency = f / (L/2);  % Cutoff frequency for the low-pass filter
[b, a] = butter(6, cutoff_frequency/(fs*L/2), 'low');  % Design a 6th-order Butterworth low-pass filter

% Apply the low-pass filter
x_filtered = filter(b, a, x_up);

% Plot the results
figure;
subplot(3, 1, 1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(x_up);
title('Upsampled Signal (Zero-Filling)');
xlabel('Sample Index');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(x_filtered);
title('Filtered Upsampled Signal');
xlabel('Sample Index');
ylabel('Amplitude');
