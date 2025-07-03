% Define the signal parameters
f = 50; % Signal frequency in Hz
fs1 = 500; % Sampling frequency 1
fs2 = 1500; % Sampling frequency 2
t = 0:1/fs1:0.2; % Time vector for continuous signal
t1 = 0:1/fs1:0.2; % Time vector for sampling frequency 1
t2 = 0:1/fs2:0.2; % Time vector for sampling frequency 2

% Generate the continuous signal
x_cont = sin(2*pi*f*t); 

% Sample the signal at the two different frequencies
x_500 = sin(2*pi*f*t1);
x_1500 = sin(2*pi*f*t2);

% Perform FFT on each signal
X_cont = fft(x_cont);
X_500 = fft(x_500);
X_1500 = fft(x_1500);

% Calculate the frequency axis for the FFT
f_axis = (0:length(X_cont)-1)*fs1/length(X_cont);

% Plot the FFT results
figure;
subplot(3,1,1);
plot(f_axis, abs(X_cont));
title('Continuous Signal FFT');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,2);
plot(f_axis, abs(X_500));
title('Sampled Signal (fs = 500 Hz) FFT');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(3,1,3);
plot(f_axis, abs(X_1500));
title('Sampled Signal (fs = 1500 Hz) FFT');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Adjust the figure for better viewing
sgtitle('Frequency Spectrum Comparison');
tightfig;