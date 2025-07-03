% Define the signal parameters
f = 10; % Frequency of the signal (Hz)
t = 0:0.001:1; % Time vector (seconds)

% Generate the continuous-time signal
x3 = sin(2*pi*f*t);

% Define the sampling rates
Fs_proper = 100; % Proper sampling rate (Hz)
Fs_undersampled = 18; % Under-sampled rate (Hz)

% Sample the signal at the proper rate
x3_sampled_proper = x3(1:Fs_proper:end);
t_sampled_proper = t(1:Fs_proper:end);

% Sample the signal at the under-sampled rate
x3_sampled_undersampled = x3(1:Fs_undersampled:end);
t_sampled_undersampled = t(1:Fs_undersampled:end);

% Plot the results
figure;
subplot(2,1,1);
plot(t, x3, 'b-', 'LineWidth', 2);
hold on;
stem(t_sampled_proper, x3_sampled_proper, 'r*');
title('Original Signal and Properly Sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Properly Sampled Signal');

subplot(2,1,2);
plot(t, x3, 'b-', 'LineWidth', 2);
hold on;
stem(t_sampled_undersampled, x3_sampled_undersampled, 'r*');
title('Original Signal and Under-sampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Under-sampled Signal');

% Adjust the spacing between subplots
sgtitle('Effect of Sampling Rate on Signal Reconstruction');