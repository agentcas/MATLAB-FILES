% Given sample rates
Sampling_in = 44100; % Input sample rate (44.1 kHz)
Frequency_in = 48000; % Output sample rate (48 kHz)

% Find the least common multiple for upsampling and downsampling
[L, M] = rat(Frequency_in / Sampling_in); % Rational fraction approximation of conversion ratio

% Example signal: A simple sine wave for demonstration
t = 0:1/Sampling_in:1; % Time vector for 1 second of audio
f = 1000;        % Frequency of the sine wave (1 kHz tone)
x = sin(2 * pi * f * t); % Original signal (44.1 kHz sine wave)

% Step 1: Zero Filling
% Upsample the signal by L (increasing the sample rate)
x_upsampled = upsample(x, L); % Insert L-1 zeros between samples

% Step 2: Low Pass Filtering
% Design a low-pass filter (anti-aliasing filter)
Fc = min(Sampling_in, Frequency_in) / 2; % Cutoff frequency (Nyquist frequency of the lower sample rate)
n = 100; % Filter order
h = fir1(n, 2*Fc/(Sampling_in*L)); % Low-pass filter design (normalized frequency)

% Filter the upsampled signal to remove high-frequency components introduced by zero filling
x_filtered = conv(x_upsampled, h, 'same'); % Apply the low-pass filtering

% Step 3: Downsampling
% Downsample the filtered signal by M (reducing the sample rate)
x_downsampled = downsample(x_filtered, M);

% Time vectors for plotting
t_upsampled = 0:1/(Sampling_in*L):1-1/(Sampling_in*L);  % Adjust the time axis for the upsampled signal
t_downsampled = 0:1/Frequency_in:(length(x_downsampled)-1)/Frequency_in;  % Time vector for downsampled signal

% Plotting the results
figure;

% Plot the original signal
subplot(4,1,1);
plot(t, x, 'b');
title('Original Signal (44.1 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the upsampled signal with 159 zero filling
subplot(4,1,2);
stem(t_upsampled(1:1000), x_upsampled(1:1000), 'g', 'MarkerFaceColor', 'k'); % Use stem for the inserted zeros = 159 visualization
hold on;
stem(t(1:100), x(1:100), 'm', 'MarkerFaceColor', 'c'); % Show original samples for comparison
title(['Upsampled Signal with Zero Filling (', num2str(L*Sampling_in), ' Hz)']);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Inserted zeros', 'Original Samples');
axis tight;

% Plot the signal after low-pass filtering
subplot(4,1,3);
plot(t_upsampled(1:1000), x_filtered(1:1000), 'g');
title('Interpolated Signal After Low-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the final downsampled signal (converted signal)
subplot(4,1,4);
plot(t_downsampled(1:1000), x_downsampled(1:1000), 'y');
title('Downsampled Signal (48 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Filter Frequency Response
figure;
fvtool(h, 'Fs', L*Sampling_in);  % Frequency response of the low-pass filter
title('Low-pass Filter Frequency Response')

%% SOUND PLAYBACK
sound(x, Sampling_in); % Play original signal at 44.1 kHz
pause(2); % Pause for duration of original sound to finish before playing next sound
sound(x_downsampled, Frequency_in); % Play converted signal at 48 kHz