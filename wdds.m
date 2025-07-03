 % MATLAB Code to design a 4th-order Butterworth IIR filter
% with a cutoff frequency of 0.3π radians/sample

% Clear workspace
clear; clc; close all;

% Define filter specifications
order = 4; % Filter order
Wn = .7;  % Normalized cutoff frequency (0.3 * π radians/sample)

% Design the Butterworth filter
[b, a] = butter(order, Wn); % Get filter coefficients

% Display the coefficients
disp('Numerator coefficients (b):');
disp(b);
disp('Denominator coefficients (a):');
disp(a);

% Check stability by evaluating the poles
poles = roots(a);
disp('Poles of the filter:');
disp(poles);

% Check stability condition (poles must be inside the unit circle)
isStable = all(abs(poles) < 1);
if isStable
    disp('The filter is stable.');
else
    disp('The filter is unstable.');
end

% Generate a test input signal (white noise)
N = 1000; % Number of samples
x = randn(1, N); % Input signal (white noise)

% Direct Form I implementation
y_df1 = filter(b, a, x); % Apply filter using Direct Form I

% Plotting the results
figure;
subplot(2,1,1);
plot(x);
title('Input Signal (White Noise)');
xlabel('Sample Number');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(y_df1);
title('Output using Direct Form I');
xlabel('Sample Number');
ylabel('Amplitude');
grid on;

% Show the frequency response of the filter
figure;
freqz(b, a);
title('Frequency Response of the 4th-order Butterworth Filter');
