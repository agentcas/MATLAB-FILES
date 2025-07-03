% Given sample rates
Fs_in = 41000; % Input sample rate (44.1 kHz)
Fs_out = 50000; % Output sample rate (48 kHz)

% Find the least common multiple for upsampling and downsampling
[L, M] = rat(Fs_out / Fs_in); % Rational fraction approximation of conversion ratio

% Example signal: a simple sine wave for demonstration
t = 0:1/Fs_in:1; % Time vector for 1 second of audio
f = 1000;
x = sin(2 * pi * f * t); % Original signal (44.1 kHz sine wave)

%% STEP 1: ZERO FILLING
% Upsample the signal by L (increasing the sample rate)
% Zero filling means adding L-1 zeros between every original sample
x_upsampled = upsample(x, L); % Insert L-1 zeros between samples

%% STEP 2: LOW PASS FILTERING
% Design a low-pass filter (anti-aliasing filter)
% Use a low-pass FIR filter to remove aliasing
Fc = min(Fs_in, Fs_out) / 2; % Cutoff frequency (Nyquist frequency of the lower sample rate)
n = 100; % Filter order
h = fir1(n, 2 * Fc / (L * Fs_in)); % Low-pass filter design (normalized frequency)

% Filter the upsampled signal to remove high-frequency components introduced by zero filling
x_filtered = conv(x_upsampled, h, 'same'); % Apply low-pass filtering

%% STEP 3: DOWNSAMPLING
% Downsample the filtered signal by M (reducing the sample rate)
x_downsampled = downsample(x_filtered, M);

%% PLOTTING THE RESULTS
% Time vectors for plotting
t_upsampled = 0:1/(Fs_in*L):1;
t_downsampled = 0:1/Fs_out:(length(x_downsampled)-1)/Fs_out;

figure;
% Plot the original signal
subplot(4,1,1);
plot(t, x);
title('Original Signal (44.1 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the upsampled signal with 159 zero filling
subplot(4,1,2);
stem(t_upsampled(1:1000), x_upsampled(1:1000), 'r', 'MarkerFaceColor', 'r'); % Use stem for the inserted zeros = 159 visualization
hold on;
stem(t(1:100), x(1:100), 'g', 'MarkerFaceColor', 'g'); % Show original samples for comparison
title(['Upsampled Signal with Zero Filling (', num2str(L*Fs_in), ' Hz)']);
xlabel('Time (s)');
ylabel('Amplitude');
legend('Inserted zeros', 'Original Samples');
axis tight;

% Plot the signal after low-pass filtering (interpolated signal)
subplot(4,1,3);
plot(t_upsampled(1:1000), x_filtered(1:1000));
title('Interpolated Signal After Low-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the final downsampled signal (converted signal)
subplot(4,1,4);
plot(t_downsampled(1:1000), x_downsampled(1:1000));
title('Downsampled Signal (48 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

%% FILTER FREQUENCY RESPONSE
% Plot the filter's magnitude response
figure;
fvtool(h, 'Fs', L*Fs_in);
title('Low-pass Filter Frequency Response');

% SOUND PLAYBACK (OPTIONAL)
% sound(x, Fs_in); % Original signal (44.1 kHz)
% sound(x_downsampled, Fs_out); % Converted signal (48 kHz)