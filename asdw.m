% Define the signal parameters
f0 = 50; % Signal frequency in Hz
T = 1/f0; % Period of the signal
fs1 = 500; % Sampling frequency for the first case
fs2 = 1500; % Sampling frequency for the second case
N = 1024; % Number of samples for FFT

% Generate the time vector
t = linspace(0, 4*T, N);

% Generate the continuous signal
x = sin(2*pi*f0*t);

% Generate the sampled signals
x1 = sin(2*pi*f0*(0:1/fs1:4*T)); 
x2 = sin(2*pi*f0*(0:1/fs2:4*T)); 

% Calculate the FFT of the signals
X = fft(x, N);
X1 = fft(x1, N);
X2 = fft(x2, N);

% Calculate the frequency vector
f = fs1*(0:N-1)/N; 

% Plot the frequency spectra
figure;
subplot(3,1,1);
plot(f, abs(X)/N);
title('Continuous signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0, 2*f0]);

subplot(3,1,2);
plot(f, abs(X1)/N);
title('fs = 500 Hz');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0, 2*f0]);

subplot(3,1,3);
plot(f, abs(X2)/N);
title('fs = 1500 Hz');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0, 2*f0]);

% Display the plots
sgtitle('Frequency Spectra of Sampled Signals');