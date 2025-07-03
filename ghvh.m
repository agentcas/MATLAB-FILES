% Original sampling frequency
original_sampling_frequency = 45.2e3; % Hz

% Upsampling factor
upsampling_factor = 150;

% Low-pass filter specifications
cutoff_frequency = 1000; % Hz
filter_order = 5;

% Upsample the signal
upsampled_signal = upsample(original_signal, upsampling_factor);

% Calculate the new sampling frequency
new_sampling_frequency = original_sampling_frequency * upsampling_factor;

% Design a low-pass filter
[b, a] = butter(filter_order, cutoff_frequency / (new_sampling_frequency / 2));

% Filter the upsampled signal
filtered_signal = filter(b, a, upsampled_signal);

% Plot the original, upsampled, and filtered signals
figure;
subplot(3, 1, 1);
plot(original_signal);
title('Original Signal (45.2 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(upsampled_signal);
title('Upsampled Signal with Zero Filling (7156000 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(filtered_signal);
title('Interpolated Signal After Low-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude');

% Calculate and plot the frequency response of the filter
[h, f] = freqz(b, a, 1024);
figure;
plot(f, 20*log10(abs(h)));
title('Low-pass Filter Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
