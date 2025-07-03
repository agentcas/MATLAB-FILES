% MATLAB code to design a low-pass FIR filter using the Hamming window

% Parameters
Fs = 1; % Sampling frequency (normalized to 1)
Fc = 0.35; % Cutoff frequency (normalized to 1, corresponds to 0.35 * pi)
N = 21; % Filter order (must be odd for symmetric FIR filter)

% Calculate the ideal low-pass filter coefficients (sinc function)
n = 0:N-1; % Sample indices
wc = 2 * pi * Fc; % Cutoff frequency in radians
h_ideal = (sin(wc * (n - (N-1)/2))) ./ (pi * (n - (N-1)/2)); % Sinc function
h_ideal((N-1)/2 + 1) = wc / pi; % Handle the zero division at the center

% Apply the Hamming window
h_hamming = h_ideal .* hamming(N)';

% Normalize the filter coefficients
h_hamming = h_hamming / sum(h_hamming);

% Frequency response
[H, f] = freqz(h_hamming, 1, 1024, 'whole'); % Frequency response
f = f / (2 * pi); % Normalize frequency to cycles/sample

% Plot the filter coefficients
figure;
stem(0:N-1, h_hamming, 'filled');
title('FIR Filter Coefficients (Hamming Window)');
xlabel('n');
ylabel('h[n]');
grid on;

% Plot the frequency response
figure;
plot(f, 20*log10(abs(H)));
title('Frequency Response of the Low-Pass FIR Filter');
xlabel('Normalized Frequency (cycles/sample)');
ylabel('Magnitude (dB)');
grid on;
axis tight;
ylim([-100 5]); % Set y-axis limits for better visibility