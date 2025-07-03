% Given sample rates
Fs_in = 44100; % Input sample rate (44.1 kHz)
Fs_out = 48000; % Output sample rate (48 kHz)

% Find the least common multiple for upsampling and downsampling
[L, M] = rat(Fs_out / Fs_in); % Rational fraction approximation of conversion ratio

% Example signal: a simple sine wave for demonstration
t = 0:1/Fs_in:1; % Time vector for 1 second of audio
f = 1000; % Frequency of the sine wave (1 kHz)
x = sin(2 * pi * f * t); % Original signal (44.1 kHz sine wave)

%% STEP 1: ZERO FILLING
% Upsample the signal by L (increasing the sample rate)
x_upsampled = upsample(x, L); % Insert L-1 zeros between samples

%% STEP 2: LOW PASS FILTERING
% Design a low-pass filter (anti-aliasing filter)
Fc = min(Fs_in, Fs_out) / 2; % Cutoff frequency (Nyquist frequency of the lower sample rate)
n = 100; % Filter order
h = fir1(n, 2 * Fc / Fs_out); % Low-pass filter design (normalized frequency)

% Filter the upsampled signal to remove high-frequency components introduced by zero filling
x_filtered = conv(x_upsampled, h, 'same'); % Apply low-pass filtering

%% STEP 3: DOWNSAMPLING
% Downsample the filtered signal by M (reducing the sample rate)
x_downsampled = downsample(x_filtered, M);

%% PLOTTING THE RESULTS
% Time vectors for plotting
t_upsampled = 0:1/(Fs_in*L):(length(x_upsampled)-1)/(Fs_in*L);
t_downsampled = 0:1/Fs_out:(length(x_downsampled)-1)/Fs_out;

figure;
% Plot the original signal
subplot(6,1,1);
plot(t, x);
title('Original Signal (44.1 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Find non-zero indices in the upsampled signal
non_zero_idx = find(x_upsampled ~= 0);

% Plot the upsampled signal with zero filling (inserted zeros)
subplot(6,1,2);
plot(t_upsampled(1:1000), x_upsampled(1:1000));
hold on;
title(['Upsampled Signal with Zero Filling (', num2str(L * Fs_in), ' Hz)']);
legend('Original samples', 'Inserted zeros');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the upsampled signal amplitude and the number of inserted zeros
subplot(6,1,3);
plot(t_upsampled(1:500), x_upsampled(1:500), 'g');
title('Amplitude of the Upsampled Signal (Including Inserted zeros)');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the signal after low-pass filtering (interpolated signal)
subplot(6,1,4);
plot(t_upsampled(1:min(1000,length(t_upsampled))), x_filtered(1:min(1000,length(x_filtered))));
title('Interpolated Signal After Low-pass Filtering');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the final downsampled signal (converted signal)
subplot(6,1,5);
plot(t_downsampled(1:min(1000,length(t_downsampled))), x_downsampled(1:min(1000,length(x_downsampled))));
title('Downsampled Signal (48 kHz)');
xlabel('Time (s)');
ylabel('Amplitude');
axis tight;

% Plot the filter's magnitude response
figure;
fvtool(h, 'Fs', Fs_out); % Use Fs_out for frequency response
title('Low-pass Filter Frequency Response');

%% SOUND PLAYBACK
sound(x, Fs_in); % Play original signal at 44.1 kHz
pause(2); % Pause for duration of original sound to finish before playing next sound
sound(x_downsampled, Fs_out); % Play converted signal at 48 kHz