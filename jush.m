% Filter specifications
fc = 0.26 * pi; % Cutoff frequency in radians/sample
Fs = 1; % Normalized frequency (1 corresponds to pi radians/sample)
N = 21; % Filter order (must be odd for symmetric FIR filter)

% Calculate the ideal low-pass filter coefficients (sinc function)
n = 0:N-1; % Sample indices
wc = fc / Fs; % Normalized cutoff frequency
h_ideal = (sin(wc * (n - (N-1)/2))) ./ (pi * (n - (N-1)/2)); % Sinc function

% Handle the division by zero at the center
h_ideal((N-1)/2 + 1) = wc / pi; % Set the center value

% Apply the Hamming window
hamming_window = hamming(N)'; % Hamming window
h = h_ideal .* hamming_window; % Windowed filter coefficients

% Normalize the filter coefficients
h = h / sum(h); % Ensure unity gain at DC

% Frequency response
[H, f] = freqz(h, 1, 1024); % Frequency response

% Plot the frequency response
figure;
subplot(2, 1, 1);
plot(f/pi, 20*log10(abs(H))); % Convert to dB
title('Frequency Response of Low-Pass FIR Filter');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;

% Plot the impulse response
subplot(2, 1, 2);
stem(0:N-1, h, 'filled');
title('Impulse Response of Low-Pass FIR Filter');
xlabel('Sample Index');
ylabel('Amplitude');
grid on;

% Optional: Filter a sample input signal
N_samples = 100; % Number of samples for input signal
x = randn(1, N_samples); % Input signal (white noise)
y = filter(h, 1, x); % Filter the input signal

% Plot the input and output signals
figure;
subplot(2, 1, 1);
plot(x);
title('Input Signal x[n]');
xlabel('Sample Index');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(y);
title('Output Signal y[n] (Filtered)');
xlabel('Sample Index');
ylabel('Amplitude');