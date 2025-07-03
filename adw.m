% Define the sampling frequency
Fs = 20; % Hz

% Define the time vector
t = 0:1/Fs:1;

% Define the original signal (a sine wave)
x = sin(2*pi*5*t); 

% Plot the original signal
figure;
plot(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');

% Reconstruct the signal using a sampling rate of Fs1 = 2
Fs1 = 2; 
t1 = 0:1/Fs1:1;
x1 = sin(2*pi*5*t1);

% Plot the reconstructed signal with Fs1
figure;
plot(t1,x1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Signal (Fs1)');

% Reconstruct the signal using a sampling rate of Fs2 = 5
Fs2 = 5; 
t2 = 0:1/Fs2:1;
x2 = sin(2*pi*5*t2);

% Plot the reconstructed signal with Fs2
figure;
plot(t2,x2);
xlabel('Time (s)');
ylabel('Amplitude');
title('Reconstructed Signal (Fs2)');