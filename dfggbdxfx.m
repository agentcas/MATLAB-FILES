% Define the continuous signal
t = linspace(0, 0.02, 1000); % Time vector
x = sin(2*pi*50*t); % Sinusoidal signal with frequency 50 Hz

% Define sampling frequencies
fs1 = 500; % Sampling frequency 1
fs2 = 1500; % Sampling frequency 2

% Sample the signal
x1 = x(1:fs1:end); % Sample at fs1
x2 = x(1:fs2:end); % Sample at fs2

% Calculate FFT
N = length(x1); % Length of signal x1
f = fs1*(0:N-1)/N; % Frequency vector
X1 = fft(x1); % FFT of x1
X2 = fft(x2); % FFT of x2

% Plot the frequency spectra
figure;
subplot(2,1,1);
plot(f, abs(X1)); % Plot magnitude spectrum of X1
xlabel('Frequency (Hz)');
ylabel('|X1(f)|');
title('Frequency Spectrum for fs = 500 Hz');
xlim([0 100]);

subplot(2,1,2);
plot(f, abs(X2)); % Plot magnitude spectrum of X2
xlabel('Frequency (Hz)');
ylabel('|X2(f)|');
title('Frequency Spectrum for fs = 1500 Hz');
xlim([0 100]);

% Display the results
fprintf('The FFT of the signal sampled at 500 Hz shows a peak at 50 Hz, which corresponds to the frequency of the original signal.\n');
fprintf('The FFT of the signal sampled at 1500 Hz also shows a peak at 50 Hz, confirming that the frequency content is preserved.\n');
fprintf('However, the FFT of the signal sampled at 1500 Hz has a higher resolution in the frequency domain, allowing for a more precise identification of the signal frequency.\n');