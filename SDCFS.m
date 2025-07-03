% Define original and target sample rates
fs_min = 15; % Hz
fs_spectarget = 30; % Hz
% Define signal parameters
frequency = 3; % Hz
duration = 5; % seconds
% Create the original sine wave signal
t = 0:1/fs_main:duration; % Time vector
original_signal = sin(2*pi*frequency*t);
% Zero filling (upsample by 4)
L = 4; % Upsampling factor
zero_filled_signal = zeros(1, length(original_signal) * L); 
zero_filled_signal(1:L:end) = original_signal; % Insert the original signal every 4th sample
% Low-pass filtering (after zero filling)
filter_order = 8; % Reduced filter order for a smoother response
cutoff_freq = fs_original / 2; % Nyquist frequency of the original signal
% Design a low-pass filter using the butterworth filter
[b, a] = butter(filter_order, cutoff_freq / (fs_target / 2)); % fs_target / 2 is the Nyquist freq after upsampling
% Apply low-pass filtering (use filtfilt for zero-phase filtering)
interpolated_signal = filtfilt(b, a, zero_filled_signal); % Zero-phase filtering to avoid delay
% Time vector for upsampled signal (adjust the length to match interpolated_signal)
t_upsampled = linspace(0, duration, length(interpolated_signal)); % Adjusted time vector
% Plot the results
figure;
subplot(3,1,1);
plot(t, original_signal, '-o');
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,2);
plot(t_upsampled, interpolated_signal, 'o--'); % Adjusted time vector for the filtered signal
title('Interpolated Signal (Zero-Filled and Filtered)');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(3,1,3);
stem(linspace(0, duration, length(zero_filled_signal)), zero_filled_signal, 'r--'); % Adjusted stem plot
title('Zero-Filled Signal (Before Filtering)');
xlabel('Time (s)');
ylabel('Amplitude');
% Adjust the figure layout
sgtitle('Zero-Filling and Interpolation with Correct Filtering');