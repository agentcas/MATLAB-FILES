% Given sample rates
Fs_in = 44100; % Original sample rate (44.1 kHz)
Fs_out = 48000; % Target sample rate (48 kHz)
% Calculate the least common multiple for resampling
[L, M] = rat(Fs_out / Fs_in); % Approximated conversion ratio using rational fraction
% Generate example signal: 1-second sine wave
duration = 1; % Time duration (1 second)
t_orig = 0:1/Fs_in:duration; % Time vector for original signal
freq_tone = 1000; % Tone frequency (1 kHz)
signal_orig = sin(2 * pi * freq_tone * t_orig); % Original 1 kHz sine wave at 44.1 kHz
% Step 1: Zero padding (Upsampling)
signal_upsampled = upsample(signal_orig, L); % Zero-padding by L
% Step 2: Anti-aliasing filter design (Low-pass filter)
cutoff_freq = min(Fs_in, Fs_out) / 2; % Nyquist frequency of the lower sample rate
filter_order = 101; % Increased filter order for better attenuation
lp_filter = fir1(filter_order, 2*cutoff_freq/(Fs_in*L)); % Low-pass FIR filter design
% Filter the signal after upsampling
signal_filtered = conv(signal_upsampled, lp_filter, 'same'); % Convolve with FIR filter
% Step 3: Downsampling
signal_resampled = downsample(signal_filtered, M); % Downsample by M
% Time vectors for plotting
t_upsampled = 0:1/(Fs_in*L):duration-1/(Fs_in*L); % Adjusted time axis after upsampling
t_resampled = 0:1/Fs_out:(length(signal_resampled)-1)/Fs_out; % Time axis for the final resampled signal
% Plotting the original and processed signals
figure;
subplot(4,1,1);
plot(t_orig, signal_orig, 'b');
title('Original 44.1 kHz Signal');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;
% Plot the upsampled signal (with inserted zeros)
subplot(4,1,2);
stem(t_upsampled(1:1000), signal_upsampled(1:1000), 'k', 'MarkerFaceColor', 'y');
hold on;
stem(t_orig(1:100), signal_orig(1:100), 'c', 'MarkerFaceColor', 'm');
title(['Upsampled Signal with Zero Padding (', num2str(L*Fs_in), ' Hz)']);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Zero Padding', 'Original Samples');
axis tight;
% Plot the filtered signal after upsampling
subplot(4,1,3);
plot(t_upsampled(1:1000), signal_filtered(1:1000), 'k');
title('Filtered Upsampled Signal');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;
% Plot the final downsampled signal
subplot(4,1,4);
plot(t_resampled(1:1000), signal_resampled(1:1000), 'm');
title('Resampled Signal at 48 kHz');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Playback of original and resampled signals
sound(signal_orig, Fs_in); % Play the original signal at 44.1 kHz
pause(2); % Wait for the original signal to finish
sound(signal_resampled, Fs_out); % Play the resampled signal at 48 kHz