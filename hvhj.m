% Define the original signal and upsampling factor
x = [1 2 1 0 -1 -2 -1 0];   % Original signal
upsample_factor = 3;        % Upsampling factor (x3)

% Zero filling interpolation
x_zero_filled = zeros(1, length(x)*upsample_factor); % Pre-allocate zero-filled array
x_zero_filled(1:upsample_factor:end) = x;           % Insert original samples

% Low pass filter design (example using a moving average filter)
filter_length = 5;                          % Adjust filter length as needed
filter_coeffs = ones(1, filter_length) / filter_length;  % Simple moving average filter
y_interpolated = conv(x_zero_filled, filter_coeffs, 'same'); % Apply filtering

% Plotting for visualization
n = 1:length(x);                     % Sample indices for original signal
m = 1:length(y_interpolated);         % Sample indices for interpolated signal

figure;
subplot(3,1,1);
stem(n, x, 'filled', 'MarkerSize', 8);
title('Original Signal x[n]');
xlabel('Sample Index (n)');
ylabel('Amplitude');

subplot(3,1,2);
stem(m, x_zero_filled, 'filled', 'MarkerSize', 8);
title('Zero Filled Signal');
xlabel('Sample Index (m)');
ylabel('Amplitude');

subplot(3,1,3);
stem(m, y_interpolated, 'filled', 'MarkerSize', 8);
title('Interpolated Signal y[m] (After Low Pass Filtering)');
xlabel('Sample Index (m)');
ylabel('Amplitude');

% Adjust plot layout
sgtitle('Zero Filling Interpolation');
xlim([1 length(y_interpolated)]);
