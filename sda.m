% Define the original signal
x = [0, 1, 2, 1, 0];
n = 0:length(x)-1;

% Define the interpolation factor
interpolation_factor = 3;

% Create the zero-filled signal
x_zeros = zeros(1, length(x)*interpolation_factor);
x_zeros(1:interpolation_factor:end) = x;

% Create the interpolated signal
n_interp = 0:1/interpolation_factor:length(x)-1/interpolation_factor;
x_interp = interp1(n, x, n_interp, 'linear');

% Plot the original signal, zero-filled signal, and interpolated signal
figure;
subplot(3, 1, 1);
stem(n, x);
xlabel('Time (samples)');
ylabel('Signal');
title('Original Signal');

subplot(3, 1, 2);
stem(0:length(x_zeros)-1, x_zeros);
xlabel('Time (samples)');
ylabel('Signal');
title('Zero-Filled Signal');

subplot(3, 1, 3);
stem(n_interp, x_interp);
xlabel('Time (samples)');
ylabel('Signal');
title('Interpolated Signal');

% Layout so plots do not overlap
set(gcf, 'Position', get(0, 'ScreenSize'));