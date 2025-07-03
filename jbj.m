% Define the original signal
Fs_L = 44100;  % original sample rate (44.1 kHz)
t = 0:1/Fs_L:1;  % time vector
x = sin(2*pi*1000*t);  % original signal (1 kHz sine wave)

% Define the desired sample rate
Fs_H = 48000;  % desired sample rate (48 kHz)

% Zero-filling interpolation
y_interp = resample(x, Fs_H, Fs_L, 0, 'sin c');  % Zero-filling interpolation

% Plot the original and interpolated signals
figure;
subplot(2,1,1);
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');

subplot(2,1,2);
plot((0:length(y_interp)-1)/Fs_H, y_interp);
xlabel('Time (s)');
ylabel('Amplitude');
title('Interpolated Signal');