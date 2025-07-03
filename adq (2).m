% MATLAB Code to design a low-pass FIR filter and quantize its coefficients

% Clear workspace
clear; clc; close all;

% Design parameters
N = 20; % Filter order
fc = 0.25; % Normalized cutoff frequency (0.25 * Nyquist frequency)

% Design the low-pass FIR filter using Hamming window
b = fir1(N, fc, hamming(N + 1)); % FIR filter coefficients

% Display the original coefficients
disp('Original Filter Coefficients:');
disp(b);

% Quantization function
quantize_coefficients = @(coeffs, bits) round(coeffs * (2^(bits - 1) - 1)) / (2^(bits - 1) - 1);

% Quantize to 8-bit and 16-bit precision
b_8bit = quantize_coefficients(b, 7);
b_16bit = quantize_coefficients(b, 15);

% Display the quantized coefficients
disp('8-bit Quantized Filter Coefficients:');
disp(b_8bit);
disp('16-bit Quantized Filter Coefficients:');
disp(b_16bit);

% Frequency response of the original and quantized filters
[H_orig, F_orig] = freqz(b, 1, 512);
[H_8bit, F_8bit] = freqz(b_8bit, 1, 512);
[H_16bit, F_16bit] = freqz(b_16bit, 1, 512);

% Plotting the frequency responses
figure;
subplot(3,1,1);
plot(F_orig/pi, 20*log10(abs(H_orig)), 'LineWidth', 1.5);
title('Original Filter Frequency Response');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;

subplot(3,1,2);
plot(F_8bit/pi, 20*log10(abs(H_8bit)), 'LineWidth', 1.5);
title('8-bit Quantized Filter Frequency Response');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;

subplot(3,1,3);
plot(F_16bit/pi, 20*log10(abs(H_16bit)), 'LineWidth', 1.5);
title('16-bit Quantized Filter Frequency Response');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;

% Show the figure
sgtitle('Frequency Response Comparison of Original and Quantized Filters');